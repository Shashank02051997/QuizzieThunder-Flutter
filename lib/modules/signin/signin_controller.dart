import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final GlobalKey<FormState> signinFormKey =
      GlobalKey<FormState>(debugLabel: '__signinFormKey__');

  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  var passwordInVisible = true.obs;
}
