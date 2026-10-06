import 'package:dio/dio.dart';
import 'package:heuser_erp_mobile/core/connectivity/connectivity_service.dart';
import 'package:heuser_erp_mobile/core/network/failure_mapper.dart';

/// Classifies every failed request once, at the edge of the network layer:
/// attaches a `Failure` to `DioException.error` and feeds the connectivity
/// service with the only trustworthy reachability signal there is (what
/// actually happened to a real request). Passive: never swallows, retries or
/// rewrites. Last in the chain.
class NetworkErrorInterceptor extends Interceptor {
  /// Creates the interceptor.
  NetworkErrorInterceptor(this._connectivity);

  final ConnectivityService _connectivity;

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (response.statusCode != null) _connectivity.reportApiSuccess();
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final failure = FailureMapper.fromDio(
      err,
      deviceOffline: _connectivity.deviceOffline,
    );
    if (failure.isConnectivity) {
      _connectivity.reportApiUnreachable();
    } else if (err.response?.statusCode != null) {
      // Any status code, even a 401, proves the backend is reachable.
      _connectivity.reportApiSuccess();
    }
    handler.next(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: failure,
        stackTrace: err.stackTrace,
        message: err.message,
      ),
    );
  }
}
