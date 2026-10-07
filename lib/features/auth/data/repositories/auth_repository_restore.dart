part of 'auth_repository_impl.dart';

/// Cold start: the stored token is checked against the server within a
/// budget; anything short of a definitive 401/410 keeps the session and
/// falls back to the last snapshot.
extension _Restore on AuthRepositoryImpl {
  Future<Result<AuthOutcome>> _restore() async {
    if (!await hasSession()) {
      _emitSignedOut(SignOutReason.none);
      return ok(const AuthOutcome.signedOut(SignOutReason.none));
    }
    final AllauthResponse session;
    try {
      session = await _allauth.getSession().timeout(
        AuthRepositoryImpl._restoreBudget,
      );
    } on Object catch (_) {
      // No verdict (offline, slow, or a 5xx during a deploy): only a 401/410
      // answer may end a session, so keep the token and use the snapshot.
      return await _restoreFromSnapshot();
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

  Future<Result<AuthOutcome>> _restoreFromSnapshot() async {
    final snapshot = await _snapshots.read();
    if (snapshot == null || snapshot.abilities == null) {
      _emitSignedOut(SignOutReason.offline);
      return ok(const AuthOutcome.signedOut(SignOutReason.offline));
    }
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
}
