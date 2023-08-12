import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../theme/colors_theme.dart';
import 'verify_otp_controller.dart';

class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyOtpController verifyOtpController = Get.find<VerifyOtpController>();
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
          backgroundColor: Colors.transparent,
          centerTitle: false,
          elevation: 0,
        ),
        backgroundColor: ThemeColor.lighterPrimary,
        body: Obx(() => verifyOtpController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "You've got SMS 📲",
                            style: TextStyle(
                                fontSize: 24,
                                color: ThemeColor.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 44,
                          ),
                          Text(
                            "We have sent the OTP verification code to your mobile number. Check your mobile number and enter the code below",
                            style: TextStyle(
                                fontSize: 14, color: ThemeColor.textPrimary),
                          ),
                          SizedBox(
                            height: 44,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                otpInputField(
                                    verifyOtpController.firstOtpDigitController,
                                    verifyOtpController.firstFocusNode),
                                otpInputField(
                                    verifyOtpController
                                        .secondOtpDigitController,
                                    verifyOtpController.secondFocusNode),
                                otpInputField(
                                    verifyOtpController.thirdOtpDigitController,
                                    verifyOtpController.thirdFocusNode),
                                otpInputField(
                                    verifyOtpController
                                        .fourthOtpDigitController,
                                    verifyOtpController.fourthFocusNode),
                              ]),
                          SizedBox(
                            height: 44,
                          ),
                          SizedBox(
                              width: double.infinity,
                              height: 44,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.toNamed(AppRoutes.signInPage);
                                },
                                child: Text("Confirm"),
                                style: TextButton.styleFrom(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  backgroundColor: ThemeColor.primaryDark,
                                ),
                              )),
                        ])))));
  }

  Container otpInputField(
      TextEditingController controller, FocusNode focusNode) {
    return Container(
      width: 60,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        style: TextStyle(
            color: ThemeColor.black, fontSize: 24, fontWeight: FontWeight.bold),
        maxLength: 1,
        maxLines: 1,
        textAlign: TextAlign.center,
        onChanged: (value) {
          if (value.isNotEmpty) {
            focusNode
                .nextFocus(); // Move focus to the next field when a digit is entered
          }
        },
        decoration: InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 16),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: ThemeColor.white,
        ),
        textInputAction: TextInputAction.next,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
