import 'package:electro_store/common/app_images.dart';
import 'package:electro_store/controller/splash_screen_controller/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  // const SplashScreen({Key? key}) : super(key: key);
  SplashScreenController splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('${AppImages.ic_splash_img}'),
            fit: BoxFit.cover
          ),
        ),
      ),
    );
  }
}
