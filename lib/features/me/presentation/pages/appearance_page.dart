import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/app/theme/theme_cubit.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';

/// Profile → Appearance: colour mode and (when the admin allows) the preset.
class AppearancePage extends StatelessWidget {
  /// Creates the page.
  const AppearancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context).appearance;
    return HScaffold(
      appBar: HAppBar(title: t.title),
      body: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final cubit = context.read<ThemeCubit>();
          final resolved = state.resolved;
          return ListView(
            padding: HSpace.page,
            children: [
              HText(t.modeTitle, style: HTextStyle.titleMd),
              HSpace.gap3,
              HSegmented<HThemeMode>(
                segments: [
                  HSegment(value: HThemeMode.system, label: t.modeSystem),
                  HSegment(
                    value: HThemeMode.light,
                    label: t.modeLight,
                    icon: HIcons.lightMode,
                  ),
                  HSegment(
                    value: HThemeMode.dark,
                    label: t.modeDark,
                    icon: HIcons.darkMode,
                  ),
                ],
                value: state.pref.mode,
                onChanged: cubit.chooseMode,
              ),
              HSpace.gap8,
              Row(
                children: [
                  Expanded(
                    child: HText(t.presetTitle, style: HTextStyle.titleMd),
                  ),
                  if (!resolved.userCanOverride)
                    HStatusPill(
                      t.setByAdmin,
                      tone: HTone.info,
                      icon: HIcons.lock,
                    ),
                ],
              ),
              HSpace.gap2,
              HText(
                resolved.userCanOverride ? t.presetHint : t.presetLocked,
                style: HTextStyle.bodySm,
                tone: HTextTone.secondary,
              ),
              HSpace.gap4,
              for (final preset in resolved.available) ...[
                _PresetCard(
                  preset: preset,
                  selected: preset.id == resolved.preset.id,
                  enabled: resolved.userCanOverride,
                  dark: state.data.isDark,
                  onTap: () => cubit.choosePreset(preset.id),
                ),
                HSpace.gap3,
              ],
              if (resolved.userCanOverride && state.pref.presetId != null)
                HButton.ghost(
                  label: t.resetPreset,
                  onPressed: () => cubit.choosePreset(null),
                  expand: true,
                ),
            ].hStaggered(context),
          );
        },
      ),
    );
  }
}

class _PresetCard extends StatelessWidget {
  const _PresetCard({
    required this.preset,
    required this.selected,
    required this.enabled,
    required this.dark,
    required this.onTap,
  });

  final HPreset preset;
  final bool selected;
  final bool enabled;
  final bool dark;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.h.colors;
    final scheme = preset.schemeFor(dark: dark);
    return HCard(
      onTap: enabled ? onTap : null,
      borderColor: selected ? c.brand : null,
      elevation: selected ? HCardElevation.raised : HCardElevation.flat,
      semanticsLabel: preset.label,
      child: Row(
        children: [
          _Swatches(scheme: scheme),
          HSpace.hgap3,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HText(preset.label, style: HTextStyle.titleMd),
                if (preset.description.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  HText(
                    preset.description,
                    style: HTextStyle.bodySm,
                    tone: HTextTone.secondary,
                    maxLines: 2,
                  ),
                ],
              ],
            ),
          ),
          if (selected) const HIcon(HIcons.checkCircle, tone: HTextTone.brand),
        ],
      ),
    );
  }
}

class _Swatches extends StatelessWidget {
  const _Swatches({required this.scheme});
  final HColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: HSpace.x16,
      height: HSpace.x12,
      padding: const EdgeInsets.all(HSpace.x1),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: HRadius.smAll,
        border: Border.all(color: context.h.colors.outlineSoft),
      ),
      child: Row(
        spacing: HSpace.x1,
        children: [
          for (final color in [
            scheme.brand,
            scheme.brandSoft,
            scheme.accent,
            scheme.surfaceRaised,
          ])
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: HRadius.pillAll,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
