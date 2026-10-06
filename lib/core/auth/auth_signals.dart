import 'dart:async';

/// Breaks the cycle between the Dio chain and the auth repository.
///
/// The session-token interceptor needs two things the repository owns: the
/// credential-swap window to wait on, and somewhere to report a rejected
/// token. The repository needs Dio (through the api classes). So both depend
/// on this small hub instead: Dio reads it, the repository drives it.
class AuthSignals {
  Completer<void>? _swap;

  /// Called by the interceptor when the server rejected the token we hold.
  void Function(Uri uri, int statusCode)? onSessionRejected;

  /// The pending credential swap, or `null` when none is open.
  Future<void>? get credentialSwap {
    final swap = _swap;
    if (swap == null || swap.isCompleted) return null;
    return swap.future;
  }

  /// Opens the window: sign-in has dropped the old token and not yet stored
  /// the new one. Non-auth requests wait rather than flying bare.
  void beginCredentialSwap() {
    if (_swap?.isCompleted == false) return;
    _swap = Completer<void>();
  }

  /// Closes the window.
  void endCredentialSwap() {
    final swap = _swap;
    if (swap != null && !swap.isCompleted) swap.complete();
    _swap = null;
  }
}
