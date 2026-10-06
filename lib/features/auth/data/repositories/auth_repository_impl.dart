import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:heuser_erp_mobile/core/auth/auth_signals.dart';
import 'package:heuser_erp_mobile/core/auth/session_token_store.dart';
import 'package:heuser_erp_mobile/core/env/app_env.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/core/network/failure_mapper.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/auth/data/datasources/allauth_api.dart';
import 'package:heuser_erp_mobile/features/auth/data/datasources/apple_auth_service.dart';
import 'package:heuser_erp_mobile/features/auth/data/datasources/google_auth_service.dart';
import 'package:heuser_erp_mobile/features/auth/data/datasources/social_auth_api.dart';
import 'package:heuser_erp_mobile/features/auth/data/models/allauth_response.dart';
import 'package:heuser_erp_mobile/features/auth/data/repositories/session_snapshot_store.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_outcome.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_repository.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_user.dart';
import 'package:heuser_erp_mobile/features/auth/domain/social_precheck.dart';
import 'package:heuser_erp_mobile/features/me/data/me_api.dart';
import 'package:heuser_erp_mobile/features/me/domain/abilities.dart';

part 'auth_repository_account.dart';
part 'auth_repository_social.dart';
part 'auth_repository_transitions.dart';

/// [AuthRepository] over the allauth app client. The serialisation of
/// sign-in/sign-out and the credential-swap window are ported from
/// sms-flutter, where both fixed real outages (see `auth_repository_transitions.dart`).
class AuthRepositoryImpl
    with _AuthTransitions, _SocialFlows, _AccountFlows
    implements AuthRepository {
  /// Creates the repository.
  AuthRepositoryImpl({
    required this._allauth,
    required this._social,
    required this._me,
    required this._tokens,
    required this._snapshots,
    required this._signals,
    required this._env,
    this._google,
    this._apple,
    this.onLocalWipe = const [],
  }) {
    _signals.onSessionRejected = (uri, code) =>
        unawaited(handleSessionRejected());
  }

  static const _abilitiesBudget = Duration(seconds: 4);

  @override
  final AllauthApi _allauth;
  @override
  final SocialAuthApi _social;
  final MeApi _me;
  @override
  final SessionTokenStore _tokens;
  @override
  final SessionSnapshotStore _snapshots;
  @override
  final AuthSignals _signals;
  @override
  final AppEnv _env;
  @override
  final GoogleAuthService? _google;
  @override
  final AppleAuthService? _apple;

  /// Cache clearers run on every sign-in and sign-out (repositories register
  /// themselves so a second account never sees the first one's data).
  @override
  final List<void Function()> onLocalWipe;

  final _events = StreamController<SessionEvent>.broadcast();
  @override
  AuthUser? _user;
  Abilities _abilities = Abilities.none;
  @override
  Map<String, dynamic>? _abilitiesJson;
  @override
  String? _pendingEmail;

  @override
  Stream<SessionEvent> get events => _events.stream;

  @override
  AuthUser? get currentUser => _user;

  @override
  Abilities get abilities => _abilities;

  @override
  Future<bool> hasSession() async {
    final t = await _tokens.read();
    return t != null && t.isNotEmpty;
  }

  // --- cold start -----------------------------------------------------------

  @override
  Future<Result<AuthOutcome>> restoreSession() async {
    if (!await hasSession()) {
      _emitSignedOut(SignOutReason.none);
      return ok(const AuthOutcome.signedOut(SignOutReason.none));
    }
    final AllauthResponse session;
    try {
      session = await _allauth.getSession();
    } on DioException catch (e) {
      final failure = FailureMapper.fromDio(e);
      if (failure.isConnectivity) {
        final snapshot = await _snapshots.read();
        if (snapshot != null) {
          _user = snapshot.user;
          _applyAbilitiesJson(snapshot.abilities);
          _events.add(
            SessionEvent.signedIn(
              user: _user!,
              abilities: _abilities,
              fromSnapshot: true,
            ),
          );
          return ok(
            AuthOutcome.authenticated(
              user: _user!,
              abilities: _abilities,
              fromSnapshot: true,
            ),
          );
        }
        _emitSignedOut(SignOutReason.offline, keepToken: true);
        return ok(const AuthOutcome.signedOut(SignOutReason.offline));
      }
      await _wipeLocal();
      _emitSignedOut(SignOutReason.serverRejected);
      return fail(failure);
    }
    if (session.isOk && session.user != null) {
      return await _completeSignIn(session.user!);
    }
    if (session.hasPendingFlow) {
      final snapshot = await _snapshots.read();
      return await _emitPending(
        session,
        _pendingEmail ?? snapshot?.user.email ?? '',
      );
    }
    // 401 / 410: a reachable server says the token is dead. Definitive.
    await _wipeLocal();
    _emitSignedOut(
      session.sessionGone
          ? SignOutReason.expired
          : SignOutReason.serverRejected,
    );
    return ok(
      AuthOutcome.signedOut(
        session.sessionGone
            ? SignOutReason.expired
            : SignOutReason.serverRejected,
      ),
    );
  }

  // --- password flows -------------------------------------------------------

  @override
  Future<Result<AuthOutcome>> login({
    required String email,
    required String password,
  }) => _signInTransition(
    () => _allauth.login(email: email, password: password),
    email: email,
  );

  @override
  Future<Result<AuthOutcome>> signup({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
    String? cnic,
    String? phone,
  }) => _signInTransition(
    () => _allauth.signup(
      email: email,
      password: password,
      username: 'usr_${_AuthTransitions._randomHex(16)}',
      firstName: firstName,
      lastName: lastName,
      cnic: cnic,
      phone: phone,
    ),
    email: email,
  );

  @override
  Future<Result<Abilities>> refreshAbilities() async {
    final r = await _me.fetchAbilities();
    return r.map((pair) {
      _abilities = pair.$1;
      _abilitiesJson = pair.$2;
      if (_user != null) {
        unawaited(_snapshots.write(user: _user!, abilities: _abilitiesJson));
      }
      return pair.$1;
    });
  }

  // --- session end ----------------------------------------------------------

  @override
  Future<void> handleSessionRejected() async {
    if (_user == null && await _tokens.read() == null) return;
    await _wipeLocal();
    _emitSignedOut(SignOutReason.serverRejected);
  }

  @override
  Future<void> signOut() => _runTransition(_Transition.signOut, () async {
    // Local state goes first and the captured token is handed to the
    // best-effort server work explicitly, so a slow logout can never wipe
    // the token a newer login has stored.
    final token = await _tokens.read();
    await _wipeLocal();
    _emitSignedOut(SignOutReason.userSignedOut);
    try {
      await _allauth.logout(sessionToken: token);
    } on Object catch (_) {
      // Server session expires on its own.
    }
    await _google?.signOut();
  });

  // --- shared ---------------------------------------------------------------

  @override
  Future<Result<AuthOutcome>> _completeSignIn(AuthUser user) async {
    _user = user;
    _pendingEmail = null;
    try {
      await refreshAbilities().timeout(_abilitiesBudget);
    } on Object catch (_) {
      // Offline or slow: keep whatever the snapshot had.
      final snapshot = await _snapshots.read();
      _applyAbilitiesJson(snapshot?.abilities);
    }
    await _snapshots.write(user: user, abilities: _abilitiesJson);
    _events.add(SessionEvent.signedIn(user: user, abilities: _abilities));
    return ok(AuthOutcome.authenticated(user: user, abilities: _abilities));
  }

  void _applyAbilitiesJson(Map<String, dynamic>? json) {
    _abilitiesJson = json;
    try {
      _abilities = json == null ? Abilities.none : Abilities.fromJson(json);
    } on Object catch (_) {
      _abilities = Abilities.none;
    }
  }

  @override
  Future<Result<AuthOutcome>> _emitPending(
    AllauthResponse r,
    String email,
  ) async {
    final token = r.sessionToken;
    if (token != null) await _tokens.write(token);
    _pendingEmail = email;
    final flow = r.pendingFlow!;
    _events.add(SessionEvent.pending(flow: flow, email: email));
    return ok(AuthOutcome.pending(flow: flow, email: email));
  }

  void _emitSignedOut(SignOutReason reason, {bool keepToken = false}) {
    _user = null;
    _abilities = Abilities.none;
    _events.add(SessionEvent.signedOut(reason));
  }

  @override
  Future<void> _wipeLocal() async {
    _user = null;
    _abilities = Abilities.none;
    _abilitiesJson = null;
    for (final clear in onLocalWipe) {
      try {
        clear();
      } on Object catch (_) {}
    }
    await _snapshots.clear();
    await _tokens.clear();
  }

  /// Releases streams.
  Future<void> dispose() => _events.close();
}
