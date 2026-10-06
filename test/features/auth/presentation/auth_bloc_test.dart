import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart' hide fail;
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_outcome.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_repository.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_user.dart';
import 'package:heuser_erp_mobile/features/auth/domain/pending_flow.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:heuser_erp_mobile/features/me/domain/abilities.dart';
import 'package:mocktail/mocktail.dart';

class _MockRepo extends Mock implements AuthRepository;

void main() {
  const user = AuthUser(id: 1, email: 'a@b.c', firstName: 'A');
  const applicant = Abilities(capabilities: {'adm_apply.use'});
  late _MockRepo repo;
  late StreamController<SessionEvent> events;

  setUp(() {
    repo = _MockRepo();
    events = StreamController<SessionEvent>.broadcast();
    when(() => repo.events).thenAnswer((_) => events.stream);
  });

  tearDown(() => events.close());

  blocTest<AuthBloc, AuthState>(
    'started → repository emits signedIn → authenticated with portal',
    build: () {
      when(repo.restoreSession).thenAnswer((_) async {
        events.add(
          const SessionEvent.signedIn(user: user, abilities: applicant),
        );
        return ok(
          const AuthOutcome.authenticated(user: user, abilities: applicant),
        );
      });
      return AuthBloc(repo);
    },
    act: (b) => b.add(const AuthEvent.started()),
    wait: const Duration(milliseconds: 10),
    expect: () => [
      const AuthState.authenticated(
        user: user,
        abilities: applicant,
        portal: Portal.apply,
      ),
    ],
  );

  blocTest<AuthBloc, AuthState>(
    'started → no token → unauthenticated',
    build: () {
      when(repo.restoreSession).thenAnswer((_) async {
        events.add(const SessionEvent.signedOut(SignOutReason.none));
        return ok(const AuthOutcome.signedOut(SignOutReason.none));
      });
      return AuthBloc(repo);
    },
    act: (b) => b.add(const AuthEvent.started()),
    wait: const Duration(milliseconds: 10),
    expect: () => [const AuthState.unauthenticated()],
  );

  blocTest<AuthBloc, AuthState>(
    'started → failure with no event → unauthenticated(serverRejected)',
    build: () {
      when(repo.restoreSession)
          .thenAnswer((_) async => fail(const Failure.server(status: 500)));
      return AuthBloc(repo);
    },
    act: (b) => b.add(const AuthEvent.started()),
    expect: () => [
      const AuthState.unauthenticated(reason: SignOutReason.serverRejected),
    ],
  );

  blocTest<AuthBloc, AuthState>(
    'pending event → pending state',
    build: () => AuthBloc(repo),
    act: (_) => events.add(
      const SessionEvent.pending(
        flow: PendingFlow.verifyEmail(),
        email: 'a@b.c',
      ),
    ),
    wait: const Duration(milliseconds: 10),
    expect: () => [
      const AuthState.pending(flow: PendingFlow.verifyEmail(), email: 'a@b.c'),
    ],
  );

  blocTest<AuthBloc, AuthState>(
    'signOutRequested delegates to the repository',
    build: () {
      when(repo.signOut).thenAnswer(
        (_) async => events.add(
          const SessionEvent.signedOut(SignOutReason.userSignedOut),
        ),
      );
      return AuthBloc(repo);
    },
    act: (b) => b.add(const AuthEvent.signOutRequested()),
    wait: const Duration(milliseconds: 10),
    expect: () => [
      const AuthState.unauthenticated(reason: SignOutReason.userSignedOut),
    ],
    verify: (_) => verify(repo.signOut).called(1),
  );

  blocTest<AuthBloc, AuthState>(
    'appResumed refreshes abilities when restored from snapshot',
    build: () {
      when(repo.refreshAbilities).thenAnswer(
        (_) async =>
            ok(const Abilities(capabilities: {'dashboard.view_student'})),
      );
      return AuthBloc(repo);
    },
    seed: () => const AuthState.authenticated(
      user: user,
      abilities: applicant,
      portal: Portal.apply,
      fromSnapshot: true,
    ),
    act: (b) => b.add(const AuthEvent.appResumed()),
    expect: () => [
      const AuthState.authenticated(
        user: user,
        abilities: Abilities(capabilities: {'dashboard.view_student'}),
        portal: Portal.student,
      ),
    ],
  );
}
