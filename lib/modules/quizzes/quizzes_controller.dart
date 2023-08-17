import 'package:get/get.dart';

import '../../apis/quizzes_api.dart';
import '../../models/all_quiz_response_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../utils/enums/snackbar_status.dart';

class QuizzesController extends GetxController {
  QuizzesApi quizzesApi = QuizzesApi();
  final arguments = Get.arguments;

  var allQuizzes = <Quiz>[];

  var isLoading = false.obs;

  var quizCategoryId = "";
  var quizCategoryName = "";

  @override
  void onInit() {
    if (arguments != null) {
      quizCategoryId = arguments[ARG_QUIZ_CATEGORY_ID] ?? "";
      quizCategoryName = arguments[ARG_QUIZ_CATEGORY_NAME] ?? "";
    }
    if (quizCategoryId.isEmpty)
      getAllQuizList();
    else
      getAllQuizOfSpeacificCategory();
    super.onInit();
  }

  void getAllQuizList() async {
    isLoading.value = true;
    var response = await quizzesApi.getAllQuizList();
    if (response.code == 200) {
      allQuizzes.clear();
      allQuizzes.addAll(response.quizzes ?? List.empty());
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }

  void getAllQuizOfSpeacificCategory() async {
    isLoading.value = true;
    var response = await quizzesApi.getAllQuizOfSpeacificCategory(
        quizCategoryId: quizCategoryId);
    if (response.code == 200) {
      allQuizzes.clear();
      allQuizzes.addAll(response.quizzes ?? List.empty());
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
