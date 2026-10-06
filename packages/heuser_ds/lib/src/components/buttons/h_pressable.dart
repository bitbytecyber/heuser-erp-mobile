import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/foundation/h_haptics.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/tokens/h_motion.dart';

/// Interaction state exposed to [HPressable.builder].
class HPressState {
  /// Creates a state snapshot.
  const HPressState({
    required this.pressed,
    required this.hovered,
    required this.focused,
    required this.enabled,
  });

  /// Pointer down.
  final bool pressed;

  /// Mouse hover.
  final bool hovered;

  /// Keyboard focus (shows the focus ring).
  final bool focused;

  /// Not disabled.
  final bool enabled;
}

/// The press/hover/focus engine shared by every interactive component.
///
/// Gives a subtle scale-down on press, tracks hover and focus for the
/// builder, fires haptics, and exposes proper semantics. No Material ripple.
class HPressable extends StatefulWidget {
  /// Creates a pressable.
  const HPressable({
    required this.builder,
    required this.onPressed,
    this.onLongPress,
    this.haptic = true,
    this.pressedScale = 0.97,
    this.semanticsLabel,
    this.isButton = true,
    this.enabled = true,
    this.behavior = HitTestBehavior.opaque,
    super.key,
  });

  /// Builds the visual for the current state.
  final Widget Function(BuildContext context, HPressState state) builder;

  /// Tap handler; `null` disables.
  final VoidCallback? onPressed;

  /// Long-press handler.
  final VoidCallback? onLongPress;

  /// Whether a light haptic fires on tap.
  final bool haptic;

  /// Scale while pressed (1.0 = none).
  final double pressedScale;

  /// Semantics label.
  final String? semanticsLabel;

  /// Whether semantics mark this as a button.
  final bool isButton;

  /// Explicit enabled flag (in addition to a non-null [onPressed]).
  final bool enabled;

  /// Hit-test behaviour.
  final HitTestBehavior behavior;

  @override
  State<HPressable> createState() => _HPressableState();
}

class _HPressableState extends State<HPressable> {
  bool _pressed = false;
  bool _hovered = false;
  bool _focused = false;

  bool get _enabled => widget.enabled && widget.onPressed != null;

  void _set(void Function() fn) {
    if (!mounted) return;
    setState(fn);
  }

  void _activate() {
    if (!_enabled) return;
    if (widget.haptic) unawaited(HHaptics.tap());
    widget.onPressed!();
  }

  @override
  Widget build(BuildContext context) {
    final motion = context.h.motion;
    final state = HPressState(
      pressed: _pressed && _enabled,
      hovered: _hovered && _enabled,
      focused: _focused && _enabled,
      enabled: _enabled,
    );
    return Semantics(
      button: widget.isButton,
      enabled: _enabled,
      label: widget.semanticsLabel,
      child: FocusableActionDetector(
        enabled: _enabled,
        onShowFocusHighlight: (v) => _set(() => _focused = v),
        onShowHoverHighlight: (v) => _set(() => _hovered = v),
        mouseCursor: _enabled
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        actions: {
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (_) {
              _activate();
              return null;
            },
          ),
        },
        child: GestureDetector(
          behavior: widget.behavior,
          onTapDown: _enabled ? (_) => _set(() => _pressed = true) : null,
          onTapUp: _enabled ? (_) => _set(() => _pressed = false) : null,
          onTapCancel: _enabled ? () => _set(() => _pressed = false) : null,
          onTap: _enabled ? _activate : null,
          onLongPress: _enabled ? widget.onLongPress : null,
          child: AnimatedScale(
            scale: state.pressed ? widget.pressedScale : 1,
            duration: motion.of(motion.fast),
            curve: HMotion.easeOut,
            child: widget.builder(context, state),
          ),
        ),
      ),
    );
  }
}
