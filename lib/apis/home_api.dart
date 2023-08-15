import '../models/home_screen_response_model.dart';
import '../utils/dio_client.dart';

class HomeApi {
  Future<HomeScreenResponseModel> getHomeScreenDetails() async {
    try {
      final response = await DioClient.getDioInstance().get("api/home");
      return HomeScreenResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
