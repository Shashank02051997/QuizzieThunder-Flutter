import '../models/signup_post_body_model.dart';
import '../models/signup_response_model.dart';
import '../utils/dio_client.dart';

class SignUpApi {
  Future<SignUpResponseModel> signUp(
      {required SignUpPostBodyModel signUpPostBodyModel}) async {
    try {
      final response = await DioClient.getDioInstance()
          .post("api/user/register", data: signUpPostBodyModel.toJson());
      return SignUpResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
