import 'package:electro_store/common/app_colors.dart';
import 'package:electro_store/common/common_widgets.dart';
import 'package:electro_store/controller/sign_in_screen_controller/sign_in_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sign_in_screen_widgets.dart';

class SignInScreen extends StatelessWidget {
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();

  SignInScreenController signInScreenController = Get.put(SignInScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kGreyColor,
      body: Obx(()=>
      signInScreenController.isLoading.value
            ? Container(
          width: Get.width,
          height: Get.height,
          color: Colors.transparent,
          child: Center(
            child: CircularProgressIndicator(
              color: AppColors.kTealColor,
              backgroundColor: Colors.white,
            ),
          ),
        ):

        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Logo(),
                const SizedBox(height: 40),
                EmailField(emailFieldController: emailFieldController),
                const SizedBox(height: 15),
                PasswordField(passwordFieldController: passwordFieldController),
                const SizedBox(height: 25),
                ForgotPasswordText(),
                const SizedBox(height: 25),
                LoginButton(
                   signInScreenController: signInScreenController,
                  emailFieldController: emailFieldController,
                  passwordFieldController: passwordFieldController,
                ),
                const SizedBox(height: 25),
                SignUpText(),
                const SizedBox(height: 25),
                Or(),
                const SizedBox(height: 25),
                SocialButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
