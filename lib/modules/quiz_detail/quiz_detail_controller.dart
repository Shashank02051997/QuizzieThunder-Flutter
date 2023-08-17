import 'package:get/get.dart';

import '../../models/all_quiz_response_model.dart';
import '../../utils/constants.dart';

class QuizDetailController extends GetxController {
  final arguments = Get.arguments;

  Quiz? quizDetail;
  var quizCategoryName = "";

  @override
  void onInit() {
    if (arguments != null) {
      quizDetail = arguments[ARG_QUIZ_DETAIL];
      quizCategoryName = arguments[ARG_QUIZ_CATEGORY_NAME] ?? "";
    }
    super.onInit();
  }
}
