import 'package:electro_store/common/app_colors.dart';
import 'package:electro_store/common/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreenModule extends StatelessWidget {
  TextEditingController userNameFieldController;
  TextEditingController emailIdFieldController;
  TextEditingController passwordFieldController;
  TextEditingController addressFieldController;
  TextEditingController phoneNoFieldController;

  EditProfileScreenModule({
    required this.userNameFieldController,
    required this.emailIdFieldController,
    required this.passwordFieldController,
    required this.addressFieldController,
    required this.phoneNoFieldController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          const SizedBox(height: 15),
          _profileImageModule(),
          const SizedBox(height: 5),
          _userNameModule(),
          const SizedBox(height: 30),
          _userNameTextField(),
          const SizedBox(height: 15),
          _emailIdTextField(),
          const SizedBox(height: 15),
          _passwordTextField(),
          const SizedBox(height: 15),
          _addressTextField(),
          const SizedBox(height: 15),
          _phoneNoTextField(),
          const SizedBox(height: 30),
          _updateButton(),
        ],
      ),
    );
  }


  Widget _profileImageModule() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: Get.width * 0.25,
          width: Get.width * 0.25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('${AppImages.ic_profile_img}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: -5,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.camera_alt_rounded,
                color: AppColors.kPinkColor,
                size: 18,
              ),
            ),
          ),
        ),

      ],
    );
  }

  Widget _userNameModule() {
    return Text(
      'Jenny Doe',
      textScaleFactor: 1.3,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _userNameTextField() {
    return TextFormField(
      maxLines: 1,
      controller: userNameFieldController,
      keyboardType: TextInputType.text,
      decoration: inputDecoration('User Name'),
    );
  }

  Widget _emailIdTextField() {
    return TextFormField(
      maxLines: 1,
      controller: emailIdFieldController,
      keyboardType: TextInputType.emailAddress,
      decoration: inputDecoration('Email Id'),
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      maxLines: 1,
      controller: passwordFieldController,
      keyboardType: TextInputType.text,
      decoration: inputDecoration('Password'),
    );
  }

  Widget _addressTextField() {
    return TextFormField(
      maxLines: 1,
      controller: addressFieldController,
      keyboardType: TextInputType.text,
      decoration: inputDecoration('Address'),
    );
  }

  Widget _phoneNoTextField() {
    return TextFormField(
      maxLines: 1,
      controller: phoneNoFieldController,
      keyboardType: TextInputType.phone,
      decoration: inputDecoration('Phone No.'),
    );
  }

  Widget _updateButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          width: Get.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: AppColors.kPinkColor,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

}

InputDecoration inputDecoration(String hintText) {
  return InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
    hintText: '$hintText',
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(35),
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(35),
      borderSide: BorderSide(color: Colors.grey),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(35),
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(35),
      borderSide: BorderSide(color: Colors.grey),
    ),
  );
}