import 'package:get/get.dart';

import '../../apis/discover_api.dart';
import '../../models/discover_screen_response_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/enums/snackbar_status.dart';

class DiscoverController extends GetxController {
  DiscoverApi discoverApi = DiscoverApi();

  var isLoading = false.obs;

  DiscoverScreenResponseModel? discoverScreenResponseModel;

  @override
  void onInit() {
    getDiscoverScreenDetails();
    super.onInit();
  }

  void getDiscoverScreenDetails() async {
    isLoading.value = true;
    var response = await discoverApi.getDiscoverScreenDetails();
    if (response.code == 200) {
      discoverScreenResponseModel = response;
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
