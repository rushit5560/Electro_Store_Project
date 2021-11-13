

import 'package:electro_store/common/app_colors.dart';
import 'package:electro_store/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserNameField extends StatelessWidget {
  TextEditingController userNameFieldController;
  UserNameField({required this.userNameFieldController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: userNameFieldController,
      decoration: inputDecoration(0, 'UserName'),
    );
  }
}

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



class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Login');
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
            'Sign Up',
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

class SignInText extends StatelessWidget {
  const SignInText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already Sign Up? ',
          textScaleFactor: 1.1,
          style: TextStyle(color: Colors.white),
        ),
        GestureDetector(
          onTap: () {
            print('Sign In');
          },
          child: Text(
            'Sign In',
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



