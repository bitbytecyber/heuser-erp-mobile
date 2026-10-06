import 'package:flutter/widgets.dart';
import 'package:heuser_ds/src/foundation/h_text.dart';
import 'package:heuser_ds/src/theme/h_theme.dart';

/// Avatar sizes.
enum HAvatarSize {
  /// 32
  sm(32, HTextStyle.labelMd),

  /// 40
  md(40, HTextStyle.titleSm),

  /// 56
  lg(56, HTextStyle.titleLg),

  /// 80
  xl(80, HTextStyle.headlineMd);

  HAvatarSize(this.px, this.style);

  /// Diameter.
  final double px;

  /// Initials style.
  final HTextStyle style;
}

/// Circular avatar: image when available, else initials on a brand tint.
class HAvatar extends StatelessWidget {
  /// Creates an avatar.
  const HAvatar({
    required this.name,
    this.image,
    this.size = HAvatarSize.md,
    super.key,
  });

  /// Full name (initials are derived from the first two words).
  final String name;

  /// Optional picture (the app passes a cached network provider).
  final ImageProvider<Object>? image;

  /// Size.
  final HAvatarSize size;

  /// Up to two initials from [name].
  static String initialsOf(String name) {
    final parts = name
        .trim()
        .split(RegExp(r'\s+'))
        .where((p) => p.isNotEmpty)
        .toList();
    if (parts.isEmpty) return '?';
    final first = parts.first[0];
    final second = parts.length > 1 ? parts.last[0] : '';
    return (first + second).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.h.colors;
    return Semantics(
      image: image != null,
      label: name,
      child: Container(
        width: size.px,
        height: size.px,
        decoration: BoxDecoration(
          color: c.brandSoft,
          shape: BoxShape.circle,
          image: image == null
              ? null
              : DecorationImage(image: image!, fit: BoxFit.cover),
        ),
        alignment: Alignment.center,
        child: image == null
            ? HText(
                initialsOf(name),
                style: size.style,
                tone: HTextTone.brandStrong,
              )
            : null,
      ),
    );
  }
}
