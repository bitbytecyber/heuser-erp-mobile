import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/app/security/app_lock_cubit.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/bloc/auth_bloc.dart';

/// Covers the app with the lock screen while [AppLockCubit] says so and a
/// session exists. Feeds the app lifecycle to the cubit and opens the
/// system prompt as soon as the lock appears.
class AppLockGate extends StatefulWidget {
  /// Wraps [child].
  const AppLockGate({required this.child, super.key});

  /// The routed app.
  final Widget child;

  @override
  State<AppLockGate> createState() => _AppLockGateState();
}

class _AppLockGateState extends State<AppLockGate> {
  late final AppLifecycleListener _lifecycle;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<AppLockCubit>();
    _lifecycle = AppLifecycleListener(
      onHide: cubit.paused,
      onShow: cubit.resumed,
    );
  }

  @override
  void dispose() {
    _lifecycle.dispose();
    super.dispose();
  }

  void _prompt() {
    final t = Translations.of(context);
    unawaited(context.read<AppLockCubit>().unlock(t.lock.reason));
  }

  @override
  Widget build(BuildContext context) {
    final signedIn = context.select<AuthBloc, bool>(
      (b) => b.state.isAuthenticated,
    );
    // On a cold start the lock engages before the session is restored, so
    // the prompt opens when the user becomes signed in, not only on lock.
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (a, b) => !a.isAuthenticated && b.isAuthenticated,
      listener: (context, _) {
        final lock = context.read<AppLockCubit>().state;
        if (lock.locked && !lock.busy) {
          WidgetsBinding.instance.addPostFrameCallback((_) => _prompt());
        }
      },
      child: BlocConsumer<AppLockCubit, AppLockState>(
        listenWhen: (a, b) => !a.locked && b.locked,
        listener: (_, _) {
          if (signedIn) {
            WidgetsBinding.instance.addPostFrameCallback((_) => _prompt());
          }
        },
        builder: (context, s) {
          final show = s.locked && signedIn;
          return Stack(
            children: [
              // Kept mounted (and hidden from assistive tech) so state survives.
              ExcludeSemantics(excluding: show, child: widget.child),
              if (show) _LockScreen(busy: s.busy, onUnlock: _prompt),
            ],
          );
        },
      ),
    );
  }
}

class _LockScreen extends StatelessWidget {
  const _LockScreen({required this.busy, required this.onUnlock});

  final bool busy;
  final VoidCallback onUnlock;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final c = context.h.colors;
    return Positioned.fill(
      child: ColoredBox(
        color: c.surface,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(HSpace.x6),
            child: Column(
              children: [
                const Spacer(),
                Container(
                  width: HSpace.x16,
                  height: HSpace.x16,
                  decoration: BoxDecoration(
                    color: c.brandSoft,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: HIcon(
                      HIcons.fingerprint,
                      size: HIconSize.xl,
                      tone: HTextTone.brand,
                    ),
                  ),
                ).hScaleIn(context),
                HSpace.gap4,
                HText(
                  t.lock.title,
                  style: HTextStyle.headlineMd,
                  align: TextAlign.center,
                ),
                HSpace.gap2,
                HText(
                  t.lock.body,
                  tone: HTextTone.secondary,
                  align: TextAlign.center,
                ),
                const Spacer(),
                HButton.filled(
                  label: t.lock.unlock,
                  icon: HIcons.fingerprint,
                  size: HButtonSize.lg,
                  loading: busy,
                  onPressed: busy ? null : onUnlock,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
