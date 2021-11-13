import 'dart:async';

import 'package:electro_store/screens/onboarding_screen/onboarding_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {

  void getOnBoardingValue() {
    Get.to(()=> OnBoardingScreen());
  }
  
  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 3), ()=> getOnBoardingValue());
  }
}