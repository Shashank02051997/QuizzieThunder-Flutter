import '../models/leaderboard_screen_response_model.dart';
import '../utils/dio_client.dart';

class LeaderboardApi {
  Future<LeaderboardScreenResponseModel> getLeaderboardScreenDetails() async {
    try {
      final response = await DioClient.getDioInstance().get("api/leaderboard");
      return LeaderboardScreenResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
