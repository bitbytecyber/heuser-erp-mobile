import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as wb;

Widget _page(Widget child) => Padding(
  padding: HSpace.page,
  child: SingleChildScrollView(child: child),
);

@wb.UseCase(name: 'Pills and badges', type: HStatusPill)
Widget pills(BuildContext context) {
  final solid = context.knobs.boolean(label: 'Solid');
  return _page(
    Wrap(
      spacing: HSpace.x2,
      runSpacing: HSpace.x2,
      children: [
        for (final t in HTone.values)
          HStatusPill(t.name, tone: t, solid: solid, icon: HIcons.info),
        HBadge(
          count: 7,
          child: HIconButton(
            icon: HIcons.bell,
            semanticsLabel: 'Bell',
            onPressed: () {},
          ),
        ),
      ],
    ),
  );
}

@wb.UseCase(name: 'Skeleton', type: HSkeleton)
Widget skeleton(BuildContext context) {
  final enabled = context.knobs.boolean(label: 'Loading', initialValue: true);
  return _page(
    HSkeleton(
      enabled: enabled,
      child: const HCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HText('Application HEU-00042', style: HTextStyle.titleMd),
            HSpace.gap1,
            HText('Under review · updated 2 days ago'),
          ],
        ),
      ),
    ),
  );
}

@wb.UseCase(name: 'Empty state', type: HEmptyState)
Widget emptyState(BuildContext context) {
  final compact = context.knobs.boolean(label: 'Compact');
  return _page(
    HEmptyState(
      compact: compact,
      icon: HIcons.school,
      title: 'No applications yet',
      message: 'Start your application for the Class of 2029.',
      actionLabel: 'Start application',
      onAction: () {},
    ),
  );
}

@wb.UseCase(name: 'Progress and countdown', type: HProgressBar)
Widget progress(BuildContext context) {
  final value = context.knobs.double.slider(label: 'Value', initialValue: 0.4);
  return _page(
    Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HProgressBar(value: value),
        HSpace.gap4,
        const Row(children: [HSpinner(), HSpace.hgap3, HSpinner(size: 28)]),
        HSpace.gap4,
        Wrap(
          spacing: HSpace.x2,
          children: [
            HCountdown(
              deadline: DateTime.now().add(const Duration(days: 3)),
              prefix: 'Respond in ',
            ),
            HCountdown(deadline: DateTime.now().add(const Duration(hours: 5))),
            HCountdown(
              deadline: DateTime.now().subtract(const Duration(hours: 1)),
            ),
          ],
        ),
      ],
    ),
  );
}

@wb.UseCase(name: 'Pull to refresh', type: HRefreshable)
Widget refreshable(BuildContext context) => SizedBox(
  height: 420,
  child: HRefreshable.list(
    onRefresh: () => Future<void>.delayed(const Duration(seconds: 1)),
    padding: HSpace.page,
    children: [
      for (var i = 1; i <= 6; i++)
        HListTile(title: 'Notification $i', subtitle: 'Pull down to refresh'),
    ],
  ),
);
