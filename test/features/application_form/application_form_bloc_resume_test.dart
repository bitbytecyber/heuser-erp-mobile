import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart' hide fail;
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/application_form/data/file_draft_store.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/draft_store.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_draft.dart';
import 'package:heuser_erp_mobile/features/application_form/presentation/bloc/application_form_bloc.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_options.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_parts.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';
import 'package:mocktail/mocktail.dart';

import 'form_fixtures.dart';

class _Repo extends Mock implements IntakeRepository;

const _a2Options = FormOptions(
  subjects: [SubjectOption(course: 9, name: 'Further Maths')],
);

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
    when(() => repo.formOptions(level: Level.a2))
        .thenAnswer((_) async => ok(_a2Options));
  });

  ApplicationFormBloc build() => ApplicationFormBloc(
    repo: repo,
    drafts: drafts,
    application: app,
    autosaveDelay: Duration.zero,
    clock: () => DateTime.utc(2026, 10, 7),
  );

  void saveReturning(List<ResultRow> results) {
    when(() => repo.saveStep(any(), any(), any())).thenAnswer(
      (_) async =>
          ok(StepResult(application: savedApplication(app, results: results))),
    );
  }

  CachedDraft cachedWith({Level level = Level.as_}) => CachedDraft(
    draft: completeDraft().copyWith(level: level),
    baseUpdatedAt: app.updatedAt,
    savedAt: 'x',
    dirtySteps: const [2, 1],
  );

  blocTest<ApplicationFormBloc, ApplicationFormState>(
    'saved result rows get their ids by index when the subject matches',
    build: () {
      saveReturning(const [
        ResultRow(subject: 'Physics', id: 10),
        ResultRow(subject: 'Biology', id: 11),
      ]);
      return build();
    },
    seed: () => ApplicationFormState(
      application: app,
      draft: completeDraft().copyWith(
        results: [
          out('Physics', 'A'),
          out('Chemistry', 'B'),
          out('Maths', 'C'),
        ],
      ),
    ),
    act: (b) => b.add(ApplicationFormEvent.draftChanged((d) => d)),
    wait: const Duration(milliseconds: 20),
    verify: (b) {
      expect(b.state.draft.results.map((r) => r.id), [10, null, null]);
      expect(b.state.draft.results[1].subject, 'Chemistry');
    },
  );

  blocTest<ApplicationFormBloc, ApplicationFormState>(
    'resume restores the cached draft and saves its dirty steps in order',
    setUp: () => drafts.write(app.id, cachedWith()),
    build: () {
      saveReturning(const []);
      return build();
    },
    seed: () => ApplicationFormState(
      application: app,
      draft: const FormDraft(),
      resumable: cachedWith(),
    ),
    act: (b) => b.add(const ApplicationFormEvent.resumeDecided(resume: true)),
    wait: const Duration(milliseconds: 20),
    verify: (b) async {
      expect(b.state.draft, completeDraft());
      expect(b.state.resumable, isNull);
      verifyInOrder([
        () => repo.saveStep(app.id, 1, any()),
        () => repo.saveStep(app.id, 2, any()),
      ]);
      expect(await drafts.read(app.id), isNull);
      verifyNever(() => repo.formOptions(level: any(named: 'level')));
    },
  );

  blocTest<ApplicationFormBloc, ApplicationFormState>(
    'discarding the cached draft clears it and sends nothing',
    setUp: () => drafts.write(app.id, cachedWith()),
    build: build,
    seed: () => ApplicationFormState(
      application: app,
      draft: const FormDraft(),
      resumable: cachedWith(),
    ),
    act: (b) => b.add(const ApplicationFormEvent.resumeDecided(resume: false)),
    verify: (b) async {
      expect(b.state.resumable, isNull);
      expect(b.state.draft, const FormDraft());
      expect(await drafts.read(app.id), isNull);
      verifyNever(() => repo.saveStep(any(), any(), any()));
    },
  );

  blocTest<ApplicationFormBloc, ApplicationFormState>(
    'resuming a draft of another level reloads the options',
    build: () {
      saveReturning(const []);
      return build();
    },
    seed: () => ApplicationFormState(
      application: app,
      draft: const FormDraft(),
      options: options,
      resumable: cachedWith(level: Level.a2),
    ),
    act: (b) => b.add(const ApplicationFormEvent.resumeDecided(resume: true)),
    wait: const Duration(milliseconds: 20),
    verify: (b) {
      verify(() => repo.formOptions(level: Level.a2)).called(1);
      expect(b.state.options, _a2Options);
    },
  );

  blocTest<ApplicationFormBloc, ApplicationFormState>(
    'a level change reloads the options',
    build: () {
      saveReturning(const []);
      return build();
    },
    act: (b) => b.add(
      ApplicationFormEvent.draftChanged((d) => d.copyWith(level: Level.a2)),
    ),
    wait: const Duration(milliseconds: 20),
    verify: (b) => expect(b.state.options, _a2Options),
  );

  test('options for a level the draft has left are dropped (A→B→A)', () {
    fakeAsync((async) {
      saveReturning(const []);
      final a2 = Completer<Result<FormOptions>>();
      final as = Completer<Result<FormOptions>>();
      when(() => repo.formOptions(level: Level.a2))
          .thenAnswer((_) => a2.future);
      when(() => repo.formOptions(level: Level.as_))
          .thenAnswer((_) => as.future);
      final b = build()
        ..add(
          ApplicationFormEvent.draftChanged((d) => d.copyWith(level: Level.a2)),
        )
        ..add(
          ApplicationFormEvent.draftChanged(
            (d) => d.copyWith(level: Level.as_),
          ),
        );
      async.flushMicrotasks();
      as.complete(ok(options));
      async.flushMicrotasks();
      a2.complete(ok(_a2Options)); // late answer for the abandoned level
      async.elapse(Duration.zero);
      expect(b.state.draft.level, Level.as_);
      expect(b.state.options, options);
      unawaited(b.close());
      async.flushMicrotasks();
    });
  });
}
