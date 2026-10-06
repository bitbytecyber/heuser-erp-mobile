import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as wb;

Widget _page(Widget child) => Padding(
  padding: HSpace.page,
  child: SingleChildScrollView(child: child),
);

@wb.UseCase(name: 'Cards', type: HCard)
Widget cards(BuildContext context) {
  final tappable = context.knobs.boolean(label: 'Tappable', initialValue: true);
  return _page(
    Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const HHeroCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HText('Good morning, Ayesha', style: HTextStyle.headlineMd),
              HSpace.gap1,
              HText('HEU-00042 is under review.', tone: HTextTone.secondary),
            ],
          ),
        ),
        HSpace.gap3,
        for (final e in HCardElevation.values) ...[
          HCard(
            elevation: e,
            onTap: tappable ? () {} : null,
            child: HText('${e.name} card', style: HTextStyle.titleMd),
          ),
          HSpace.gap3,
        ],
      ],
    ),
  );
}

@wb.UseCase(name: 'Sheet, dialog, toast', type: HBottomSheet)
Widget overlays(BuildContext context) => _page(
  Builder(
    builder: (context) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HButton.tonal(
          label: 'Open bottom sheet',
          onPressed: () => HBottomSheet.show<void>(
            context,
            builder: (ctx) => HBottomSheet(
              title: 'Pick a time',
              child: Column(
                children: [
                  for (final t in ['09:00', '09:30', '10:00'])
                    HListTile(
                      title: t,
                      subtitle: 'Tue 14 Oct',
                      onTap: () => Navigator.of(ctx).pop(),
                    ),
                ],
              ),
            ),
          ),
        ),
        HSpace.gap3,
        HButton.tonal(
          label: 'Confirm dialog',
          onPressed: () => HDialog.confirm(
            context,
            title: 'Withdraw application?',
            message: 'This cannot be undone.',
            confirmLabel: 'Withdraw',
            destructive: true,
            icon: HIcons.warning,
          ),
        ),
        HSpace.gap3,
        HButton.tonal(
          label: 'Success toast',
          onPressed: () => HToast.success(context, 'Application sent'),
        ),
        HSpace.gap3,
        HButton.tonal(
          label: 'Error toast',
          onPressed: () =>
              HToast.error(context, 'Could not upload. Try again.'),
        ),
      ],
    ),
  ),
);

@wb.UseCase(name: 'Scaffold', type: HScaffold)
Widget scaffold(BuildContext context) => HScaffold(
  appBar: HAppBar(
    title: 'Your applications',
    subtitle: 'Admissions · 2026–27',
    showBack: false,
    actions: [
      HIconButton(
        icon: HIcons.bell,
        semanticsLabel: 'Notifications',
        onPressed: () {},
        badge: true,
      ),
    ],
  ),
  body: const Padding(padding: HSpace.page, child: HText('Body')),
  bottomBar: Padding(
    padding: const EdgeInsets.fromLTRB(
      HSpace.gutter,
      HSpace.x2,
      HSpace.gutter,
      HSpace.x3,
    ),
    child: HButton.filled(
      label: 'Continue',
      onPressed: () {},
      size: HButtonSize.lg,
    ),
  ),
  bottomNav: HNavBar(
    items: const [
      HNavItem(icon: HIcons.home, label: 'Applications'),
      HNavItem(icon: HIcons.bell, label: 'Notifications', badgeCount: 2),
      HNavItem(icon: HIcons.person, label: 'Profile'),
    ],
    index: 0,
    onChanged: (_) {},
  ),
);
