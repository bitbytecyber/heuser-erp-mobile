import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/widgets/task_tile.dart';

import '../../helpers/pump_page.dart';

void main() {
  testWidgets('speaks the state, title and line as one item', (tester) async {
    final handle = tester.ensureSemantics();
    await pumpPage(
      tester,
      const HScaffold(
        body: TaskTile(
          state: TaskState.done,
          icon: HIcons.calendar,
          title: 'Interview',
          sub: 'Booked for Tue 29 Sep',
        ),
      ),
    );
    expect(
      find.bySemanticsLabel(RegExp(r'^Done\nInterview\nBooked for')),
      findsOneWidget,
    );
    handle.dispose();
  });

  testWidgets('keeps its action separately focusable', (tester) async {
    final handle = tester.ensureSemantics();
    await pumpPage(
      tester,
      HScaffold(
        body: TaskTile(
          state: TaskState.todo,
          icon: HIcons.calendar,
          title: 'Interview',
          sub: 'Pick a time',
          action: HButton.tonal(label: 'Book', expand: false, onPressed: () {}),
        ),
      ),
    );
    expect(find.bySemanticsLabel(RegExp('^To do')), findsOneWidget);
    expect(find.bySemanticsLabel('Book'), findsOneWidget);
    handle.dispose();
  });
}
