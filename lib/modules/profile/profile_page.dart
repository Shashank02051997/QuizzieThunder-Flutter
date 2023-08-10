import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                onPressed: () {},
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
                  child: SingleChildScrollView(
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
                        )
                      ],
                    ),
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
}
