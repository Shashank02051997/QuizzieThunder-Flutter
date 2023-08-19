import 'package:get/get.dart';
import 'package:quizzie_thunder/models/quiz_result_post_body_model.dart';
import 'package:quizzie_thunder/utils/constants.dart';

import '../../apis/quiz_result_api.dart';
import '../../utils/app_utils.dart';
import '../../utils/enums/snackbar_status.dart';

class QuizResultController extends GetxController {
  QuizResultApi quizResultApi = QuizResultApi();

  final arguments = Get.arguments;

  var quizName = "";
  var quizCategoryName = "";
  var skipQuestionCount = 0;
  var correctAnswerCount = 0;
  var incorrectAnswerCount = 0;
  var completionPercentage = 0;

  var isLoading = false.obs;

  @override
  void onInit() {
    if (arguments != null) {
      quizName = arguments[ARG_QUIZ_NAME] ?? "";
      quizCategoryName = arguments[ARG_QUIZ_CATEGORY_NAME] ?? "";
      skipQuestionCount = arguments[ARG_SKIPPED_QUESTIONS_COUNT];
      correctAnswerCount = arguments[ARG_CORRECT_ANSWER_COUNT];
      incorrectAnswerCount = arguments[ARG_INCORRECT_ANSWER_COUNT];
      completionPercentage =
          (skipQuestionCount + correctAnswerCount + incorrectAnswerCount) * 10;
    }
    postQuizResult();
    super.onInit();
  }

  void postQuizResult() async {
    isLoading.value = true;
    QuizResultPostBodyModel quizResultPostBodyModel =
        QuizResultPostBodyModel(points: correctAnswerCount * 10);
    var response = await quizResultApi.submitQuizResult(
        quizResultPostBodyModel: quizResultPostBodyModel);
    if (response.code == 200) {
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
