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
  var optionSelectedIndex = (-1).obs;
  var isAnswerCorrect = (-1).obs;

  var quizId = "";
  var quizName = "";
  var quizCategoryName = "";
  var skipQuestionCount = 0;
  var correctAnswerCount = 0;
  var incorrectAnswerCount = 0;

  @override
  void onInit() {
    if (arguments != null) {
      quizId = arguments[ARG_QUIZ_ID];
      quizName = arguments[ARG_QUIZ_NAME] ?? "";
      quizCategoryName = arguments[ARG_QUIZ_CATEGORY_NAME] ?? "";
    }
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

  void nextQuestion({bool isSkipped = false, int selectedOption = -1}) async {
    isAnswerCorrect.value = -1;
    optionSelectedIndex.value = selectedOption;
    if (isSkipped) {
      isAnswerCorrect.value = -1;
      optionSelectedIndex.value = -1;
      skipQuestionCount++;
    } else {
      await Future.delayed(Duration(seconds: 1));
      if (allQuestions[questionCount.value].correctOptionIndex ==
          selectedOption) {
        isAnswerCorrect.value = 1;
        await Future.delayed(Duration(seconds: 1));
        correctAnswerCount++;
      } else {
        isAnswerCorrect.value = 0;
        await Future.delayed(Duration(seconds: 1));
        incorrectAnswerCount++;
      }
    }
    if (questionCount.value == 9) {
      endQuiz();
    } else {
      isAnswerCorrect.value = -1;
      optionSelectedIndex.value = -1;
      questionCount.value += 1;
    }
  }

  void endQuiz() {
    Get.offAndToNamed(AppRoutes.quizResultPage, arguments: {
      ARG_SKIPPED_QUESTIONS_COUNT: skipQuestionCount,
      ARG_CORRECT_ANSWER_COUNT: correctAnswerCount,
      ARG_INCORRECT_ANSWER_COUNT: incorrectAnswerCount
    });
  }
}
