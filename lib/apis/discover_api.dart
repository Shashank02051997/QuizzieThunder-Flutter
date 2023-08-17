import '../models/discover_screen_response_model.dart';
import '../utils/dio_client.dart';

class DiscoverApi {
  Future<DiscoverScreenResponseModel> getDiscoverScreenDetails() async {
    try {
      final response = await DioClient.getDioInstance().get("api/discover");
      return DiscoverScreenResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
