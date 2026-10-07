import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/bloc/tracker_bloc.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/pages/tracker_live_refresh.dart';
import 'package:mocktail/mocktail.dart';

class _Repo extends Mock implements IntakeRepository;

void main() {
  const app = Application(id: 7, status: AppStatus.underReview);
  late _Repo repo;
  late StreamController<String> links;
  late TrackerBloc bloc;

  setUp(() {
    repo = _Repo();
    when(() => repo.fetch(7)).thenAnswer((_) async => ok(app));
    links = StreamController<String>.broadcast();
    bloc = TrackerBloc(repo, app);
  });

  tearDown(() async {
    await links.close();
    await bloc.close();
  });

  Future<void> pump(WidgetTester tester) => tester.pumpWidget(
    BlocProvider.value(
      value: bloc,
      child: TrackerLiveRefresh(
        pushLinks: links.stream,
        child: const SizedBox(),
      ),
    ),
  );

  testWidgets('a push about this application refreshes it', (tester) async {
    await pump(tester);
    links.add('https://erp.heuser.edu.pk/apply/applications/7');
    await tester.pump();
    verify(() => repo.fetch(7)).called(1);
  });

  testWidgets('a push about another application does not', (tester) async {
    await pump(tester);
    links
      ..add('https://erp.heuser.edu.pk/apply/applications/8')
      ..add('');
    await tester.pump();
    verifyNever(() => repo.fetch(any()));
  });

  testWidgets('returning to the app refreshes', (tester) async {
    await pump(tester);
    void go(AppLifecycleState s) =>
        tester.binding.handleAppLifecycleStateChanged(s);
    go(AppLifecycleState.inactive);
    go(AppLifecycleState.hidden);
    go(AppLifecycleState.paused);
    await tester.pump();
    verifyNever(() => repo.fetch(any()));
    go(AppLifecycleState.hidden);
    go(AppLifecycleState.inactive);
    go(AppLifecycleState.resumed);
    await tester.pump();
    verify(() => repo.fetch(7)).called(1);
  });
}
