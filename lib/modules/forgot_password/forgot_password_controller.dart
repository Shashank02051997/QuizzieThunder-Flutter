import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apis/forgot_password_api.dart';
import '../../models/forgot_password_post_body_model.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../utils/enums/snackbar_status.dart';

class ForgotPasswordController extends GetxController {
  ForgotPasswordApi forgotPasswordApi = ForgotPasswordApi();

  final GlobalKey<FormState> forgotPasswodFormKey =
      GlobalKey<FormState>(debugLabel: '__forgotPasswodFormKey__');

  final phoneNumberController = TextEditingController();

  var isLoading = false.obs;
  var passwordInVisible = true.obs;

  var errorMessage = "";

  bool _forgotPasswordFormValidation() {
    if (phoneNumberController.text.isEmpty) {
      errorMessage = "Phone number should not be empty";
      return false;
    } else if (phoneNumberController.text.toString().length != 10) {
      errorMessage = "Enter valid phone number";
      return false;
    } else {
      return true;
    }
  }

  void forgotPassword() async {
    if (_forgotPasswordFormValidation()) {
      ForgotPasswordPostBodyModel forgotPasswordPostBodyModel =
          ForgotPasswordPostBodyModel(mobile: phoneNumberController.text);
      isLoading.value = true;
      var response = await forgotPasswordApi.forgotPassword(
          forgotPasswordPostBodyModel: forgotPasswordPostBodyModel);
      if (response.code == 200) {
        isLoading.value = false;
        Get.toNamed(AppRoutes.createNewPasswordPage,
            arguments: {ARG_PHONE_NUMBER: phoneNumberController.text});
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
