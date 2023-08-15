import '../models/all_quiz_response_model.dart';
import '../utils/dio_client.dart';

class QuizzesApi {
  Future<AllQuizResponseModel> getAllQuizList() async {
    try {
      final response =
          await DioClient.getDioInstance().get("api/quiz/all-quiz");
      return AllQuizResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AllQuizResponseModel> getAllQuizOfSpeacificCategory(
      {required String quizCategoryId}) async {
    try {
      final response = await DioClient.getDioInstance()
          .get("api/quiz/category/$quizCategoryId/quizzes");
      return AllQuizResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
