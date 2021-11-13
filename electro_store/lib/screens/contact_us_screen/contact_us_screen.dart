import 'package:electro_store/common/common_widgets.dart';
import 'package:electro_store/common/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'contact_us_screen_widgets.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: commonAppBarModule('Contact Us'),

      body: Stack(
        children: [
          ScreenBackground(),
          ContactUsScreenModule(),
        ],
      ),
    );
  }
}
