import 'package:electro_store/common/app_colors.dart';
import 'package:electro_store/common/common_widgets.dart';
import 'package:flutter/material.dart';

import 'sign_up_screen_widgets.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController userNameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kGreyColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(),
              const SizedBox(height: 40),
              UserNameField(userNameFieldController: userNameFieldController),
              const SizedBox(height: 15),
              EmailField(emailFieldController: emailFieldController),
              const SizedBox(height: 15),
              PasswordField(passwordFieldController: passwordFieldController),
              const SizedBox(height: 25),
              SignUpButton(),
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
    );
  }
}
