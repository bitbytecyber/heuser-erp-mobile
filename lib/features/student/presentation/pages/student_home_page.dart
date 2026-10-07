import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';

/// Placeholder for the enrolled-student portal (phase 2): greets the
/// student, says what is coming and points them to the web portal. The real
/// portal replaces this with its own `PortalShellSpec`.
class StudentHomePage extends StatelessWidget {
  /// Creates the page.
  const StudentHomePage({
    required this.name,
    required this.onSignOut,
    super.key,
  });

  /// First name for the greeting; empty for none.
  final String name;

  /// Sign-out handler.
  final VoidCallback onSignOut;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context).student;
    final coming = [
      (HIcons.calendar, t.timetable),
      (HIcons.checkCircle, t.attendance),
      (HIcons.review, t.results),
      (HIcons.payment, t.fees),
    ];
    return HScaffold(
      appBar: HAppBar(title: t.title, showBack: false),
      body: ListView(
        padding: HSpace.page,
        children: [
          HHeroCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HText(
                  name.isEmpty ? t.welcome : t.welcomeName(name: name),
                  style: HTextStyle.headlineMd,
                ),
                HSpace.gap2,
                HText(t.body, tone: HTextTone.secondary),
              ],
            ),
          ).hFadeInUp(context),
          HSpace.gap6,
          Semantics(
            header: true,
            child: HText(
              t.comingTitle,
              style: HTextStyle.labelMd,
              tone: HTextTone.secondary,
            ),
          ),
          HSpace.gap2,
          HCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                for (final (icon, label) in coming)
                  HListTile(
                    title: label,
                    subtitle: t.soon,
                    icon: icon,
                    tone: HTone.neutral,
                    showChevron: false,
                  ),
              ],
            ),
          ),
          HSpace.gap6,
          HButton.outline(
            label: Translations.of(context).common.signOut,
            icon: HIcons.logout,
            onPressed: onSignOut,
          ),
        ],
      ),
    );
  }
}
