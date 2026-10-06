import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/core/network/failure_mapper.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';

/// Wraps one api call so nothing escapes as an exception.
///
/// Dio keeps its default `validateStatus` (4xx throws), so this is the single
/// place a `DioException` becomes a [Failure]. `NetworkErrorInterceptor` has
/// usually attached the failure already; the mapper is the fallback.
/// Parsing errors inside [run] (a shape the DTO did not expect) are reported
/// as [Failure.unknown] with the cause, never swallowed.
Future<Result<T>> safeCall<T>(Future<T> Function() run) async {
  try {
    return Right(await run());
  } on DioException catch (e) {
    return Left(FailureMapper.fromDio(e));
  } on Failure catch (f) {
    return Left(f);
  } on Object catch (e, s) {
    debugPrint('safeCall: unexpected $e\n$s');
    return Left(Failure.unknown(cause: e));
  }
}
