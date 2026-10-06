import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as wb;

Widget _page(Widget child) => Padding(
  padding: HSpace.page,
  child: SingleChildScrollView(child: child),
);

const _stages = [
  HStage(key: 'received', label: 'Received'),
  HStage(key: 'under_review', label: 'Under review'),
  HStage(key: 'interview_scheduled', label: 'Interview booked'),
  HStage(key: 'interviewed', label: 'Interviewed'),
  HStage(key: 'offered', label: 'Offer'),
  HStage(key: 'financial_verification', label: 'Payment'),
  HStage(key: 'enrolled', label: 'Enrolled'),
];

@wb.UseCase(name: 'Stage bar', type: HStageBar)
Widget stageBar(BuildContext context) {
  final i = context.knobs.int.slider(
    label: 'Current index (-1 ended)',
    initialValue: 2,
    min: -1,
    max: 7,
  );
  return _page(HStageBar(stages: _stages, currentIndex: i));
}

@wb.UseCase(name: 'Timeline', type: HTimeline)
Widget timeline(BuildContext context) => _page(
  const HTimeline(
    entries: [
      HTimelineEntry(
        title: 'Interview booked',
        timestamp: 'Today, 10:12',
        icon: HIcons.calendar,
        tone: HTone.brand,
      ),
      HTimelineEntry(
        title: 'Documents approved',
        timestamp: 'Yesterday',
        icon: HIcons.checkCircle,
        tone: HTone.success,
      ),
      HTimelineEntry(title: 'Application received', timestamp: '1 Oct'),
    ],
  ),
);

@wb.UseCase(name: 'List tiles', type: HListTile)
Widget listTiles(BuildContext context) => _page(
  HCard(
    padding: EdgeInsets.zero,
    child: Column(
      children: [
        HListTile(
          icon: HIcons.calendar,
          title: 'Interview',
          subtitle: 'Pick a time',
          onTap: () {},
        ),
        const HDivider(indent: HSpace.x4),
        HListTile(
          icon: HIcons.file,
          tone: HTone.success,
          title: 'Documents',
          trailing: const HStatusPill('Done', tone: HTone.success),
          onTap: () {},
        ),
        const HDivider(indent: HSpace.x4),
        const HListTile(
          icon: HIcons.payment,
          tone: HTone.neutral,
          title: 'Payment',
          subtitle: 'Locked',
          enabled: false,
        ),
      ],
    ),
  ),
);

@wb.UseCase(name: 'Key-value and fees', type: HKeyValue)
Widget keyValue(BuildContext context) => _page(
  const Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      HCard(
        child: HKeyValueGroup(
          title: 'About you',
          children: [
            HKeyValue(label: 'Full name', value: 'Ayesha Khan'),
            HKeyValue(label: 'Date of birth', value: '14 Mar 2010'),
            HKeyValue(label: 'Religion', value: ''),
          ],
        ),
      ),
      HSpace.gap4,
      HCard(
        child: HFeeTable(
          rows: [
            HFeeRow(label: 'Admission fee', amount: 'PKR 25,000'),
            HFeeRow(
              label: 'Security deposit',
              amount: 'PKR 50,000',
              note: 'refundable',
            ),
            HFeeRow(
              label: 'Academic scholarship',
              amount: '− 25 %',
              tone: HTextTone.success,
            ),
          ],
          total: 'PKR 75,000',
        ),
      ),
    ],
  ),
);

@wb.UseCase(name: 'Avatar', type: HAvatar)
Widget avatar(BuildContext context) => _page(
  const Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      HAvatar(name: 'Ayesha Khan', size: HAvatarSize.sm),
      HAvatar(name: 'Ayesha Khan'),
      HAvatar(name: 'Hussham', size: HAvatarSize.lg),
      HAvatar(name: '', size: HAvatarSize.xl),
    ],
  ),
);

@wb.UseCase(name: 'Type scale', type: HText)
Widget typeScale(BuildContext context) => _page(
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      for (final s in HTextStyle.values) ...[
        HText('${s.name} — Where learning knows no limits', style: s),
        HSpace.gap2,
      ],
    ],
  ),
);

@wb.UseCase(name: 'Colour roles', type: HColorScheme)
Widget colours(BuildContext context) {
  final roles = context.h.colors.toMap();
  return _page(
    Wrap(
      spacing: HSpace.x2,
      runSpacing: HSpace.x2,
      children: [
        for (final e in roles.entries)
          SizedBox(
            width: 100,
            child: Column(
              children: [
                Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: e.value,
                    borderRadius: HRadius.smAll,
                    border: Border.all(color: context.h.colors.outlineSoft),
                  ),
                ),
                HSpace.gap1,
                HText(
                  e.key,
                  style: HTextStyle.labelSm,
                  tone: HTextTone.secondary,
                  maxLines: 1,
                ),
              ],
            ),
          ),
      ],
    ),
  );
}
