import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final GlobalKey<FormState> forgotPasswodFormKey =
      GlobalKey<FormState>(debugLabel: '__forgotPasswodFormKey__');
  final GlobalKey<FormState> newPasswodFormKey =
      GlobalKey<FormState>(debugLabel: '__newPasswodFormKey__');

  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isLoading = false.obs;
  var passwordInVisible = true.obs;
}
