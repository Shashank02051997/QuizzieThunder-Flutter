import 'package:get/get.dart';

import '../../utils/app_utils.dart';

class HomeController extends GetxController {
  var fullName = "".obs;

  @override
  void onInit() {
    fullName.value =
        "${AppUtils.loginUserDetail().result?.firstname} ${AppUtils.loginUserDetail().result?.lastname}";
    super.onInit();
  }
}
