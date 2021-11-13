import 'package:electro_store/common/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUsScreenModule extends StatelessWidget {
  const ContactUsScreenModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [

            _mapModule(),
            const SizedBox(height: 10),
            FormModule(),
          ],
        ),
      ),
    );
  }

  Widget _mapModule() {
    return Container(
      height: Get.height * 0.33,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
      ),
    );
  }
}


class FormModule extends StatelessWidget {
  // const FormModule({Key? key}) : super(key: key);
  TextEditingController fullNameFieldController = TextEditingController();
  TextEditingController emailIdFieldController = TextEditingController();
  TextEditingController subjectFieldController = TextEditingController();
  TextEditingController commentFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
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
        _subjectFieldModule(),
        const SizedBox(height: 15),
        _commentFieldModule(),
        const SizedBox(height: 15),
        _submitButton(),
      ],
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
        ),
      ],
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () {
        print('Submit');
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