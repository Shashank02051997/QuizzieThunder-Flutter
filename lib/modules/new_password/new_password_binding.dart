import 'package:get/get.dart';

import 'new_password_controller.dart';

class NewPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewPasswordController());
  }
}
