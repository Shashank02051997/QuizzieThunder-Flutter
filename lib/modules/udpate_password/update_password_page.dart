import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors_theme.dart';
import 'update_password_controller.dart';

class UpdatePasswordPage extends StatelessWidget {
  const UpdatePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UpdatePasswordController updatePasswordController =
        Get.find<UpdatePasswordController>();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: ThemeColor.black,
              )),
          title: Text(
            "New Password",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ThemeColor.black),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: false,
          elevation: 0,
        ),
        backgroundColor: ThemeColor.lighterPrimary,
        body: Obx(() => updatePasswordController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Your new password must be different from the previous used passwords",
                        style: TextStyle(
                            fontSize: 14, color: ThemeColor.textPrimary),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 14,
                            color: ThemeColor.textPrimary,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: updatePasswordController.passwordController,
                        keyboardType: TextInputType.text,
                        obscureText:
                            updatePasswordController.passwordInVisible.value,
                        style: TextStyle(color: ThemeColor.black, fontSize: 14),
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outlined,
                            size: 18,
                          ),
                          suffixIcon: IconButton(
                              icon: Icon(
                                updatePasswordController.passwordInVisible.value
                                    ? Icons.visibility_off
                                    : Icons
                                        .visibility, //change icon based on boolean value
                              ),
                              onPressed: () {
                                updatePasswordController
                                        .passwordInVisible.value =
                                    !updatePasswordController
                                        .passwordInVisible.value;
                              }),
                          contentPadding: EdgeInsets.all(12),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          hintText: "Password",
                          hintStyle: TextStyle(
                              fontSize: 14, color: ThemeColor.grey_500),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: ThemeColor.white,
                        ),
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Confirm Password",
                        style: TextStyle(
                            fontSize: 14,
                            color: ThemeColor.textPrimary,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller:
                            updatePasswordController.confirmPasswordController,
                        keyboardType: TextInputType.text,
                        obscureText: updatePasswordController
                            .confirmPasswordInVisible.value,
                        style: TextStyle(color: ThemeColor.black, fontSize: 14),
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outlined,
                            size: 18,
                          ),
                          suffixIcon: IconButton(
                              icon: Icon(
                                updatePasswordController
                                        .confirmPasswordInVisible.value
                                    ? Icons.visibility_off
                                    : Icons
                                        .visibility, //change icon based on boolean value
                              ),
                              onPressed: () {
                                updatePasswordController
                                        .confirmPasswordInVisible.value =
                                    !updatePasswordController
                                        .confirmPasswordInVisible.value;
                              }),
                          contentPadding: EdgeInsets.all(12),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(
                              fontSize: 14, color: ThemeColor.grey_500),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: ThemeColor.white,
                        ),
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      SizedBox(
                        height: 44,
                      ),
                      SizedBox(
                          width: double.infinity,
                          height: 44,
                          child: ElevatedButton(
                            onPressed: () {
                              updatePasswordController.updatePassword();
                            },
                            child: Text("Update Password"),
                            style: TextButton.styleFrom(
                              textStyle: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              backgroundColor: ThemeColor.primaryDark,
                            ),
                          )),
                    ]))));
  }
}
