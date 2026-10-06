import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/foundation/h_animate.dart';
import 'package:heuser_ds/src/foundation/h_icon.dart';
import 'package:heuser_ds/src/foundation/h_icons.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';
import 'package:heuser_ds/src/tokens/h_motion.dart';
import 'package:heuser_ds/src/tokens/h_radius.dart';
import 'package:heuser_ds/src/tokens/h_spacing.dart';

/// The shared frame of every input: label above, rounded container whose
/// border reacts to focus/error, helper or error text below. Text fields,
/// selects, date pickers and file tiles all compose this so they look alike.
class HFieldFrame extends StatelessWidget {
  /// Creates a frame around [child].
  const HFieldFrame({
    required this.child,
    this.label,
    this.helper,
    this.error,
    this.focused = false,
    this.enabled = true,
    this.required = false,
    this.minHeight = 52,
    this.padding = const EdgeInsets.symmetric(horizontal: HSpace.x4),
    this.trailing,
    this.leading,
    super.key,
  });

  /// Field content.
  final Widget child;

  /// Label above the field.
  final String? label;

  /// Helper text below (hidden while [error] is shown).
  final String? helper;

  /// Error text below; switches the frame to the danger state.
  final String? error;

  /// Focus state (brand border + ring).
  final bool focused;

  /// Enabled state.
  final bool enabled;

  /// Appends a brand asterisk to the label.
  final bool required;

  /// Minimum container height (52 = comfortable single-line field).
  final double minHeight;

  /// Inner padding.
  final EdgeInsetsGeometry padding;

  /// Leading adornment (icon).
  final Widget? leading;

  /// Trailing adornment (icon button, chevron).
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final h = context.h;
    final c = h.colors;
    final hasError = error != null && error!.isNotEmpty;
    final borderColor = !enabled
        ? c.outlineSoft
        : hasError
        ? c.danger
        : focused
        ? c.brand
        : c.outline;
    final bg = !enabled ? c.surfaceAlt.withValues(alpha: 0.6) : c.surfaceAlt;

    final frame = AnimatedContainer(
      duration: h.motion.of(h.motion.fast),
      curve: HMotion.easeOut,
      constraints: BoxConstraints(minHeight: minHeight),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: HRadius.smAll,
        border: Border.all(
          color: borderColor,
          width: focused || hasError ? 1.6 : 1,
        ),
        boxShadow: focused
            ? [
                BoxShadow(
                  color: (hasError ? c.dangerSoft : c.focusRing).withValues(
                    alpha: 0.9,
                  ),
                  spreadRadius: 3,
                ),
              ]
            : const [],
      ),
      padding: padding,
      child: Row(
        children: [
          if (leading != null) ...[leading!, HSpace.hgap2],
          Expanded(child: child),
          if (trailing != null) ...[HSpace.hgap2, trailing!],
        ],
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Row(
            children: [
              Flexible(
                child: HText(
                  label!,
                  style: HTextStyle.titleSm,
                  tone: HTextTone.secondary,
                  maxLines: 1,
                ),
              ),
              if (required)
                const HText(
                  ' *',
                  style: HTextStyle.titleSm,
                  tone: HTextTone.brand,
                ),
            ],
          ),
          HSpace.gap1,
          const SizedBox(height: 2),
        ],
        if (hasError) frame.hShake(context) else frame,
        if (hasError) ...[
          HSpace.gap1,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 1),
                child: HIcon(
                  HIcons.error,
                  size: HIconSize.sm,
                  tone: HTextTone.danger,
                ),
              ),
              HSpace.hgap1,
              Expanded(
                child: HText(
                  error!,
                  style: HTextStyle.bodySm,
                  tone: HTextTone.danger,
                ),
              ),
            ],
          ),
        ] else if (helper != null && helper!.isNotEmpty) ...[
          HSpace.gap1,
          HText(helper!, style: HTextStyle.bodySm, tone: HTextTone.tertiary),
        ],
      ],
    );
  }
}
