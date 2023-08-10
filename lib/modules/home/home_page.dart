import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors_theme.dart';
import '../../utils/app_utils.dart';
import '../../widgets/quiz_item_container.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();
    return Scaffold(
        backgroundColor: ThemeColor.primary,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 36,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "GOOD MORNING",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: ThemeColor.candyPink),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Madelyn Dias",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: ThemeColor.white),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: AppUtils.getRandomColor(),
                      child: Text(
                        "MD",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: ThemeColor.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/most_played_quiz_bg.png",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 4,
                          ),
                          Text("MOST PLAYED QUIZ",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeColor.dustyRose)),
                          SizedBox(
                            height: 8,
                          ),
                          Text("A Basic Music Quiz",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeColor.burgundy))
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Stack(children: [
                  Image.asset(
                    "assets/images/featured_bg.png",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 32,
                            ),
                            Text("FEATURED",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: ThemeColor.white.withOpacity(0.8))),
                            SizedBox(
                              height: 16,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                  "Take part in the challenges\nwith friends or other\nplayers",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: ThemeColor.white)),
                            )
                          ]))
                ]),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  decoration: BoxDecoration(
                      color: ThemeColor.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Quizzes",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: ThemeColor.black),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "See all",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeColor.primaryDark),
                            ),
                          )
                        ],
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 8);
                          },
                          scrollDirection: Axis.vertical,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return QuizItemContainer();
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 64,
                ),
              ],
            ),
          ),
        ));
  }
}
