import 'package:get/get.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';

class SettingsController extends GetxController {
  var email = "";

  @override
  void onInit() {
    email = AppUtils.loginUserDetail().result?.email ?? "";
    super.onInit();
  }
}
