import 'package:get/get.dart';

import '../../apis/quiz_result_api.dart';
import '../../models/quiz_result_post_body_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../utils/enums/snackbar_status.dart';
import '../profile/profile_controller.dart';

class QuizResultController extends GetxController {
  ProfileController profileController = Get.find<ProfileController>();
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
      profileController.getProfileScreenDetails();
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
