import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors_theme.dart';
import 'splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.find<SplashController>();
    return Scaffold(
        backgroundColor: ThemeColor.primary,
        body: Stack(
          children: [
            Image.asset(
              "assets/images/splash_bg.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/app_logo.png",
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Quizzie",
                      style: TextStyle(
                          fontSize: 32,
                          color: ThemeColor.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Thunder",
                      style: TextStyle(
                          fontSize: 16,
                          color: ThemeColor.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Obx(() => Text(
                        "App version v${splashController.appVersion.value}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ThemeColor.white,
                          fontSize: 12,
                        ))),
                  ),
                  SizedBox(
                    height: 16,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
