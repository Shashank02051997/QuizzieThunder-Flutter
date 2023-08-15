import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apis/update_profile_api.dart';
import '../../utils/app_utils.dart';
import '../../utils/enums/snackbar_status.dart';

class UpdateProfileController extends GetxController {
  UpdateProfileApi updateProfileApi = UpdateProfileApi();

  final GlobalKey<FormState> updateProfileFormKey =
      GlobalKey<FormState>(debugLabel: '__updateProfileFormKey__');

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final aboutController = TextEditingController();

  var isLoading = false.obs;

  @override
  void onInit() {
    getUserProfile();
    super.onInit();
  }

  void getUserProfile() async {
    isLoading.value = true;
    final userId = AppUtils.loginUserDetail().result?.id ?? "";
    var response = await updateProfileApi.getUserProfile(userId: userId);
    if (response.code == 200) {
      isLoading.value = false;
      firstNameController.text = response.user?.firstname ?? "";
      lastNameController.text = response.user?.lastname ?? "";
      aboutController.text = response.user?.about ?? "";
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
