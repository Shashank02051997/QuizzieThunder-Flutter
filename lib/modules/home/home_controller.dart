import 'package:get/get.dart';

import '../../apis/home_api.dart';
import '../../models/home_screen_response_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/enums/snackbar_status.dart';

class HomeController extends GetxController {
  HomeApi homeApi = HomeApi();

  var fullName = "".obs;
  var profilePicUrl = "".obs;
  var isLoading = false.obs;

  HomeScreenResponseModel? homeScreenResponseModel;

  @override
  void onInit() {
    fullName.value =
        "${AppUtils.loginUserDetail().result?.firstname} ${AppUtils.loginUserDetail().result?.lastname}";
    profilePicUrl.value = "${AppUtils.loginUserDetail().result?.profilePic}";
    getHomeScreenDetails();
    super.onInit();
  }

  void getHomeScreenDetails() async {
    isLoading.value = true;
    var response = await homeApi.getHomeScreenDetails();
    if (response.code == 200) {
      isLoading.value = false;
      homeScreenResponseModel = response;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
