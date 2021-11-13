import 'package:electro_store/common/common_widgets.dart';
import 'package:electro_store/common/custom_appbar.dart';
import 'profile_screen_widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule('Profile'),
      body: Stack(
        children: [
          ScreenBackground(),
          ProfileScreenModule(),
        ],
      ),
    );
  }
}
