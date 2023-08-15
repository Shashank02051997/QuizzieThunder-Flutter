import 'package:get/get.dart';

import '../../apis/quizzes_api.dart';
import '../../models/all_quiz_response_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/enums/snackbar_status.dart';

class QuizzesController extends GetxController {
  QuizzesApi quizzesApi = QuizzesApi();

  var allQuizzes = <Quiz>[];

  var isLoading = false.obs;

  @override
  void onInit() {
    getAllQuizList();
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
}
