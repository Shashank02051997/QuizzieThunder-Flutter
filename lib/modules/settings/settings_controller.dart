import 'package:get/get.dart';

import '../../utils/app_utils.dart';

class SettingsController extends GetxController {
  var email = "";

  @override
  void onInit() {
    email = AppUtils.loginUserDetail().result?.email ?? "";
    super.onInit();
  }
}
