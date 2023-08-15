import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apis/signup_api.dart';
import '../../models/signup_post_body_model.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../utils/enums/snackbar_status.dart';

class SignupController extends GetxController {
  SignUpApi signUpApi = SignUpApi();

  final GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(debugLabel: '__signupFormKey__');

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  var passwordInVisible = true.obs;

  var errorMessage = "";

  bool _signUpFormValidation() {
    if (firstNameController.text.isEmpty) {
      errorMessage = "First Name should not be empty";
      return false;
    } else if (lastNameController.text.isEmpty) {
      errorMessage = "Last Name should not be empty";
      return false;
    } else if (emailController.text.isEmpty) {
      errorMessage = "Email address should not be empty";
      return false;
    } else if (!GetUtils.isEmail(emailController.text.toString())) {
      errorMessage = "Enter valid email address";
      return false;
    } else if (phoneNumberController.text.isEmpty) {
      errorMessage = "Phone number should not be empty";
      return false;
    } else if (phoneNumberController.text.toString().length != 10) {
      errorMessage = "Enter valid phone number";
      return false;
    } else if (passwordController.text.isEmpty) {
      errorMessage = "Password should not be empty";
      return false;
    } else {
      return true;
    }
  }

  void signUp() async {
    if (_signUpFormValidation()) {
      SignUpPostBodyModel signUpPostBodyModel = SignUpPostBodyModel(
          firstname: firstNameController.text,
          lastname: lastNameController.text,
          email: emailController.text,
          mobile: phoneNumberController.text,
          password: passwordController.text);
      isLoading.value = true;
      var response =
          await signUpApi.signUp(signUpPostBodyModel: signUpPostBodyModel);
      if (response.code == 200 || response.code == 210) {
        isLoading.value = false;
        Get.toNamed(AppRoutes.verifyOtpPage,
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
