import 'package:electro_store/common/common_widgets.dart';
import 'package:electro_store/common/custom_appbar.dart';
import 'package:electro_store/controller/contact_us_screen__controller/contact_us_screen__controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'contact_us_screen_widgets.dart';

class ContactUsScreen extends StatelessWidget {
  // const ContactUsScreen({Key? key}) : super(key: key);
  ContactUsScreenController contactUsScreenController = Get.put(ContactUsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: commonAppBarModule('Contact Us'),

      body: Stack(
        children: [
          ScreenBackground(),
          Obx(()=> contactUsScreenController.isLoading.value
              ? CustomCircularProgressIndicator()
              : ContactUsScreenModule()),
        ],
      ),
    );
  }
}
