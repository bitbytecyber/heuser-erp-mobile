import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';
import 'package:heuser_erp_mobile/features/auth/domain/auth_user.dart';
import 'package:heuser_erp_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:heuser_erp_mobile/features/branding/data/branding_repository.dart';

/// Applications tab. M2 placeholder with the greeting hero and the empty
/// state; M3 replaces the body with the real list and the "start" flow.
class ApplicationsPage extends StatelessWidget {
  /// Creates the page.
  const ApplicationsPage({required this.branding, super.key});

  /// College name for the header.
  final BrandingRepository branding;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final user = context.select<AuthBloc, AuthUser?>((b) => b.state.userOrNull);
    return HScaffold(
      appBar: HAppBar(
        title: t.applications.title,
        subtitle: branding.current.name,
        showBack: false,
      ),
      body: ListView(
        padding: HSpace.page,
        children: [
          HHeroCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HText(
                  '${_greeting()}, ${user?.greetingName ?? ''}'.trim(),
                  style: HTextStyle.headlineMd,
                ),
                HSpace.gap1,
                HText(t.app.tagline, tone: HTextTone.secondary),
              ],
            ),
          ),
          HSpace.gap4,
          HCard(
            child: HEmptyState(
              compact: true,
              icon: HIcons.school,
              title: t.applications.emptyTitle,
              message: t.applications.emptyBody,
              actionLabel: t.applications.start,
              onAction: () {},
            ),
          ),
        ].hStaggered(context),
      ),
    );
  }

  static String _greeting() {
    final h = DateTime.now().hour;
    if (h < 12) return 'Good morning';
    if (h < 17) return 'Good afternoon';
    return 'Good evening';
  }
}
