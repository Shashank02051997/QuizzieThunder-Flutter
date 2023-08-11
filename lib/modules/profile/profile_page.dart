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
        body: Stack(
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 36),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
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
                          "Madelyn Dias",
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              userInfoBlock(
                                  Icons.star_border_outlined, "POINTS", "590"),
                              userInfoBlock(
                                  Icons.bar_chart_outlined, "RANK", "#1,970"),
                              userInfoBlock(
                                  Icons.handshake_outlined, "WON", "44"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    profileController.selectedTabIndex.value =
                                        0;
                                  },
                                  child: Text(
                                    "Badge",
                                    style: TextStyle(
                                        color: profileController
                                                    .selectedTabIndex.value ==
                                                0
                                            ? ThemeColor.primaryDark
                                            : ThemeColor.grey_500,
                                        fontSize: 16,
                                        fontWeight: profileController
                                                    .selectedTabIndex.value ==
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
                                    backgroundColor: ThemeColor.primaryDark,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    profileController.selectedTabIndex.value =
                                        1;
                                  },
                                  child: Text(
                                    "Stats",
                                    style: TextStyle(
                                        color: profileController
                                                    .selectedTabIndex.value ==
                                                1
                                            ? ThemeColor.primaryDark
                                            : ThemeColor.grey_500,
                                        fontSize: 16,
                                        fontWeight: profileController
                                                    .selectedTabIndex.value ==
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
                                    backgroundColor: ThemeColor.primaryDark,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    profileController.selectedTabIndex.value =
                                        2;
                                  },
                                  child: Text(
                                    "Details",
                                    style: TextStyle(
                                        color: profileController
                                                    .selectedTabIndex.value ==
                                                2
                                            ? ThemeColor.primaryDark
                                            : ThemeColor.grey_500,
                                        fontSize: 16,
                                        fontWeight: profileController
                                                    .selectedTabIndex.value ==
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
                                    backgroundColor: ThemeColor.primaryDark,
                                  ),
                                )
                              ],
                            )
                          ],
                        )
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
        ));
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
