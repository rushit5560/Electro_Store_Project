import 'package:electro_store/common/common_widgets.dart';
import 'package:electro_store/common/custom_appbar.dart';
import 'package:electro_store/controller/edit_profile_screen_controller/edit_profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'edit_profile_screen_widgets.dart';

class EditProfileScreen extends StatelessWidget {
  // const EditProfileScreen({Key? key}) : super(key: key);
  TextEditingController userNameFieldController = TextEditingController();
  TextEditingController emailIdFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  TextEditingController addressFieldController = TextEditingController();
  TextEditingController phoneNoFieldController = TextEditingController();

  EditProfileScreenController editProfileScreenController = Get.put(EditProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule('Edit Profile'),

      body: Stack(
        children: [
          ScreenBackground(),
          Obx(
            ()=> editProfileScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : EditProfileScreenModule(
              userNameFieldController: userNameFieldController,
                emailIdFieldController: emailIdFieldController,
              passwordFieldController: passwordFieldController,
              addressFieldController: addressFieldController,
              phoneNoFieldController: phoneNoFieldController,
              editProfileScreenController: editProfileScreenController,
            ),
          ),
        ],
      ),
    );
  }
}
