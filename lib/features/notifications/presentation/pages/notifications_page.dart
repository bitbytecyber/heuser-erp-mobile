import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';

/// Notifications tab. M2 placeholder; M6 adds the paged inbox.
class NotificationsPage extends StatelessWidget {
  /// Creates the page.
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return HScaffold(
      appBar: HAppBar(title: t.notifications.title, showBack: false),
      body: Center(
        child: HEmptyState(
          icon: HIcons.bell,
          tone: HTone.neutral,
          title: t.notifications.emptyTitle,
          message: t.notifications.emptyBody,
        ),
      ),
    );
  }
}
