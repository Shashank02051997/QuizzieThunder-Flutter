import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apis/update_profile_api.dart';
import '../../models/all_avatar_response_model.dart';
import '../../models/update_profile_post_body_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/enums/snackbar_status.dart';
import '../profile/profile_controller.dart';

class UpdateProfileController extends GetxController {
  ProfileController profileController = Get.find<ProfileController>();
  UpdateProfileApi updateProfileApi = UpdateProfileApi();

  final GlobalKey<FormState> updateProfileFormKey =
      GlobalKey<FormState>(debugLabel: '__updateProfileFormKey__');

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final aboutController = TextEditingController();

  var allAvatars = <Avatar>[];

  var profilePicUrl = "".obs;
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
      await getAllAvatars();
      profilePicUrl.value = response.user?.profilePic ?? "";
      firstNameController.text = response.user?.firstname ?? "";
      lastNameController.text = response.user?.lastname ?? "";
      aboutController.text = response.user?.about ?? "";
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }

  Future<void> getAllAvatars() async {
    var response = await updateProfileApi.getAllAvatars();
    if (response.code == 200) {
      allAvatars.clear();
      allAvatars.addAll(response.avatars ?? List.empty());
      isLoading.value = false;
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }

  void updateUserProfile() async {
    isLoading.value = true;
    final userId = AppUtils.loginUserDetail().result?.id ?? "";
    UpdateProfilePostBodyModel updateProfilePostBodyModel =
        UpdateProfilePostBodyModel(
            firstname: firstNameController.text,
            lastname: lastNameController.text,
            about: aboutController.text,
            profilePic: profilePicUrl.value);
    var response = await updateProfileApi.updateProfile(
        updateProfilePostBodyModel: updateProfilePostBodyModel, userId: userId);
    if (response.code == 200) {
      profileController.getProfileScreenDetails();
      isLoading.value = false;
      AppUtils.showSnackBar(
          response.message ?? "New password created successfully. Please login",
          title: "Profile updated",
          status: MessageStatus.SUCCESS);
    } else {
      isLoading.value = false;
      AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    }
  }
}
