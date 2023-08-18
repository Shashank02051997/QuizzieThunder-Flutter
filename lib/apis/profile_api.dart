import '../models/profile_screen_response_model.dart';
import '../utils/dio_client.dart';

class ProfileApi {
  Future<ProfileScreenResponseModel> getProfileScreenDetails() async {
    try {
      final response = await DioClient.getDioInstance().get("api/profile");
      return ProfileScreenResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
