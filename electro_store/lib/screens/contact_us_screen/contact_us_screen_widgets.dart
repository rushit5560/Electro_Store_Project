import 'dart:async';

import 'package:electro_store/common/app_colors.dart';
import 'package:electro_store/controller/contact_us_screen__controller/contact_us_screen__controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactUsScreenModule extends StatelessWidget {
  // const ContactUsScreenModule({Key? key}) : super(key: key);
  ContactUsScreenController contactUsScreenController = Get.put(ContactUsScreenController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [

            mapView(),
            const SizedBox(height: 10),
            FormModule(),
          ],
        ),
      ),
    );
  }

  Widget mapView() {
    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(21.1860, 72.7944),
      zoom: 7,
    );
    Completer<GoogleMapController> _controller = Completer();

    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: Get.height * 0.25,
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(15),
          ),
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            myLocationEnabled: true,
          ),
        ),
      ),
    );
  }
}


class FormModule extends StatelessWidget {
  // const FormModule({Key? key}) : super(key: key);
  ContactUsScreenController contactUsScreenController = Get.find();
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController fullNameFieldController = TextEditingController();
  TextEditingController emailIdFieldController = TextEditingController();
  TextEditingController subjectFieldController = TextEditingController();
  TextEditingController commentFieldController = TextEditingController();
  TextEditingController phoneNoFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Text(
            'Contact Us',
            textScaleFactor: 1.3,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),

          _fullNameFieldModule(),
          const SizedBox(height: 15),
          _emailIdFieldModule(),
          const SizedBox(height: 15),
          _phoneNoFieldModule(),
          const SizedBox(height: 15),
          _subjectFieldModule(),
          const SizedBox(height: 15),
          _commentFieldModule(),
          const SizedBox(height: 15),
          _submitButton(),
        ],
      ),
    );
  }

  Widget _fullNameFieldModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Full Name',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextFormField(
          keyboardType: TextInputType.text,
          controller: fullNameFieldController,
          decoration: inputDecoration(1),
          validator: (value) {
            if(value!.isEmpty){
              return 'Full Name should not be empty';
            }
          },
        ),
      ],
    );
  }

  Widget _emailIdFieldModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email Id',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: emailIdFieldController,
          decoration: inputDecoration(1),
          validator: (value){
            if(value!.isEmpty){
              return 'Email should not be empty';
            }
            else if(!value.contains('@')){
              return 'Please Enter Valid Email';
            }
          },
        ),
      ],
    );
  }

  Widget _subjectFieldModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Subject',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextFormField(
          keyboardType: TextInputType.text,
          controller: subjectFieldController,
          decoration: inputDecoration(1),
          validator: (value){
            if(value!.isEmpty){
              return 'Subject should not be empty';
            }
          },
        ),
      ],
    );
  }

  Widget _commentFieldModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Comment',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextFormField(
          maxLines: 3,
          keyboardType: TextInputType.text,
          controller: commentFieldController,
          decoration: inputDecoration(0),
          validator: (value){
            if(value!.isEmpty){
              return 'Comment should not be empty';
            }
          },
        ),
      ],
    );
  }

  Widget _phoneNoFieldModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone No',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextFormField(
          keyboardType: TextInputType.number,
          controller: phoneNoFieldController,
          maxLength: 10,
          decoration: inputDecoration(1),
          validator: (value){
            if(value!.isEmpty){
              return 'Phone Number should not be empty';
            } else if(value.length != 10){
              return 'Phone Number must be in 10 Digit';
            }
          },
        ),
      ],
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () {
        if(formKey.currentState!.validate()){
          contactUsScreenController.getContactUsData(
            "${fullNameFieldController.text.trim()}",
            "${emailIdFieldController.text.trim().toLowerCase()}",
            "${phoneNoFieldController.text.trim()}",
            "${subjectFieldController.text.trim()}",
            "${commentFieldController.text.trim()}",
          );
        }
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: AppColors.kPinkColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Submit',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

}


InputDecoration inputDecoration(int index) {
  return InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
    counterText: '',
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(index == 0 ? 10 :35),
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(index == 0 ? 10 :35),
      borderSide: BorderSide(color: Colors.grey),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(index == 0 ? 10 :35),
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(index == 0 ? 10 :35),
      borderSide: BorderSide(color: Colors.grey),
    ),
  );
}