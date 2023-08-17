import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors_theme.dart';
import 'quiz_question_controller.dart';

class QuizQuestionPage extends StatelessWidget {
  const QuizQuestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuizQuestionController quizQuestionController =
        Get.find<QuizQuestionController>();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.close_rounded,
                color: ThemeColor.white,
              )),
          backgroundColor: Colors.transparent,
          centerTitle: false,
          elevation: 0,
        ),
        backgroundColor: ThemeColor.primary,
        body: Obx(() => quizQuestionController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                color: ThemeColor.white,
              ))
            : Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: ThemeColor.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        "QUESTION ${quizQuestionController.questionCount.value + 1} OF 10",
                        style: TextStyle(
                            color: ThemeColor.grey_500,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "${quizQuestionController.allQuestions[quizQuestionController.questionCount.value].question}",
                        style: TextStyle(
                            color: ThemeColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 44,
                      ),
                      optionContainerList(quizQuestionController),
                      Spacer(),
                      SizedBox(
                          width: double.infinity,
                          height: 44,
                          child: ElevatedButton(
                            onPressed: () {
                              quizQuestionController.nextQuestion(
                                  isSkipped: true);
                            },
                            child: Text("Skip"),
                            style: TextButton.styleFrom(
                              textStyle: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              backgroundColor: ThemeColor.primaryDark,
                            ),
                          )),
                    ],
                  ),
                ),
              )));
  }

  Column optionContainerList(QuizQuestionController quizQuestionController) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: quizQuestionController
          .allQuestions[quizQuestionController.questionCount.value].options
          .asMap()
          .entries
          .map((entry) =>
              optionContainer(entry.key, entry.value, quizQuestionController))
          .toList(),
    );
  }

  Column optionContainer(int index, String optionName,
      QuizQuestionController quizQuestionController) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            quizQuestionController.nextQuestion(selectedOption: index);
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: ThemeColor.white,
                border: Border.all(
                    color: ThemeColor.lightPrimary.withOpacity(0.4), width: 2),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              "$optionName",
              style: TextStyle(
                color: ThemeColor.black,
                fontSize: 14,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
