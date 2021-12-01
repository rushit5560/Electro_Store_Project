import 'dart:async';

import 'package:electro_store/screens/index_screen/index_screen.dart';
import 'package:electro_store/screens/onboarding_screen/onboarding_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  bool? onBoardingValue = false;

  getOnBoardingValue() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    onBoardingValue = prefs.getBool("onboarding");
    print('Value : $onBoardingValue');

    if(onBoardingValue == true) {
      Get.off(()=> IndexScreen());
    } else {
      Get.off(()=> OnBoardingScreen());
    }
  }
  
  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 3), ()=> getOnBoardingValue());
  }
}