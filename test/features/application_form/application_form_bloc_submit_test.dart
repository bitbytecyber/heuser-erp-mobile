import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart' hide fail;
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/application_form/data/file_draft_store.dart';
import 'package:heuser_erp_mobile/features/application_form/domain/form_errors.dart';
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

  blocTest<ApplicationFormBloc, ApplicationFormState>(
    'continue with client errors marks them and stays',
    build: build,
    act: (b) => b.add(const ApplicationFormEvent.continuePressed()),
    verify: (b) {
      expect(b.state.step, 1);
      expect(b.state.errors.keys, contains('first_name'));
      expect(b.state.notice, const FormNotice.fixMarked());
      verifyNever(() => repo.saveStep(any(), any(), any()));
    },
  );

  blocTest<ApplicationFormBloc, ApplicationFormState>(
    'continue with a valid step saves and advances',
    build: () {
      saveOk();
      return build();
    },
    seed: () => ApplicationFormState(application: app, draft: completeDraft()),
    act: (b) => b.add(const ApplicationFormEvent.continuePressed()),
    verify: (b) {
      verify(() => repo.saveStep(app.id, 1, any())).called(1);
      expect(b.state.step, 2);
      expect(b.state.errors, isEmpty);
    },
  );

  blocTest<ApplicationFormBloc, ApplicationFormState>(
    'server missing keys become field errors',
    build: () {
      saveOk(missing: const ['guardians']);
      return build();
    },
    seed: () => ApplicationFormState(application: app, draft: completeDraft()),
    act: (b) => b.add(const ApplicationFormEvent.continuePressed()),
    verify: (b) {
      expect(b.state.step, 1);
      expect(
        b.state.errors['pA.first_name'],
        const FormError.required('guardians'),
      );
    },
  );

  blocTest<ApplicationFormBloc, ApplicationFormState>(
    'submit: 79 words blocked, declaration needed, then sent',
    build: () {
      saveOk();
      when(() => repo.submit(app.id))
          .thenAnswer((_) async => ok(app.copyWith(reference: 'HEU-1')));
      return build();
    },
    seed: () => ApplicationFormState(
      application: app,
      draft: completeDraft().copyWith(
        statement: List.filled(79, 'w').join(' '),
      ),
      step: 3,
      formStep: 3,
    ),
    act: (b) async {
      b.add(const ApplicationFormEvent.submitPressed());
      await Future<void>.delayed(Duration.zero);
      b
        ..add(
          ApplicationFormEvent.draftChanged(
            (d) => d.copyWith(statement: List.filled(80, 'w').join(' ')),
          ),
        )
        ..add(const ApplicationFormEvent.submitPressed());
      await Future<void>.delayed(Duration.zero);
      b
        ..add(const ApplicationFormEvent.declarationChanged(value: true))
        ..add(const ApplicationFormEvent.submitPressed());
    },
    wait: const Duration(milliseconds: 50),
    verify: (b) {
      expect(b.state.application.reference, 'HEU-1');
      expect(b.state.sending, isFalse);
      expect(b.state.notice, isA<FormNoticeSubmitted>());
    },
  );

  blocTest<ApplicationFormBloc, ApplicationFormState>(
    'submit with missing_fields jumps to the first offending step',
    build: () {
      saveOk();
      when(() => repo.submit(app.id)).thenAnswer(
        (_) async => fail(
          const Failure.validation(
            code: 'missing_fields',
            missing: ['results', 'cnic'],
          ),
        ),
      );
      return build();
    },
    seed: () => ApplicationFormState(
      application: app,
      draft: completeDraft().copyWith(
        statement: List.filled(100, 'w').join(' '),
      ),
      step: 3,
      formStep: 3,
      declared: true,
    ),
    act: (b) => b.add(const ApplicationFormEvent.submitPressed()),
    verify: (b) {
      expect(b.state.step, 1);
      expect(b.state.errors.keys, containsAll(['results', 'cnic']));
      expect(b.state.sending, isFalse);
    },
  );

  blocTest<ApplicationFormBloc, ApplicationFormState>(
    'a non-connectivity save error surfaces as a notice',
    build: () {
      when(() => repo.saveStep(any(), any(), any()))
          .thenAnswer((_) async => fail(const Failure.server(status: 500)));
      return build();
    },
    act: (b) => b.add(
      ApplicationFormEvent.draftChanged((d) => d.copyWith(firstName: 'A')),
    ),
    wait: const Duration(milliseconds: 20),
    verify: (b) {
      expect(b.state.save, SaveStatus.error);
      expect(b.state.notice, isA<FormNoticeSaveFailed>());
    },
  );
}
