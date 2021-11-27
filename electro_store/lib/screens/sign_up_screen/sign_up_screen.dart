import 'package:electro_store/common/app_colors.dart';
import 'package:electro_store/common/common_widgets.dart';
import 'package:electro_store/controller/sign_up_screen_controller/sign_up_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sign_up_screen_widgets.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController userNameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();

  SignUpScreenController signUpScreenController =
  Get.put(SignUpScreenController());
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kGreyColor,
      body: Obx(()=>
         signUpScreenController.isLoading.value ?
        Container(
          width: Get.width,
          height: Get.height,
          color: Colors.transparent,
          child: Center(
            child: CircularProgressIndicator(
              color: AppColors.kTealColor,
              backgroundColor: Colors.white,
            ),
          ),
        ) :
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Logo(),
                const SizedBox(height: 40),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      UserNameField(userNameFieldController: userNameFieldController),
                      const SizedBox(height: 15),
                      EmailField(emailFieldController: emailFieldController),
                      const SizedBox(height: 15),
                      PasswordField(passwordFieldController: passwordFieldController),
                      const SizedBox(height: 25),
                      SignUpButton(
                        emailFieldController: emailFieldController,
                        passwordFieldController: passwordFieldController,
                        userNameFieldController: userNameFieldController,
                        signUpScreenController: signUpScreenController,
                        formkey: formkey,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),
                SignInText(),
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
