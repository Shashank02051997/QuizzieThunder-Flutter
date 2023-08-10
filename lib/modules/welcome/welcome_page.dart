import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/routes/app_routes.dart';

import '../../theme/colors_theme.dart';
import 'welcome_controller.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WelcomeController welcomeController = Get.find<WelcomeController>();
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
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/people_connect.png",
                      width: 280,
                      height: 280,
                    ),
                    SizedBox(
                      height: 84,
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
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: ThemeColor.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(children: [
                          Text(
                            "Take part in challenges with friends",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: ThemeColor.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          SizedBox(
                              width: double.infinity,
                              height: 44,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.toNamed(AppRoutes.signUpPage);
                                },
                                child: Text("Sign Up"),
                                style: TextButton.styleFrom(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  backgroundColor: ThemeColor.primaryDark,
                                ),
                              )),
                          SizedBox(
                            height: 16,
                          ),
                          RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                  children: [
                                TextSpan(
                                  text: "Already have an account? ",
                                  style: TextStyle(
                                    color: ThemeColor.grey_500,
                                  ),
                                ),
                                TextSpan(
                                    text: "Login",
                                    style: TextStyle(
                                        color: ThemeColor.primary,
                                        fontWeight: FontWeight.bold),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () =>
                                          Get.toNamed(AppRoutes.signInPage))
                              ]))
                        ]),
                      )
                    ]))
          ],
        ));
  }
}
