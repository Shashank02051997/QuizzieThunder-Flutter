import 'package:dio/dio.dart';

class ErrorHandingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("onError: ${err.response}");
    /*if (localStorage.read(KEY_IS_API_ERROR_HANDLE) == null)
      _isErrorCodeHandled = false;
    else
      _isErrorCodeHandled = true;
    if (!_isErrorCodeHandled && err.response?.statusCode == 401) {
      _isErrorCodeHandled = true;
      localStorage.write(KEY_IS_API_ERROR_HANDLE, _isErrorCodeHandled);
      // Redirecting to sign in screen if token expires
      AppUtils.showSnackBar("Session Expired! Please login again",
          status: MessageStatus.ERROR);
      GetStorage().remove(KEY_USER_DATA);
      Get.offAll(() => SignInPage(), binding: SignInBinding());
    } else if (!_isErrorCodeHandled && err.response?.statusCode == 502) {
      _isErrorCodeHandled = true;
      localStorage.write(KEY_IS_API_ERROR_HANDLE, _isErrorCodeHandled);
      AppUtils.showSnackBar("Bad Gateway", status: MessageStatus.ERROR);
      GetStorage().remove(KEY_USER_DATA);
      Get.offAll(() => SignInPage(), binding: SignInBinding());
    } else {
      if (!_isErrorCodeHandled)
        AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }*/
    super.onError(err, handler);
  }
}
