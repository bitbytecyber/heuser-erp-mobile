import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

/// One canned reply of [StubAdapter]: a status and JSON body, or a transport
/// error of [error] type.
class StubReply {
  /// A JSON response.
  const StubReply(this.status, [this.body]) : error = null;

  /// A request that never got a response.
  const StubReply.fail(DioExceptionType this.error) : status = 0, body = null;

  /// Status code.
  final int status;

  /// JSON body.
  final Object? body;

  /// Transport failure.
  final DioExceptionType? error;
}

/// Dio adapter that answers from a queue and records every request, so the
/// interceptor chain runs for real without a server.
class StubAdapter implements HttpClientAdapter {
  /// Replies, consumed in order; the last one repeats.
  StubAdapter(this.replies);

  /// Replies.
  final List<StubReply> replies;

  /// Requests seen, in order.
  final List<RequestOptions> requests = [];

  /// When set, replies wait for it (the request is "in flight").
  Future<void>? gate;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    await gate;
    final reply = replies.length > 1 ? replies.removeAt(0) : replies.first;
    final error = reply.error;
    if (error != null) {
      throw DioException(requestOptions: options, type: error);
    }
    return ResponseBody.fromString(
      jsonEncode(reply.body ?? <String, Object?>{}),
      reply.status,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
