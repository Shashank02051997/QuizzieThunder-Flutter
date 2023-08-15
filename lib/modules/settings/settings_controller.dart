import 'package:get/get.dart';

import '../../utils/app_utils.dart';

class SettingsController extends GetxController {
  var phoneNumber = "";

  @override
  void onInit() {
    phoneNumber = AppUtils.loginUserDetail().result?.mobile ?? "";
    super.onInit();
  }
}
