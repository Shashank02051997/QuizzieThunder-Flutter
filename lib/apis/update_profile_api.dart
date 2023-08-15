import '../models/update_profile_post_body_model.dart';
import '../models/update_profile_response_model.dart';
import '../models/user_profile_response_model.dart';
import '../utils/dio_client.dart';

class UpdateProfileApi {
  Future<UserProfileResponseModel> getUserProfile(
      {required String userId}) async {
    try {
      final response = await DioClient.getDioInstance().get("api/user/$userId");
      return UserProfileResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<UpdateProfileResponseModel> updateProfile(
      {required UpdateProfilePostBodyModel updateProfilePostBodyModel,
      required String userId}) async {
    try {
      final response = await DioClient.getDioInstance().put(
          "api/user/update/$userId",
          data: updateProfilePostBodyModel.toJson());
      return UpdateProfileResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
