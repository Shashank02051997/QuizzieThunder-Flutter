import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  final firstOtpDigitController = TextEditingController();
  final secondOtpDigitController = TextEditingController();
  final thirdOtpDigitController = TextEditingController();
  final fourthOtpDigitController = TextEditingController();

  final firstFocusNode = FocusNode();
  final secondFocusNode = FocusNode();
  final thirdFocusNode = FocusNode();
  final fourthFocusNode = FocusNode();
  var isLoading = false.obs;
}
