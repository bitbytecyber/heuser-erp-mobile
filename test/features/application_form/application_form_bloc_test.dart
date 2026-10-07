import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart' hide fail;
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/application_form/data/file_draft_store.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/draft_store.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_draft.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/bloc/application_form_bloc.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_options.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';
import 'package:mocktail/mocktail.dart';

import 'form_fixtures.dart';

class _Repo extends Mock implements IntakeRepository;

void main() {
  late _Repo repo;
  late InMemoryDraftStore drafts;
  late Application app;

  setUp(() {
    repo = _Repo();
    drafts = InMemoryDraftStore();
    app = freshApplication();
    when(() => repo.formOptions(level: any(named: 'level')))
        .thenAnswer((_) async => ok(options));
  });

  ApplicationFormBloc build({
    Stream<bool>? online,
    Duration delay = Duration.zero,
  }) => ApplicationFormBloc(
    repo: repo,
    drafts: drafts,
    application: app,
    userEmail: 'me@x.pk',
    online: online,
    autosaveDelay: delay,
    clock: () => DateTime.utc(2026, 10, 7),
  );

  void saveOk({List<String> missing = const []}) {
    when(() => repo.saveStep(any(), any(), any())).thenAnswer(
      (i) async => ok(
        StepResult(
          application: savedApplication(
            app,
            formStep: (i.positionalArguments[1] as int) + 1,
          ),
          missing: missing,
        ),
      ),
    );
  }

  test('initial state comes from the application', () {
    final b = build();
    expect(b.state.step, 1);
    expect(b.state.draft.email, 'me@x.pk');
    expect(b.state.save, SaveStatus.saved);
    unawaited(b.close());
  });

  blocTest<ApplicationFormBloc, ApplicationFormState>(
    'started loads options and offers a fresh cached draft',
    setUp: () async {
      await drafts.write(
        app.id,
        CachedDraft(
          draft: completeDraft(),
          baseUpdatedAt: app.updatedAt,
          savedAt: 'x',
          dirtySteps: const [1],
        ),
      );
    },
    build: build,
    act: (b) => b.add(const ApplicationFormEvent.started()),
    verify: (b) {
      expect(b.state.options, options);
      expect(b.state.resumable?.draft, completeDraft());
    },
  );

  blocTest<ApplicationFormBloc, ApplicationFormState>(
    'started drops a cached draft older than the server copy',
    setUp: () async {
      await drafts.write(
        app.id,
        const CachedDraft(
          draft: FormDraft(),
          baseUpdatedAt: 'old',
          savedAt: 'x',
          dirtySteps: [1],
        ),
      );
    },
    build: build,
    act: (b) => b.add(const ApplicationFormEvent.started()),
    verify: (b) async {
      expect(b.state.resumable, isNull);
      expect(await drafts.read(app.id), isNull);
    },
  );

  test('edits debounce into one PATCH per step, in ascending order', () {
    fakeAsync((async) {
      saveOk();
      final b = build(delay: const Duration(milliseconds: 900))
        ..add(
          ApplicationFormEvent.draftChanged((d) => d.copyWith(firstName: 'S')),
        );
      async.elapse(const Duration(milliseconds: 500));
      b.add(
        ApplicationFormEvent.draftChanged((d) => d.copyWith(firstName: 'Sa')),
      );
      async.elapse(const Duration(milliseconds: 500));
      verifyNever(() => repo.saveStep(any(), any(), any()));
      async
        ..elapse(const Duration(milliseconds: 500))
        ..flushMicrotasks();
      final captured = verify(() => repo.saveStep(app.id, 1, captureAny()))
          .captured;
      expect(captured, hasLength(1));
      expect((captured.single as Map)['first_name'], 'Sa');
      expect(b.state.save, SaveStatus.saved);
      expect(b.state.formStep, 2);
      unawaited(b.close());
    });
  });

  test('PATCHes never overlap: the second waits for the first', () {
    fakeAsync((async) {
      final first = Completer<Result<StepResult>>();
      var calls = 0;
      when(() => repo.saveStep(any(), any(), any())).thenAnswer((i) {
        calls++;
        if (calls == 1) return first.future;
        return Future.value(ok(StepResult(application: savedApplication(app))));
      });
      final b = build()
        ..add(
          ApplicationFormEvent.draftChanged((d) => d.copyWith(firstName: 'A')),
        );
      async.flushTimers();
      // Jump to step 2 and edit there while the first PATCH is in flight.
      b
        ..emit(b.state.copyWith(formStep: 2))
        ..add(const ApplicationFormEvent.stepRequested(2))
        ..add(
          ApplicationFormEvent.draftChanged(
            (d) => d.copyWith(schoolCampus: 'C'),
          ),
        );
      async.flushTimers();
      expect(calls, 1);
      first.complete(ok(StepResult(application: savedApplication(app))));
      async.flushTimers();
      expect(calls, 2);
      unawaited(b.close());
    });
  });

  test('offline: the step stays dirty and flushes on reconnect', () {
    fakeAsync((async) {
      var calls = 0;
      when(() => repo.saveStep(any(), any(), any())).thenAnswer((_) async {
        calls++;
        return calls == 1
            ? fail(const Failure.noConnection())
            : ok(StepResult(application: savedApplication(app)));
      });
      final online = StreamController<bool>();
      final b = build(online: online.stream)
        ..add(
          ApplicationFormEvent.draftChanged((d) => d.copyWith(firstName: 'A')),
        );
      async.flushTimers();
      expect(b.state.save, SaveStatus.offline);
      expect(calls, 1);
      online.add(false);
      async.flushTimers();
      b.add(
        ApplicationFormEvent.draftChanged((d) => d.copyWith(firstName: 'AB')),
      );
      async.flushTimers();
      expect(calls, 1); // nothing sent while offline
      online.add(true);
      async.flushTimers();
      expect(calls, 2);
      expect(b.state.save, SaveStatus.saved);
      unawaited(b.close());
      unawaited(online.close());
    });
  });
}
