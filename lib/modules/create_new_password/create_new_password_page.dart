import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors_theme.dart';
import 'create_new_password_controller.dart';

class CreateNewPasswordPage extends StatelessWidget {
  const CreateNewPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateNewPasswordController createNewPasswordController =
        Get.find<CreateNewPasswordController>();
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
            "Create New Password",
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
        body: Obx(() => createNewPasswordController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Please enter the verification code that we just sent you at (+91-${createNewPasswordController.phoneNumber})",
                            style: TextStyle(
                                fontSize: 14, color: ThemeColor.textPrimary),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Text(
                            "Verification Code",
                            style: TextStyle(
                                fontSize: 14,
                                color: ThemeColor.textPrimary,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: createNewPasswordController
                                .verficationCodeController,
                            keyboardType: TextInputType.phone,
                            style: TextStyle(
                                color: ThemeColor.black, fontSize: 14),
                            maxLength: 6,
                            decoration: InputDecoration(
                              counterText: '',
                              prefixIcon: Icon(
                                Icons.numbers_rounded,
                                size: 18,
                              ),
                              contentPadding: EdgeInsets.all(12),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintText: "6 digits verification code",
                              hintStyle: TextStyle(
                                  fontSize: 14, color: ThemeColor.grey_500),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor: ThemeColor.white,
                            ),
                            textInputAction: TextInputAction.next,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          SizedBox(
                            height: 16,
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
                            controller:
                                createNewPasswordController.passwordController,
                            keyboardType: TextInputType.text,
                            obscureText: createNewPasswordController
                                .passwordInVisible.value,
                            style: TextStyle(
                                color: ThemeColor.black, fontSize: 14),
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outlined,
                                size: 18,
                              ),
                              suffixIcon: IconButton(
                                  icon: Icon(
                                    createNewPasswordController
                                            .passwordInVisible.value
                                        ? Icons.visibility_off
                                        : Icons
                                            .visibility, //change icon based on boolean value
                                  ),
                                  onPressed: () {
                                    createNewPasswordController
                                            .passwordInVisible.value =
                                        !createNewPasswordController
                                            .passwordInVisible.value;
                                  }),
                              contentPadding: EdgeInsets.all(12),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  fontSize: 14, color: ThemeColor.grey_500),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor: ThemeColor.white,
                            ),
                            textInputAction: TextInputAction.next,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                            controller: createNewPasswordController
                                .confirmPasswordController,
                            keyboardType: TextInputType.text,
                            obscureText: createNewPasswordController
                                .confirmPasswordInVisible.value,
                            style: TextStyle(
                                color: ThemeColor.black, fontSize: 14),
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outlined,
                                size: 18,
                              ),
                              suffixIcon: IconButton(
                                  icon: Icon(
                                    createNewPasswordController
                                            .confirmPasswordInVisible.value
                                        ? Icons.visibility_off
                                        : Icons
                                            .visibility, //change icon based on boolean value
                                  ),
                                  onPressed: () {
                                    createNewPasswordController
                                            .confirmPasswordInVisible.value =
                                        !createNewPasswordController
                                            .confirmPasswordInVisible.value;
                                  }),
                              contentPadding: EdgeInsets.all(12),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintText: "Confirm Password",
                              hintStyle: TextStyle(
                                  fontSize: 14, color: ThemeColor.grey_500),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor: ThemeColor.white,
                            ),
                            textInputAction: TextInputAction.next,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          SizedBox(
                            height: 44,
                          ),
                          SizedBox(
                              width: double.infinity,
                              height: 44,
                              child: ElevatedButton(
                                onPressed: () {
                                  createNewPasswordController
                                      .createNewPassword();
                                },
                                child: Text("Reset Password"),
                                style: TextButton.styleFrom(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  backgroundColor: ThemeColor.primaryDark,
                                ),
                              )),
                        ])),
              )));
  }
}
