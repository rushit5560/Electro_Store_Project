import 'package:electro_store/common/app_colors.dart';
import 'package:electro_store/common/app_images.dart';
import 'package:electro_store/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreenModule extends StatelessWidget {
  const ProfileScreenModule({Key? key}) : super(key: key);

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
          const SizedBox(height: 15),
          _fullNameModule(),
          Divider(thickness: 1),
          _emailModule(),
          Divider(thickness: 1),
          _password(),
          Divider(thickness: 1),
          _address(),
          Divider(thickness: 1),
          _phoneNo(),
          Divider(thickness: 1),
          const SizedBox(height: 15),
          _editProfileButton(),
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

  Widget _fullNameModule() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Full Name',
              textScaleFactor: 1.1,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text('Jenny Doe', textScaleFactor: 1.1, maxLines: 1),
          ),
        ],
      ),
    );
  }

  Widget _emailModule() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Email Id',
              textScaleFactor: 1.1,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text('jenny123@gmail.com', textScaleFactor: 1.1, maxLines: 1),
          ),
        ],
      ),
    );
  }

  Widget _password() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Password',
              textScaleFactor: 1.1,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('********', textScaleFactor: 1.1, maxLines: 1),
                Icon(Icons.visibility_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _address() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              'Address',
              textScaleFactor: 1.1,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text('7000, WhiteField, Manchester High, London, 401203', textScaleFactor: 1.1, maxLines: 2),
          ),
        ],
      ),
    );
  }

  Widget _phoneNo() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              'Phone No.',
              textScaleFactor: 1.1,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text('+91 1234567890', textScaleFactor: 1.1, maxLines: 1),
          ),
        ],
      ),
    );
  }

  Widget _editProfileButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: GestureDetector(
        onTap: () {
          Get.to(()=> EditProfileScreen());
        },
        child: Container(
          width: Get.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.kPinkColor,
            borderRadius: BorderRadius.circular(35),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(
              'Edit Profile',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

}
