import 'package:get/get.dart';

import '../../apis/home_api.dart';
import '../../models/home_screen_response_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/enums/snackbar_status.dart';

class HomeController extends GetxController {
  HomeApi homeApi = HomeApi();

  var isLoading = false.obs;

  HomeScreenResponseModel? homeScreenResponseModel;

  @override
  void onInit() {
    getHomeScreenDetails();
    super.onInit();
  }

  void getHomeScreenDetails() async {
    isLoading.value = true;
    var response = await homeApi.getHomeScreenDetails();
    if (response.code == 200) {
      homeScreenResponseModel = response;
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
