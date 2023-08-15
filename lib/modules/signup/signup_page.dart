import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors_theme.dart';
import 'signup_controller.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignupController signupController = Get.find<SignupController>();
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
          backgroundColor: Colors.transparent,
          centerTitle: false,
          elevation: 0,
        ),
        backgroundColor: ThemeColor.lighterPrimary,
        body: Obx(() => signupController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create an Account 👋",
                        style: TextStyle(
                            fontSize: 24,
                            color: ThemeColor.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 44,
                      ),
                      Form(
                          key: signupController.signupFormKey,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "First Name",
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
                                      signupController.firstNameController,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                      color: ThemeColor.black, fontSize: 14),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.person_outline,
                                      size: 18,
                                    ),
                                    contentPadding: EdgeInsets.all(12),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    hintText: "First Name",
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: ThemeColor.grey_500),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(10)),
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
                                  "Last Name",
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
                                      signupController.lastNameController,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                      color: ThemeColor.black, fontSize: 14),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.person_outline,
                                      size: 18,
                                    ),
                                    contentPadding: EdgeInsets.all(12),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    hintText: "Last Name",
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: ThemeColor.grey_500),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(10)),
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
                                  "Email Address",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: ThemeColor.textPrimary,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  controller: signupController.emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                      color: ThemeColor.black, fontSize: 14),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      size: 18,
                                    ),
                                    contentPadding: EdgeInsets.all(12),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: ThemeColor.grey_500),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(10)),
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
                                  "Mobile Number",
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
                                      signupController.phoneNumberController,
                                  keyboardType: TextInputType.phone,
                                  style: TextStyle(
                                      color: ThemeColor.black, fontSize: 14),
                                  maxLength: 10,
                                  decoration: InputDecoration(
                                    counterText: '',
                                    prefixIcon: Icon(
                                      Icons.phone_outlined,
                                      size: 18,
                                    ),
                                    contentPadding: EdgeInsets.all(12),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    hintText: "Phone Number",
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: ThemeColor.grey_500),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(10)),
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
                                      signupController.passwordController,
                                  keyboardType: TextInputType.text,
                                  obscureText:
                                      signupController.passwordInVisible.value,
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
                                          signupController
                                                  .passwordInVisible.value
                                              ? Icons.visibility_off
                                              : Icons
                                                  .visibility, //change icon based on boolean value
                                        ),
                                        onPressed: () {
                                          signupController
                                                  .passwordInVisible.value =
                                              !signupController
                                                  .passwordInVisible.value;
                                        }),
                                    contentPadding: EdgeInsets.all(12),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: ThemeColor.grey_500),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    filled: true,
                                    fillColor: ThemeColor.white,
                                  ),
                                  textInputAction: TextInputAction.next,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                ),
                              ])),
                      SizedBox(
                        height: 44,
                      ),
                      SizedBox(
                          width: double.infinity,
                          height: 44,
                          child: ElevatedButton(
                            onPressed: () {
                              signupController.signUp();
                            },
                            child: Text("Register"),
                            style: TextButton.styleFrom(
                              textStyle: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              backgroundColor: ThemeColor.primaryDark,
                            ),
                          )),
                    ],
                  ),
                ),
              )));
  }
}
