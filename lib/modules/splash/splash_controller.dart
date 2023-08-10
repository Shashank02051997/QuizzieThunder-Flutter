import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../routes/app_routes.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';

class SplashController extends GetxController {
  final localStorage = GetStorage();
  var appVersion = "".obs;

  @override
  void onInit() {
    getAppDetails();
    super.onInit();
  }

  @override
  void onReady() {
    if (GetStorage().read(KEY_USER_DATA) != null)
      print("Token = ${AppUtils.loginUserDetail().result?.token}");
    Future.delayed(
        Duration(seconds: 3),
        () => localStorage.read(KEY_USER_DATA) == null
            ? Get.offNamed(AppRoutes.welcomePage)
            : Get.offNamed(AppRoutes.signInPage));
    super.onReady();
  }

  void getAppDetails() async {
    Map<String, String> appDetails = await AppUtils.getAppDetails();
    appVersion.value = appDetails["version"] ?? "";
  }
}
