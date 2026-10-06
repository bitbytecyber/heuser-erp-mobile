import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_widgetbook/main.directories.g.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as wb;

void main() => runApp(const HeuserWidgetbook());

/// Catalogue of every design-system component across the built-in presets,
/// both brightnesses, three text scales and two device frames.
@wb.App()
class HeuserWidgetbook extends StatelessWidget {
  const HeuserWidgetbook({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      directories: directories,
      addons: [
        ThemeAddon<HThemeData>(
          themes: [
            for (final preset in HPresets.builtIn)
              for (final dark in const [false, true])
                WidgetbookTheme(
                  name: '${preset.label} · ${dark ? 'dark' : 'light'}',
                  data: HThemeData.fromPreset(preset, dark: dark),
                ),
          ],
          themeBuilder: (context, theme, child) =>
              HThemeScope(data: theme, child: child),
        ),
        TextScaleAddon(),
        ViewportAddon([
          IosViewports.iPhone13,
          AndroidViewports.samsungGalaxyS20,
        ]),
        AlignmentAddon(),
      ],
      appBuilder: (context, child) =>
          Directionality(textDirection: TextDirection.ltr, child: child),
    );
  }
}
