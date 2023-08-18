import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../theme/colors_theme.dart';
import '../../utils/app_utils.dart';
import 'profile_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.find<ProfileController>();
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.settingsPage);
                },
                icon: Icon(
                  Icons.settings_rounded,
                  color: ThemeColor.white,
                ))
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: ThemeColor.primary,
        body: Obx(() => profileController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                color: ThemeColor.white,
              ))
            : Stack(
                children: [
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 36),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 16),
                        decoration: BoxDecoration(
                            color: ThemeColor.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Obx(
                          () => SingleChildScrollView(
                              child: Column(
                            children: [
                              SizedBox(
                                height: 44,
                              ),
                              Text(
                                "${profileController.profileScreenResponseModel?.userDetail?.firstname} ${profileController.profileScreenResponseModel?.userDetail?.lastname}",
                                style: TextStyle(
                                    color: ThemeColor.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: ThemeColor.primaryDark,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    userInfoBlock(
                                        Icons.star_border_outlined,
                                        "POINTS",
                                        "${profileController.profileScreenResponseModel?.stats?.points}"),
                                    userInfoBlock(
                                        Icons.bar_chart_outlined,
                                        "RANK",
                                        "#${profileController.profileScreenResponseModel?.rank ?? "--"}"),
                                    userInfoBlock(
                                        Icons.handshake_outlined,
                                        "WON",
                                        "${profileController.profileScreenResponseModel?.stats?.quizWon}"),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          profileController
                                              .selectedTabIndex.value = 0;
                                        },
                                        child: Text(
                                          "Badge",
                                          style: TextStyle(
                                              color: profileController
                                                          .selectedTabIndex
                                                          .value ==
                                                      0
                                                  ? ThemeColor.primaryDark
                                                  : ThemeColor.grey_500,
                                              fontSize: 16,
                                              fontWeight: profileController
                                                          .selectedTabIndex
                                                          .value ==
                                                      0
                                                  ? FontWeight.bold
                                                  : FontWeight.normal),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Visibility(
                                        visible: profileController
                                                .selectedTabIndex.value ==
                                            0,
                                        child: CircleAvatar(
                                          radius: 3,
                                          backgroundColor:
                                              ThemeColor.primaryDark,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          profileController
                                              .selectedTabIndex.value = 1;
                                        },
                                        child: Text(
                                          "Stats",
                                          style: TextStyle(
                                              color: profileController
                                                          .selectedTabIndex
                                                          .value ==
                                                      1
                                                  ? ThemeColor.primaryDark
                                                  : ThemeColor.grey_500,
                                              fontSize: 16,
                                              fontWeight: profileController
                                                          .selectedTabIndex
                                                          .value ==
                                                      1
                                                  ? FontWeight.bold
                                                  : FontWeight.normal),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Visibility(
                                        visible: profileController
                                                .selectedTabIndex.value ==
                                            1,
                                        child: CircleAvatar(
                                          radius: 3,
                                          backgroundColor:
                                              ThemeColor.primaryDark,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          profileController
                                              .selectedTabIndex.value = 2;
                                        },
                                        child: Text(
                                          "Details",
                                          style: TextStyle(
                                              color: profileController
                                                          .selectedTabIndex
                                                          .value ==
                                                      2
                                                  ? ThemeColor.primaryDark
                                                  : ThemeColor.grey_500,
                                              fontSize: 16,
                                              fontWeight: profileController
                                                          .selectedTabIndex
                                                          .value ==
                                                      2
                                                  ? FontWeight.bold
                                                  : FontWeight.normal),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Visibility(
                                        visible: profileController
                                                .selectedTabIndex.value ==
                                            2,
                                        child: CircleAvatar(
                                          radius: 3,
                                          backgroundColor:
                                              ThemeColor.primaryDark,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              if (profileController.selectedTabIndex.value == 0)
                                badgeSection()
                              else if (profileController
                                      .selectedTabIndex.value ==
                                  1)
                                statsSection(profileController)
                              else
                                detailSection(profileController),
                              SizedBox(
                                height: 64,
                              ),
                            ],
                          )),
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppUtils.getRandomAvatarBgColor(),
                        radius: 36,
                        child: ClipOval(
                          child: Image.asset(
                            "assets/images/avatar.png",
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )));
  }

  Container detailSection(ProfileController profileController) {
    return Container(
      width: double.infinity,
      child: Text(
        "${profileController.profileScreenResponseModel?.userDetail?.about ?? ""}",
        textAlign: TextAlign.left,
        style: TextStyle(color: ThemeColor.black, fontSize: 16),
      ),
    );
  }

  Stack statsSection(ProfileController profileController) {
    return Stack(children: [
      Image.asset(
        "assets/images/stats_bg.png",
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 64,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: "You have played a total ",
                        style: TextStyle(
                          color: ThemeColor.black,
                        ),
                      ),
                      TextSpan(
                          text:
                              "${profileController.profileScreenResponseModel?.stats?.quizPlayed} quizzes ",
                          style: TextStyle(
                              color: ThemeColor.accent,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "this month",
                          style: TextStyle(
                              color: ThemeColor.black,
                              fontWeight: FontWeight.bold)),
                    ])),
            SizedBox(
              height: 36,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  child: CircularProgressIndicator(
                    value: 0.6,
                    color: ThemeColor.primaryDark,
                    backgroundColor: ThemeColor.white,
                    strokeWidth: 10,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "37",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: ThemeColor.black,
                      ),
                    ),
                    Text(
                      "quiz played",
                      style: TextStyle(
                        fontSize: 12,
                        color: ThemeColor.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 44,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: ThemeColor.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "5",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ThemeColor.black,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Quiz Created",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ThemeColor.black,
                        ),
                      ),
                    ],
                  ),
                )),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: ThemeColor.accent,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "5",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: ThemeColor.white,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Quiz Created",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ThemeColor.white,
                          ),
                        ),
                      ]),
                ))
              ],
            )
          ],
        ),
      )
    ]);
  }

  GridView badgeSection() {
    return GridView.builder(
      itemCount: 6,
      padding: const EdgeInsets.all(12),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Image.asset(
          "assets/images/lock_badge.png",
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 32,
        mainAxisSpacing: 16,
      ),
    );
  }

  Column userInfoBlock(IconData icon, String title, String subTitle) {
    return Column(
      children: [
        Icon(
          icon,
          color: ThemeColor.white,
          size: 24,
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: TextStyle(
              color: ThemeColor.white.withOpacity(0.5),
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          subTitle,
          style: TextStyle(
              color: ThemeColor.white,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        )
      ],
    );
  }
}
