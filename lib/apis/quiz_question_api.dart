import '../models/quiz_question_response_model.dart';
import '../utils/dio_client.dart';

class QuizQuestionApi {
  Future<QuizQuestionResponseModel> getQuizQuestionList(
      {required String? quizId}) async {
    try {
      final response = await DioClient.getDioInstance()
          .get("api/question/$quizId/questions");
      return QuizQuestionResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
