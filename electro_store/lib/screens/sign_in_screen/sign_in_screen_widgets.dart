import 'package:electro_store/common/app_colors.dart';
import 'package:electro_store/common/common_widgets.dart';
import 'package:electro_store/controller/sign_in_screen_controller/sign_in_screen_controller.dart';
import 'package:electro_store/screens/sign_in_screen/sign_in_screen.dart';
import 'package:electro_store/screens/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailField extends StatelessWidget {
  TextEditingController emailFieldController;
  EmailField({required this.emailFieldController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailFieldController,
      decoration: inputDecoration(1, 'Email'),
    );
  }
}

class PasswordField extends StatelessWidget {
  TextEditingController passwordFieldController;
  PasswordField({required this.passwordFieldController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordFieldController,
      decoration: inputDecoration(2, 'Password'),
    );
  }
}

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Forgot Password');
      },
      child: Text(
        'Forgot Password?',
        textScaleFactor: 1.1,
        style: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  //const LoginButton({Key? key}) : super(key: key);
  SignInScreenController signInScreenController;
  TextEditingController emailFieldController;
  TextEditingController passwordFieldController;

  LoginButton({required this.signInScreenController,
    required this.emailFieldController, required this.passwordFieldController});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Login');
        signInScreenController.getSignInData(
          emailFieldController.text.trim().toLowerCase(),
          passwordFieldController.text.trim(),
        );
      },
      child: Container(
        width: Get.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.kPinkColor,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text(
            'Login',
            textScaleFactor: 1.1,
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpText extends StatelessWidget {
  const SignUpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Have Not Account? ',
          textScaleFactor: 1.1,
          style: TextStyle(color: Colors.white),
        ),
        GestureDetector(
          onTap: () {
            Get.to(()=> SignUpScreen());
            print('Sign Up');
          },
          child: Text(
            'Sign Up',
            textScaleFactor: 1.1,
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}

class Or extends StatelessWidget {
  const Or({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
              color: Colors.white,
              thickness: 1,
              indent: 30,
              endIndent: 15,
          ),
        ),
        Text(
          'OR',
          textScaleFactor: 1.1,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.white,
            thickness: 1,
            endIndent: 30,
            indent: 15,
          ),
        ),
      ],
    );
  }
}





