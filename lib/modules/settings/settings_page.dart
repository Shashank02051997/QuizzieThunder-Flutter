import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../theme/colors_theme.dart';
import '../../utils/app_utils.dart';
import 'settings_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController settingsController = Get.find<SettingsController>();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: ThemeColor.black,
              )),
          title: Text(
            "Settings",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ThemeColor.black),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: false,
          elevation: 0,
        ),
        backgroundColor: ThemeColor.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ACCOUNT",
                    style: TextStyle(
                        color: ThemeColor.grey_500,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.updateProfilePage);
                  },
                  child: settingsInfoContainer(
                      Icons.person_outline_rounded,
                      "Update Profile",
                      "Update first name, last name, avatar etc"),
                ),
                SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () {},
                  child: settingsInfoContainer(Icons.mail_outline_rounded,
                      "Change Email Address", "${settingsController.email}"),
                ),
                SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.updatePasswordPage);
                  },
                  child: settingsInfoContainer(Icons.lock_outline_rounded,
                      "Change Password", "Last changed 1 month ago"),
                ),
                SizedBox(
                  height: 24,
                ),
                Text("OTHER",
                    style: TextStyle(
                        color: ThemeColor.grey_500,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                settingsInfoContainer(Icons.question_mark_rounded, "FAQ",
                    "Most frequently asked questions"),
                SizedBox(
                  height: 44,
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      AppUtils.logout();
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(
                          color: ThemeColor.lightRed,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Container settingsInfoContainer(
      IconData icon, String title, String subTitle) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ThemeColor.lighterPrimary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: ThemeColor.white,
                radius: 18,
                child: Icon(
                  icon,
                  color: ThemeColor.primaryDark,
                  size: 22,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, color: ThemeColor.black),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                        fontSize: 12, color: ThemeColor.textSecondary),
                  ),
                ],
              )
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: ThemeColor.darkGrey,
            size: 16,
          ),
        ],
      ),
    );
  }
}
