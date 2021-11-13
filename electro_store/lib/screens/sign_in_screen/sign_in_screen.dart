import 'package:electro_store/common/app_colors.dart';
import 'package:electro_store/common/common_widgets.dart';
import 'package:flutter/material.dart';

import 'sign_in_screen_widgets.dart';

class SignInScreen extends StatelessWidget {
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
              EmailField(emailFieldController: emailFieldController),
              const SizedBox(height: 15),
              PasswordField(passwordFieldController: passwordFieldController),
              const SizedBox(height: 25),
              ForgotPasswordText(),
              const SizedBox(height: 25),
              LoginButton(),
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
    );
  }


}
