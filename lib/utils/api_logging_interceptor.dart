import 'package:dio/dio.dart';

import 'constants.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print(
        'REQUEST[${options.method}] => PATH: $BASE_URL${options.path} QUERY: ${options.queryParameters} \n BODY: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: $BASE_URL${response.requestOptions.path} \n $response',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print(
      'ERROR[${err.response?.statusCode}] => PATH: $BASE_URL${err.requestOptions.path}',
    );
    super.onError(err, handler);
  }
}
