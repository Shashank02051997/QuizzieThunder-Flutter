import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../models/signin_response_model.dart';
import 'api_logging_interceptor.dart';
import 'constants.dart';
import 'error_handling_interceptor.dart';

class DioClient {
  static Dio getDioInstance() {
    var dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: Duration(minutes: 2),
      receiveTimeout: Duration(minutes: 1),
    ))
      ..options.headers["content-type"] = "application/json"
      ..options.headers["Authorization"] = GetStorage().read(KEY_USER_DATA) ==
              null
          ? ""
          : "Bearer ${(SignInResponseModel.fromJson((GetStorage().read(KEY_USER_DATA)))).result?.token}"
      ..interceptors.add(ErrorHandingInterceptor())
      ..interceptors.add(LoggingInterceptor());
    return dio;
  }
}
