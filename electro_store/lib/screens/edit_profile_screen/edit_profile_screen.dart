import 'package:electro_store/common/common_widgets.dart';
import 'package:electro_store/common/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'edit_profile_screen_widgets.dart';

class EditProfileScreen extends StatelessWidget {
  // const EditProfileScreen({Key? key}) : super(key: key);
  TextEditingController userNameFieldController = TextEditingController();
  TextEditingController emailIdFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  TextEditingController addressFieldController = TextEditingController();
  TextEditingController phoneNoFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule('Profile'),

      body: Stack(
        children: [
          ScreenBackground(),
          EditProfileScreenModule(
            userNameFieldController: userNameFieldController,
              emailIdFieldController: emailIdFieldController,
            passwordFieldController: passwordFieldController,
            addressFieldController: addressFieldController,
            phoneNoFieldController: phoneNoFieldController,
          ),
        ],
      ),
    );
  }
}
