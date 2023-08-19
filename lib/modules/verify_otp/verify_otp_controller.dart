import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apis/verify_otp_api.dart';
import '../../models/verify_otp_post_body_model.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../utils/enums/snackbar_status.dart';

class VerifyOtpController extends GetxController {
  VerifyOtpApi verifyOtpApi = VerifyOtpApi();

  final arguments = Get.arguments;

  final firstOtpDigitController = TextEditingController();
  final secondOtpDigitController = TextEditingController();
  final thirdOtpDigitController = TextEditingController();
  final fourthOtpDigitController = TextEditingController();
  final fifthOtpDigitController = TextEditingController();
  final sixthOtpDigitController = TextEditingController();

  final firstFocusNode = FocusNode();
  final secondFocusNode = FocusNode();
  final thirdFocusNode = FocusNode();
  final fourthFocusNode = FocusNode();
  final fifthFocusNode = FocusNode();
  final sixthFocusNode = FocusNode();

  var isLoading = false.obs;
  var phoneNumber = "".obs;

  @override
  void onInit() {
    if (arguments != null) phoneNumber.value = arguments[ARG_PHONE_NUMBER];
    super.onInit();
  }

  var errorMessage = "";

  bool _verifyOtpFieldValidation() {
    if (firstOtpDigitController.text.isEmpty ||
        secondOtpDigitController.text.isEmpty ||
        thirdOtpDigitController.text.isEmpty ||
        fourthOtpDigitController.text.isEmpty ||
        fifthOtpDigitController.text.isEmpty ||
        sixthOtpDigitController.text.isEmpty) {
      errorMessage = "OTP fields should not be empty";
      return false;
    } else {
      return true;
    }
  }

  void verifyOtp() async {
    if (_verifyOtpFieldValidation()) {
      isLoading.value = true;
      final otp = firstOtpDigitController.text +
          secondOtpDigitController.text +
          thirdOtpDigitController.text +
          fourthOtpDigitController.text +
          fifthOtpDigitController.text +
          sixthOtpDigitController.text;
      VerifyOtpPostBodyModel verifyOtpPostBodyModel =
          VerifyOtpPostBodyModel(mobile: phoneNumber.value, otp: otp);
      var response = await verifyOtpApi.verifyOtp(
          verifyOtpPostBodyModel: verifyOtpPostBodyModel);
      if (response.code == 200) {
        isLoading.value = false;
        Get.offAllNamed(AppRoutes.signInPage);
        AppUtils.showSnackBar(
            response.message ??
                "Mobile number verified successfully. Please login",
            title: "Verified",
            status: MessageStatus.SUCCESS);
      } else {
        isLoading.value = false;
        AppUtils.showSnackBar(response.message ?? "Error",
            status: MessageStatus.ERROR);
      }
    } else {
      AppUtils.showSnackBar(errorMessage, status: MessageStatus.ERROR);
    }
  }
}
