import 'package:get/get.dart';

import '../../apis/leaderboard_api.dart';
import '../../models/leaderboard_screen_response_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/enums/snackbar_status.dart';

class LeaderboardController extends GetxController {
  var selectedTabIndex = 0.obs;

  LeaderboardApi leaderboardApi = LeaderboardApi();

  var isLoading = false.obs;

  LeaderboardScreenResponseModel? leaderboardScreenResponseModel;

  @override
  void onInit() {
    getLeaderboardScreenDetails();
    super.onInit();
  }

  void getLeaderboardScreenDetails() async {
    isLoading.value = true;
    var response = await leaderboardApi.getLeaderboardScreenDetails();
    if (response.code == 200) {
      isLoading.value = false;
      leaderboardScreenResponseModel = response;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
