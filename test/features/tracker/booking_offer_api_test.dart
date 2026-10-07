import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/applications/data/datasources/booking_api.dart';
import 'package:heuser_erp_mobile/features/applications/data/datasources/offer_api.dart';

import '../../helpers/stub_adapter.dart';

const _base = 'api/v1/intake/me/applications/';

/// What the backend sends back from every applicant write: the application.
const Map<String, Object> _application = {
  'id': 7,
  'status': 'interview_scheduled',
};

(Dio, StubAdapter) _dio(List<StubReply> replies) {
  final adapter = StubAdapter(replies);
  final dio = Dio(BaseOptions(baseUrl: 'https://api.test/'))
    ..httpClientAdapter = adapter;
  return (dio, adapter);
}

void main() {
  group('BookingApi', () {
    test('paths end with a slash', () {
      expect(BookingApi.times(7), '${_base}7/times/');
      expect(BookingApi.book(7), '${_base}7/book/');
      expect(BookingApi.trialSessions(7, 3), '${_base}7/trials/3/sessions/');
      expect(BookingApi.trialBook(7, 3), '${_base}7/trials/3/book/');
    });

    test('interview times: GET, parsed', () async {
      final (dio, adapter) = _dio([
        const StubReply(200, [
          {
            'starts_at': '2026-10-10T05:00:00Z',
            'places': 2,
            'booked': 1,
            'total': 3,
          },
        ]),
      ]);
      final r = await BookingApi(dio).interviewTimes(7);
      expect(adapter.requests.single.method, 'GET');
      expect(adapter.requests.single.path, '${_base}7/times/');
      expect(r.valueOrNull?.single.places, 2);
    });

    test('book: POST with starts_at and reschedule', () async {
      final (dio, adapter) = _dio([const StubReply(200, _application)]);
      final r = await BookingApi(dio)
          .bookInterview(7, '2026-10-10T05:00:00Z', reschedule: true);
      final req = adapter.requests.single;
      expect(req.method, 'POST');
      expect(req.path, '${_base}7/book/');
      expect(req.data, {
        'starts_at': '2026-10-10T05:00:00Z',
        'reschedule': true,
      });
      expect(r.valueOrNull?.id, 7);
    });

    test('trial sessions and booking', () async {
      final (dio, adapter) = _dio([
        const StubReply(200, [
          {'id': 9, 'starts_at': '2026-10-10T05:00:00Z', 'places_left': 3},
        ]),
        const StubReply(200, _application),
      ]);
      final api = BookingApi(dio);
      final sessions = await api.sessions(7, 3);
      expect(sessions.valueOrNull?.single.id, 9);
      await api.bookTrial(7, 3, 9);
      expect(adapter.requests[0].path, '${_base}7/trials/3/sessions/');
      expect(adapter.requests[1].method, 'POST');
      expect(adapter.requests[1].path, '${_base}7/trials/3/book/');
      expect(adapter.requests[1].data, {'session': 9});
    });

    test('a taken slot is a validation failure', () async {
      final (dio, _) = _dio([
        const StubReply(400, {
          'code': 'slot_taken',
          'detail': 'That time was just taken.',
        }),
      ]);
      final r = await BookingApi(dio).bookInterview(7, 'T');
      expect(r.failureOrNull, isA<Validation>());
    });
  });

  group('OfferApi', () {
    test('paths end with a slash', () {
      expect(OfferApi.respond(7, 2), '${_base}7/offer/2/respond/');
      expect(
        OfferApi.pdf(7, 2, OfferPdf.letter),
        '${_base}7/offer/2/pdf/letter/',
      );
      expect(OfferApi.evidence(7, 4), '${_base}7/instalments/4/evidence/');
    });

    test('accept: POST accept=true', () async {
      final (dio, adapter) = _dio([const StubReply(200, _application)]);
      await OfferApi(dio).accept(7, 2);
      expect(adapter.requests.single.method, 'POST');
      expect(adapter.requests.single.path, '${_base}7/offer/2/respond/');
      expect(adapter.requests.single.data, {'accept': true, 'reason': ''});
    });

    test('voucher carries the instalment query; others none', () async {
      final (dio, adapter) = _dio([const StubReply(200, <String, Object?>{})]);
      final api = OfferApi(dio);
      final r = await api.download(7, 2, OfferPdf.challan, instalment: 12);
      await api.download(7, 2, OfferPdf.letter);
      expect(adapter.requests[0].path, '${_base}7/offer/2/pdf/challan/');
      expect(adapter.requests[0].queryParameters, {'instalment': 12});
      expect(adapter.requests[0].responseType, ResponseType.bytes);
      expect(adapter.requests[1].queryParameters, isEmpty);
      expect(r.valueOrNull, isNotEmpty);
    });

    test('evidence: multipart with method and file', () async {
      final dir = await Directory.systemTemp.createTemp('offer_api_test');
      addTearDown(() async {
        try {
          await dir.delete(recursive: true);
        } on FileSystemException catch (_) {
          // Windows: the unread multipart stream may still hold the file.
        }
      });
      final file = File('${dir.path}/proof.jpg')..writeAsBytesSync([1, 2, 3]);
      final (dio, adapter) = _dio([const StubReply(200, _application)]);
      await OfferApi(dio).submitEvidence(
        7,
        4,
        filePath: file.path,
        fileName: 'proof.jpg',
        method: 'bank',
      );
      final req = adapter.requests.single;
      expect(req.method, 'POST');
      expect(req.path, '${_base}7/instalments/4/evidence/');
      final form = req.data as FormData;
      expect(form.fields.map((e) => '${e.key}=${e.value}'), ['method=bank']);
      expect(form.files.single.key, 'file');
      expect(form.files.single.value.filename, 'proof.jpg');
    });
  });
}
