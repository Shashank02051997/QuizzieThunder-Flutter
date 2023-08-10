import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors_theme.dart';
import '../../utils/app_utils.dart';
import 'discover_controller.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DiscoverController discoverController = Get.find<DiscoverController>();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Discover",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ThemeColor.white),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: ThemeColor.primary,
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  Stack(children: [
                    Image.asset(
                      "assets/images/top_pick_bg.png",
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
                                height: 84,
                              ),
                              Text("Travel Trivia Quiz",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: ThemeColor.burgundy)),
                              SizedBox(
                                height: 8,
                              ),
                              Text("Travel - 12 Questions",
                                  style: TextStyle(
                                      fontSize: 12, color: ThemeColor.burgundy))
                            ])),
                  ]),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          color: ThemeColor.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Top rank of the week",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeColor.black),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Stack(children: [
                              Image.asset(
                                "assets/images/top_rank_bg.png",
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 24,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: ThemeColor.white,
                                                )),
                                            child: Text(
                                              "1",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: ThemeColor.white),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          CircleAvatar(
                                            backgroundColor:
                                                AppUtils.getRandomColor(),
                                            radius: 24,
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Brandon Matrovs",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: ThemeColor.white),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                "124 points",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: ThemeColor.white),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ))
                            ]),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Categories",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeColor.black),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            GridView.builder(
                              itemCount: 10,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Card(
                                    color: ThemeColor.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    elevation: 2,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 44,
                                          height: 44,
                                          decoration: BoxDecoration(
                                              color: ThemeColor.lightBlue,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          padding: const EdgeInsets.all(8),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                          "Math",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: ThemeColor.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "21 Quizzes",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ThemeColor.white,
                                          ),
                                        )
                                      ],
                                    ));
                              },
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                            )
                          ])),
                  SizedBox(
                    height: 64,
                  ),
                ]))));
  }
}
