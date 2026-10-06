import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

/// The toast itself is an overlay entry; the golden renders its visual via
/// the same tones so colour regressions are caught.
void main() {
  goldenPresetMatrix(
    'h_toast',
    (context) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final (tone, icon, text) in [
          (HTone.neutral, HIcons.info, 'Saved just now'),
          (HTone.success, HIcons.checkCircle, 'Application sent'),
          (HTone.danger, HIcons.error, 'Could not upload. Try again.'),
          (HTone.warning, HIcons.warning, 'You are offline'),
        ]) ...[
          Builder(
            builder: (context) {
              final h = context.h;
              final (bg, fg) = tone == HTone.neutral
                  ? (h.colors.surfaceInverse, h.colors.textInverse)
                  : tone.resolve(h);
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: HSpace.x4,
                  vertical: HSpace.x3,
                ),
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: HRadius.mdAll,
                  boxShadow: h.elevation.overlay,
                ),
                child: Row(
                  children: [
                    HIcon(icon, color: fg),
                    HSpace.hgap3,
                    Expanded(child: HText(text, color: fg)),
                  ],
                ),
              );
            },
          ),
          HSpace.gap3,
        ],
      ],
    ),
  );
}
