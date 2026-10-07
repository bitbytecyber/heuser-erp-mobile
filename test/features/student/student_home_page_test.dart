import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_erp_mobile/features/student/presentation/pages/student_home_page.dart';

import '../../helpers/pump_page.dart';

void main() {
  testWidgets('greets the student and signs out', (tester) async {
    var signedOut = false;
    await pumpPage(
      tester,
      StudentHomePage(name: 'Sara', onSignOut: () => signedOut = true),
    );
    expect(find.text('Welcome to Heuser, Sara'), findsOneWidget);
    expect(find.text('Timetable'), findsOneWidget);

    await tester.scrollUntilVisible(find.text('Sign out'), 200);
    await tester.tap(find.text('Sign out'));
    expect(signedOut, isTrue);
  });

  testWidgets('lays out at 200% text without overflow', (tester) async {
    await pumpPage(
      tester,
      StudentHomePage(name: '', onSignOut: () {}),
      textScale: 2,
    );
    expect(tester.takeException(), isNull);
    expect(find.text('Welcome to Heuser'), findsOneWidget);
  });
}
