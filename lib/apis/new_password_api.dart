import '../models/create_new_password_post_body_model.dart';
import '../models/create_new_password_response_model.dart';
import '../models/update_password_post_body_model.dart';
import '../models/update_password_response_model.dart';
import '../utils/dio_client.dart';

class ResetPasswordApi {
  Future<UpdatePasswordResponseModel> updatePassword(
      {required UpdatePasswordPostBodyModel
          updatePasswordPostBodyModel}) async {
    try {
      final response = await DioClient.getDioInstance().put(
          "api/user/update-password",
          data: updatePasswordPostBodyModel.toJson());
      return UpdatePasswordResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<CreateNewPasswordResponseModel> createNewPassword(
      {required CreateNewPasswordPostBodyModel
          createNewPasswordPostBodyModel}) async {
    try {
      final response = await DioClient.getDioInstance().put(
          "api/user/create-new-password",
          data: createNewPasswordPostBodyModel.toJson());
      return CreateNewPasswordResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
