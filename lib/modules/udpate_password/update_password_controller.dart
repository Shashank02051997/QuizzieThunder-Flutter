import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apis/new_password_api.dart';
import '../../models/update_password_post_body_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/enums/snackbar_status.dart';

class UpdatePasswordController extends GetxController {
  ResetPasswordApi resetPasswordApi = ResetPasswordApi();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isLoading = false.obs;
  var passwordInVisible = true.obs;
  var confirmPasswordInVisible = true.obs;

  var errorMessage = "";

  bool _udpatePasswordFormValidation() {
    if (passwordController.text.isEmpty) {
      errorMessage = "Password should not be empty";
      return false;
    } else if (confirmPasswordController.text.isEmpty) {
      errorMessage = "Confirm password should not be empty";
      return false;
    } else if (passwordController.text != confirmPasswordController.text) {
      errorMessage = "Password and Confirm password not matched";
      return false;
    } else {
      return true;
    }
  }

  void updatePassword() async {
    if (_udpatePasswordFormValidation()) {
      UpdatePasswordPostBodyModel updatePasswordPostBodyModel =
          UpdatePasswordPostBodyModel(
              newPassword: confirmPasswordController.text);
      isLoading.value = true;
      var response = await resetPasswordApi.updatePassword(
          updatePasswordPostBodyModel: updatePasswordPostBodyModel);
      if (response.code == 200) {
        isLoading.value = false;
        AppUtils.showSnackBar(
            response.message ?? "Password updated successfully",
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
