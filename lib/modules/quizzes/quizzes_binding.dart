import 'package:get/get.dart';

import 'quizzes_controller.dart';

class QuizzesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizzesController());
  }
}
