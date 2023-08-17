import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/utils/constants.dart';

import '../../routes/app_routes.dart';
import '../../theme/colors_theme.dart';
import 'quiz_detail_controller.dart';

class QuizDetailPage extends StatelessWidget {
  const QuizDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuizDetailController quizDetailController =
        Get.find<QuizDetailController>();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: ThemeColor.white,
              )),
          backgroundColor: Colors.transparent,
          centerTitle: false,
          elevation: 0,
        ),
        backgroundColor: ThemeColor.primary,
        body: Stack(
          children: [
            Image.asset(
              "assets/images/quiz_detail_bg.png",
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: ThemeColor.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${quizDetailController.quizDetail?.category?.title.toString().toUpperCase()}",
                          style: TextStyle(
                              color: ThemeColor.grey_500,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "${quizDetailController.quizDetail?.title}",
                          style: TextStyle(
                              color: ThemeColor.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                                color: ThemeColor.candyPink,
                                borderRadius: BorderRadius.circular(16)),
                            child: Text(
                              "The more you answer correctly, higher is the score. Higher the score, better is the rank. All the best!",
                              style: TextStyle(
                                  color: ThemeColor.black, fontSize: 12),
                            )),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                              color: ThemeColor.lighterPrimary,
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: ThemeColor.accent,
                                    radius: 14,
                                    child: Icon(
                                      Icons.question_mark_rounded,
                                      color: ThemeColor.white,
                                      size: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text("10 questions",
                                      style: TextStyle(
                                          color: ThemeColor.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                ],
                              )),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                  child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: ThemeColor.lightPink,
                                    radius: 14,
                                    child: Icon(
                                      Icons.extension_rounded,
                                      color: ThemeColor.white,
                                      size: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text("+100 points",
                                      style: TextStyle(
                                          color: ThemeColor.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          "DESCRIPTION",
                          style: TextStyle(
                              color: ThemeColor.grey_500,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "${quizDetailController.quizDetail?.description}",
                          style: TextStyle(
                            color: ThemeColor.black,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 44,
                        ),
                        SizedBox(
                            width: double.infinity,
                            height: 44,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed(AppRoutes.quizQuestionPage,
                                    arguments: {
                                      ARG_QUIZ_ID:
                                          quizDetailController.quizDetail?.id
                                    });
                              },
                              child: Text("Start Quiz"),
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
                )
              ],
            )
          ],
        ));
  }
}
