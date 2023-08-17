import 'package:get/get.dart';

import '../../apis/quiz_question_api.dart';
import '../../models/quiz_question_response_model.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../utils/enums/snackbar_status.dart';

class QuizQuestionController extends GetxController {
  QuizQuestionApi quizQuestionApi = QuizQuestionApi();

  final arguments = Get.arguments;

  var allQuestions = <Question>[];

  var isLoading = false.obs;
  var questionCount = 0.obs;

  var quizId = "";
  var skipQuestionCount = 0;
  var correctAnswerCount = 0;
  var incorrectAnswerCount = 0;

  @override
  void onInit() {
    if (arguments != null) quizId = arguments[ARG_QUIZ_ID];
    getAllQuizList();
    super.onInit();
  }

  void getAllQuizList() async {
    isLoading.value = true;
    var response = await quizQuestionApi.getQuizQuestionList(quizId: quizId);
    if (response.code == 200) {
      allQuestions.clear();
      allQuestions.addAll(response.questions ?? List.empty());
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }

  void nextQuestion({bool isSkipped = false, int selectedOption = -1}) {
    if (isSkipped) {
      skipQuestionCount++;
    } else {
      if (allQuestions[questionCount.value].correctOptionIndex ==
          selectedOption)
        correctAnswerCount++;
      else
        incorrectAnswerCount++;
    }
    if (questionCount.value == 9) {
      Get.offAndToNamed(AppRoutes.quizResultPage, arguments: {
        ARG_SKIPPED_QUESTIONS_COUNT: skipQuestionCount,
        ARG_CORRECT_ANSWER_COUNT: correctAnswerCount,
        ARG_INCORRECT_ANSWER_COUNT: incorrectAnswerCount
      });
    } else {
      questionCount.value += 1;
    }
  }
}
