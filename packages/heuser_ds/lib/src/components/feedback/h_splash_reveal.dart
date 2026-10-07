import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/tokens/h_motion.dart';

/// The hand-off from the native launch screen: the white lockup on the
/// launch navy covers [child] until [ready], then the logo lifts and fades
/// and the navy dissolves into the app (under 1 s).
///
/// The launch navy is fixed brand identity, not a theme role: it must match
/// the native splash (`flutter_native_splash.yaml`) whatever preset is on.
/// With [play] false (warm start) or reduced motion it gets out of the way
/// at once. Decorative: excluded from semantics.
class HSplashReveal extends StatefulWidget {
  /// Wraps [child].
  const HSplashReveal({
    required this.ready,
    required this.child,
    this.play = true,
    this.onDone,
    super.key,
  });

  /// The native launch-screen colour.
  static const Color launchColor = Color(0xFF000F1D);

  /// Width of the lockup, matching the native splash image (1200 px @4x).
  static const double logoWidth = 220;

  /// Length of the whole reveal.
  static const Duration duration = Duration(milliseconds: 900);

  /// The app has its first real screen; start revealing.
  final bool ready;

  /// Play the reveal (false on a warm start: show [child] straight away).
  final bool play;

  /// Called once the overlay is gone.
  final VoidCallback? onDone;

  /// The app.
  final Widget child;

  @override
  State<HSplashReveal> createState() => _HSplashRevealState();
}

class _HSplashRevealState extends State<HSplashReveal>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: HSplashReveal.duration,
  )..addStatusListener(_onStatus);
  late bool _done = !widget.play;

  late final Animation<double> _logoScale = Tween<double>(begin: 1, end: 1.12)
      .animate(
        CurvedAnimation(
          parent: _c,
          curve: const Interval(0, 0.7, curve: HMotion.exit),
        ),
      );
  late final Animation<double> _logoOpacity = Tween<double>(
    begin: 1,
    end: 0,
  ).animate(CurvedAnimation(parent: _c, curve: const Interval(0.2, 0.65)));
  late final Animation<double> _backdrop = Tween<double>(begin: 1, end: 0)
      .animate(
        CurvedAnimation(
          parent: _c,
          curve: const Interval(0.4, 1, curve: HMotion.easeOut),
        ),
      );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _maybeStart();
  }

  @override
  void didUpdateWidget(HSplashReveal old) {
    super.didUpdateWidget(old);
    _maybeStart();
  }

  void _maybeStart() {
    if (_done || !widget.ready || _c.isAnimating || _c.isCompleted) return;
    if (!context.h.motion.enabled) {
      _finish();
      return;
    }
    _c.forward();
  }

  void _onStatus(AnimationStatus s) {
    if (s == AnimationStatus.completed) _finish();
  }

  void _finish() {
    if (_done || !mounted) return;
    setState(() => _done = true);
    widget.onDone?.call();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_done) return widget.child;
    return Stack(
      fit: StackFit.expand,
      children: [
        widget.child,
        IgnorePointer(
          ignoring: widget.ready,
          child: ExcludeSemantics(
            child: FadeTransition(
              opacity: _backdrop,
              child: ColoredBox(
                color: HSplashReveal.launchColor,
                child: Center(
                  child: FadeTransition(
                    opacity: _logoOpacity,
                    child: ScaleTransition(
                      scale: _logoScale,
                      child: SvgPicture.asset(
                        'assets/brand/logo-white.svg',
                        package: 'heuser_ds',
                        width: HSplashReveal.logoWidth,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
