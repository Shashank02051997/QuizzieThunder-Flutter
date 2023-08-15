import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apis/new_password_api.dart';
import '../../models/reset_password_post_body_model.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../utils/enums/snackbar_status.dart';

class NewPasswordController extends GetxController {
  ResetPasswordApi resetPasswordApi = ResetPasswordApi();

  final arguments = Get.arguments;

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isLoading = false.obs;
  var passwordInVisible = true.obs;
  var confirmPasswordInVisible = true.obs;

  var errorMessage = "";
  var phoneNumber = "";

  @override
  void onInit() {
    if (arguments != null) phoneNumber = arguments[ARG_PHONE_NUMBER];
    super.onInit();
  }

  bool _newPasswordFormValidation() {
    if (passwordController.text.isEmpty) {
      errorMessage = "Password should not be empty";
      return false;
    } else if (confirmPasswordController.text.isEmpty) {
      errorMessage = "Confirm password should not be empty";
      return false;
    } else if (passwordController.text == confirmPasswordController.text) {
      errorMessage = "Password and Confirm password not matched";
      return false;
    } else {
      return true;
    }
  }

  void resetPassword() async {
    if (_newPasswordFormValidation()) {
      ResetPasswordPostBodyModel resetPasswordPostBodyModel =
          ResetPasswordPostBodyModel(
              mobile: phoneNumber, newPassword: confirmPasswordController.text);
      isLoading.value = true;
      var response = await resetPasswordApi.resetPassword(
          resetPasswordPostBodyModel: resetPasswordPostBodyModel);
      if (response.code == 200) {
        isLoading.value = false;
        Get.offAndToNamed(AppRoutes.signInPage);
        AppUtils.showSnackBar(
            response.message ?? "Password updated successfully. Please login",
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
