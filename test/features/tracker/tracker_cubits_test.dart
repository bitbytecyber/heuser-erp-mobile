import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart' hide fail;
import 'package:heuser_erp_mobile/core/files/document_opener.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/applications/data/datasources/offer_api.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';
import 'package:heuser_erp_mobile/features/tracker/domain/slot_days.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/cubit/downloads_cubit.dart';
import 'package:heuser_erp_mobile/features/tracker/presentation/cubit/slot_list_cubit.dart';
import 'package:mocktail/mocktail.dart';

class _Repo extends Mock implements IntakeRepository;

class _Opener extends Mock implements DocumentOpener;

void main() {
  setUpAll(() => registerFallbackValue(Uint8List(0)));

  group('DownloadsCubit', () {
    late _Repo repo;
    late _Opener opener;
    final bytes = Uint8List.fromList([37, 80, 68, 70]);

    DownloadsCubit cubit() => DownloadsCubit(
      repo: repo,
      opener: opener,
      applicationId: 7,
      reference: 'HEU-00007',
    );

    setUp(() {
      repo = _Repo();
      opener = _Opener();
      when(() => opener.open(any(), any())).thenAnswer((_) async => true);
    });

    test('keys', () {
      expect(DownloadsCubit.keyOf(OfferPdf.letter, null), 'letter');
      expect(DownloadsCubit.keyOf(OfferPdf.challan, 12), 'challan:12');
    });

    test('opens with a named file and dedupes a second tap', () async {
      final pdf = Completer<Result<Uint8List>>();
      when(() => repo.offerPdf(7, 3, OfferPdf.challan, instalment: 12))
          .thenAnswer((_) => pdf.future);
      final c = cubit();
      final first = c.open(3, OfferPdf.challan, instalment: 12, sequence: 2);
      expect(c.state.busy, {'challan:12'});
      await c.open(3, OfferPdf.challan, instalment: 12, sequence: 2);
      pdf.complete(ok(bytes));
      await first;
      verify(() => repo.offerPdf(7, 3, OfferPdf.challan, instalment: 12))
          .called(1);
      verify(() => opener.open(bytes, 'HEU-00007-voucher-2.pdf')).called(1);
      expect(c.state.busy, isEmpty);
      expect(c.state.failure, isNull);
      await c.close();
    });

    test('a failed download is reported once', () async {
      when(() => repo.offerPdf(7, 3, OfferPdf.letter))
          .thenAnswer((_) async => fail(const Failure.notFound()));
      final c = cubit();
      await c.open(3, OfferPdf.letter);
      expect(c.state.failure, const Failure.notFound());
      expect(c.state.seq, 1);
      expect(c.state.busy, isEmpty);
      verifyNever(() => opener.open(any(), any()));
      await c.close();
    });

    test('no viewer to open it is an unknown failure', () async {
      when(() => repo.offerPdf(7, 3, OfferPdf.terms))
          .thenAnswer((_) async => ok(bytes));
      when(() => opener.open(any(), any())).thenAnswer((_) async => false);
      final c = cubit();
      await c.open(3, OfferPdf.terms);
      verify(() => opener.open(bytes, 'HEU-00007-terms.pdf')).called(1);
      expect(c.state.failure, isA<Unknown>());
      await c.close();
    });

    test('closing mid-download emits nothing more', () async {
      final pdf = Completer<Result<Uint8List>>();
      when(() => repo.offerPdf(7, 3, OfferPdf.letter))
          .thenAnswer((_) => pdf.future);
      final c = cubit();
      final run = c.open(3, OfferPdf.letter);
      await c.close();
      pdf.complete(ok(bytes));
      await run;
      verifyNever(() => opener.open(any(), any()));
    });
  });

  group('SlotListCubit', () {
    final slot = SlotItem(key: '9', at: DateTime(2026, 10, 10, 10), left: 2);

    test('loads on creation', () async {
      final c = SlotListCubit(() async => ok([slot]));
      expect(c.state, const SlotListState.loading());
      await pumpEventQueue();
      expect(c.state, SlotListState.loaded([slot]));
      await c.close();
    });

    test('failure, then a retry that works', () async {
      var calls = 0;
      final c = SlotListCubit(() async {
        calls++;
        return calls == 1 ? fail(const Failure.timeout()) : ok([slot]);
      });
      await pumpEventQueue();
      expect(c.state, const SlotListState.failed(Failure.timeout()));
      await c.load();
      expect(c.state, SlotListState.loaded([slot]));
      await c.close();
    });

    test('closing before the answer is safe', () async {
      final pending = Completer<Result<List<SlotItem>>>();
      final c = SlotListCubit(() => pending.future);
      await c.close();
      pending.complete(ok([slot]));
      await pumpEventQueue();
      expect(c.state, const SlotListState.loading());
    });
  });
}
