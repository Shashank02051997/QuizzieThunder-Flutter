import '../models/reset_password_post_body_model.dart';
import '../models/reset_password_response_model.dart';
import '../utils/dio_client.dart';

class ResetPasswordApi {
  Future<ResetPasswordResponseModel> resetPassword(
      {required ResetPasswordPostBodyModel resetPasswordPostBodyModel}) async {
    try {
      final response = await DioClient.getDioInstance().put(
          "api/user/reset-password",
          data: resetPasswordPostBodyModel.toJson());
      return ResetPasswordResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
