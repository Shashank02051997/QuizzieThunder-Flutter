import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileController extends GetxController {
  final GlobalKey<FormState> updateProfileFormKey =
      GlobalKey<FormState>(debugLabel: '__updateProfileFormKey__');

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final aboutController = TextEditingController();

  var isLoading = false.obs;
}
