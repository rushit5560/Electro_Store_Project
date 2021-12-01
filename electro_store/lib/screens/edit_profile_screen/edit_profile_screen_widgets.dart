import 'package:electro_store/common/app_colors.dart';
import 'package:electro_store/common/app_images.dart';
import 'package:electro_store/controller/edit_profile_screen_controller/edit_profile_screen_controller.dart';
import 'package:electro_store/models/edit_profile_screen_model/city_model.dart';
import 'package:electro_store/models/edit_profile_screen_model/country_model.dart';
import 'package:electro_store/models/edit_profile_screen_model/state_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreenModule extends StatelessWidget {
  TextEditingController userNameFieldController;
  TextEditingController emailIdFieldController;
  TextEditingController passwordFieldController;
  TextEditingController addressFieldController;
  TextEditingController phoneNoFieldController;
  EditProfileScreenController editProfileScreenController;

  EditProfileScreenModule({
    required this.userNameFieldController,
    required this.emailIdFieldController,
    required this.passwordFieldController,
    required this.addressFieldController,
    required this.phoneNoFieldController,
    required this.editProfileScreenController,
  });

  List<String> dropDownList = <String>['Select Gender', 'Male', 'Female'];

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
          const SizedBox(height: 30),
          _countryDropDown(),
          const SizedBox(height: 30),
          _stateDropDown(),
          const SizedBox(height: 30),
          _cityDropDown(),
          // const SizedBox(height: 15),
          // _emailIdTextField(),
          // const SizedBox(height: 15),
          // _passwordTextField(),
          // const SizedBox(height: 15),
          // _addressTextField(),
          // const SizedBox(height: 15),
          // _phoneNoTextField(),
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

  Widget _countryDropDown() {
    return Obx(
      () => Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton<Datum>(
          value: editProfileScreenController.countryDropDownValue,
          icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
          style: const TextStyle(color: Colors.grey),
          isExpanded: true,
          underline: Container(
            height: 1,
            color: Colors.white,
          ),
          onChanged: (newValue) {
            editProfileScreenController.countryDropDownValue!.name = newValue!.name;
            print("countryDropDownValue : ${editProfileScreenController.countryDropDownValue!.name}");
            print("countryDropDownValue ID : ${newValue.id}");
            editProfileScreenController.getStateData(newValue.id);
          },

          items: editProfileScreenController.countryLists
              .map<DropdownMenuItem<Datum>>((Datum value) {
            return DropdownMenuItem<Datum>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _stateDropDown() {
    return Obx(
          () => Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton<DatumState>(
          value: editProfileScreenController.stateDropDownValue,
          icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
          style: const TextStyle(color: Colors.grey),
          isExpanded: true,
          underline: Container(
            height: 1,
            color: Colors.white,
          ),
          onChanged: (newValue) {
            editProfileScreenController.stateDropDownValue!.name = newValue!.name;
            print("stateDropDownValue : ${editProfileScreenController.stateDropDownValue}");
            print('newValue.name : ${newValue.name}');
            editProfileScreenController.getCityData(newValue.id);
            editProfileScreenController.loading();
          },
          items: editProfileScreenController.stateLists
              .map<DropdownMenuItem<DatumState>>((DatumState value) {
            return DropdownMenuItem<DatumState>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _cityDropDown() {
    return Obx(
          () => Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton<DatumCity>(
          value: editProfileScreenController.cityDropDownValue,
          icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
          style: const TextStyle(color: Colors.grey),
          isExpanded: true,
          underline: Container(
            height: 1,
            color: Colors.white,
          ),
          onChanged: (newValue) {
            editProfileScreenController.cityDropDownValue!.name = newValue!.name;
            print("cityDropDownValue : ${editProfileScreenController.cityDropDownValue}");
            print('newValue.name : ${newValue.name}');
            editProfileScreenController.loading();
          },
          items: editProfileScreenController.cityLists
              .map<DropdownMenuItem<DatumCity>>((DatumCity value) {
            return DropdownMenuItem<DatumCity>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _updateButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {

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

// Widget _emailIdTextField() {
//   return TextFormField(
//     maxLines: 1,
//     controller: emailIdFieldController,
//     keyboardType: TextInputType.emailAddress,
//     decoration: inputDecoration('Email Id'),
//   );
// }
//
// Widget _passwordTextField() {
//   return TextFormField(
//     maxLines: 1,
//     controller: passwordFieldController,
//     keyboardType: TextInputType.text,
//     decoration: inputDecoration('Password'),
//   );
// }
//
// Widget _addressTextField() {
//   return TextFormField(
//     maxLines: 1,
//     controller: addressFieldController,
//     keyboardType: TextInputType.text,
//     decoration: inputDecoration('Address'),
//   );
// }
//
// Widget _phoneNoTextField() {
//   return TextFormField(
//     maxLines: 1,
//     controller: phoneNoFieldController,
//     keyboardType: TextInputType.phone,
//     decoration: inputDecoration('Phone No.'),
//   );
// }