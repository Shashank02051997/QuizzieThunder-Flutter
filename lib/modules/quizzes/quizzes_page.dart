import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors_theme.dart';
import '../../widgets/quiz_item_container.dart';
import 'quizzes_controller.dart';

class QuizzesPage extends StatelessWidget {
  const QuizzesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuizzesController quizzesController = Get.find<QuizzesController>();
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
          title: Text(
            "Quizzes",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ThemeColor.white),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: false,
          elevation: 0,
        ),
        backgroundColor: ThemeColor.primary,
        body: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
            decoration: BoxDecoration(
                color: ThemeColor.lighterPrimary,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 8);
                },
                scrollDirection: Axis.vertical,
                itemCount: 10,
                padding: const EdgeInsets.only(top: 16, bottom: 24),
                itemBuilder: (context, index) {
                  return QuizItemContainer();
                }),
          ),
        ));
  }
}
