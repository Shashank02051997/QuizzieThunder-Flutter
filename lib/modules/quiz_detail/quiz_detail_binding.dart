import 'package:get/get.dart';

import 'quiz_detail_controller.dart';

class QuizDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizDetailController());
  }
}
