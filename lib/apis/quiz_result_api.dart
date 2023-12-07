import '../models/quiz_result_post_body_model.dart';
import '../models/quiz_result_response_model.dart';
import '../utils/dio_client.dart';

class QuizResultApi {
  Future<QuizResultResponseModel> submitQuizResult(
      {required QuizResultPostBodyModel quizResultPostBodyModel}) async {
    try {
      final response = await DioClient.getDioInstance().put(
          "api/quiz/result/submit-quiz-result",
          data: quizResultPostBodyModel.toJson());
      return QuizResultResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
