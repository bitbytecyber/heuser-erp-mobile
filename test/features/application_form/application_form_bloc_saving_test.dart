import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart' hide fail;
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/application_form/data/file_draft_store.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/draft_store.dart';
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

  ApplicationFormBloc build({Duration delay = Duration.zero}) =>
      ApplicationFormBloc(
        repo: repo,
        drafts: drafts,
        application: app,
        userEmail: 'me@x.pk',
        autosaveDelay: delay,
        clock: () => DateTime.utc(2026, 10, 7),
      );

  Result<StepResult> saved() =>
      ok(StepResult(application: savedApplication(app)));

  /// The cached draft, read inside fake time.
  CachedDraft? cached(FakeAsync async) {
    CachedDraft? out;
    unawaited(drafts.read(app.id).then((v) => out = v));
    async.flushMicrotasks();
    return out;
  }

  void edit(ApplicationFormBloc b, String name) => b.add(
    ApplicationFormEvent.draftChanged((d) => d.copyWith(firstName: name)),
  );

  for (final failure in const [
    Failure.server(status: 500),
    Failure.validation(code: 'teacher_unavailable'),
    Failure.forbidden(),
  ]) {
    test('a $failure save keeps the step dirty and the cache; the next '
        'flush retries and success clears it', () {
      fakeAsync((async) {
        var calls = 0;
        when(() => repo.saveStep(any(), any(), any())).thenAnswer((_) async {
          calls++;
          return calls == 1 ? fail(failure) : saved();
        });
        final b = build();
        edit(b, 'A');
        async.elapse(Duration.zero);
        expect(b.state.save, SaveStatus.error);
        expect(b.state.notice, FormNotice.saveFailed(failure));
        expect(cached(async)?.dirtySteps, [1]);
        expect(cached(async)?.draft.firstName, 'A');
        // Not a connectivity problem: no automatic retry.
        async.elapse(const Duration(minutes: 5));
        expect(calls, 1);

        b.add(const ApplicationFormEvent.flushRequested());
        async.elapse(Duration.zero);
        expect(calls, 2);
        expect(b.state.save, SaveStatus.saved);
        expect(cached(async), isNull);
        unawaited(b.close());
        async.flushMicrotasks();
      });
    });
  }

  test('submit aborts when flushing an earlier step fails', () {
    fakeAsync((async) {
      when(() => repo.saveStep(any(), any(), any()))
          .thenAnswer((_) async => fail(const Failure.server(status: 500)));
      final b = build(delay: const Duration(hours: 1));
      b.emit(
        b.state.copyWith(
          draft: completeDraft().copyWith(
            statement: List.filled(100, 'w').join(' '),
          ),
          step: 2,
          formStep: 3,
          declared: true,
        ),
      );
      b.add(
        ApplicationFormEvent.draftChanged((d) => d.copyWith(schoolCampus: 'X')),
      );
      async.flushMicrotasks();
      b
        ..emit(b.state.copyWith(step: 3))
        ..add(const ApplicationFormEvent.submitPressed());
      async.flushMicrotasks();

      verify(() => repo.saveStep(app.id, 2, any())).called(1);
      verifyNever(() => repo.saveStep(app.id, 3, any()));
      verifyNever(() => repo.submit(any()));
      expect(b.state.sending, isFalse);
      expect(b.state.notice, isA<FormNoticeSaveFailed>());
      expect(cached(async)?.dirtySteps, [2]);
      unawaited(b.close());
      async.flushMicrotasks();
    });
  });

  test('continue offline surfaces the failure and stays on the step', () {
    fakeAsync((async) {
      when(() => repo.saveStep(any(), any(), any()))
          .thenAnswer((_) async => fail(const Failure.noConnection()));
      final b = build();
      b
        ..emit(b.state.copyWith(draft: completeDraft()))
        ..add(const ApplicationFormEvent.continuePressed());
      async.flushMicrotasks();
      expect(b.state.step, 1);
      expect(b.state.save, SaveStatus.offline);
      expect(
        b.state.notice,
        const FormNotice.saveFailed(Failure.noConnection()),
      );
      expect(cached(async)?.dirtySteps, [1]);
      unawaited(b.close());
      async.flushMicrotasks();
    });
  });

  // The default retryDelay is 2 s, doubling per attempt.
  test('a timeout while online is retried with backoff', () {
    fakeAsync((async) {
      var calls = 0;
      when(() => repo.saveStep(any(), any(), any())).thenAnswer((_) async {
        calls++;
        return calls < 3 ? fail(const Failure.timeout()) : saved();
      });
      final b = build();
      edit(b, 'A');
      async.elapse(Duration.zero);
      expect(calls, 1);
      expect(b.state.save, SaveStatus.offline);
      async.elapse(const Duration(milliseconds: 1900));
      expect(calls, 1);
      async.elapse(const Duration(milliseconds: 200)); // 2 s
      expect(calls, 2);
      async.elapse(const Duration(milliseconds: 3800)); // backoff is 4 s now
      expect(calls, 2);
      async.elapse(const Duration(milliseconds: 300));
      expect(calls, 3);
      expect(b.state.save, SaveStatus.saved);
      expect(cached(async), isNull);
      unawaited(b.close());
      async.flushMicrotasks();
    });
  });

  test('close() sends the pending PATCHes and cancels the timers', () {
    fakeAsync((async) {
      when(() => repo.saveStep(any(), any(), any()))
          .thenAnswer((_) async => saved());
      final b = build(delay: const Duration(hours: 1));
      edit(b, 'Zed');
      async.flushMicrotasks();
      verifyNever(() => repo.saveStep(any(), any(), any()));
      unawaited(b.close());
      async.flushMicrotasks();
      final sent = verify(() => repo.saveStep(app.id, 1, captureAny()))
          .captured;
      expect((sent.single as Map)['first_name'], 'Zed');
      async.elapse(const Duration(hours: 2));
      verifyNoMoreInteractions(repo);
    });
  });

  test('the cache is written in order: the last write holds the latest '
      'draft', () {
    fakeAsync((async) {
      when(() => repo.saveStep(any(), any(), any()))
          .thenAnswer((_) async => fail(const Failure.noConnection()));
      final b = build(delay: const Duration(hours: 1));
      for (final n in ['A', 'AB', 'ABC', 'ABCD']) {
        edit(b, n);
      }
      async.flushMicrotasks();
      expect(cached(async)?.draft.firstName, 'ABCD');
      unawaited(b.close());
      async.flushMicrotasks();
    });
  });
}
