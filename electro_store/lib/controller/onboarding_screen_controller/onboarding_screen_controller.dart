import 'package:electro_store/common/app_images.dart';
import 'package:electro_store/models/onboarding_screen_model/onboarding_model.dart';
import 'package:electro_store/screens/index_screen/index_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

String msg = 'Explore Products Explore Products Explore Products Explore Products Explore Products Explore Products Explore Products';

class OnBoardingScreenController extends GetxController {

  var selectedPageIndex = 0.obs;
  var pageController = PageController();
  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length - 1;
  

  List<OnBoardingModel> onBoardingPages = [
    OnBoardingModel(
      img: '${AppImages.ic_service1_img}',
      title: 'Explore Products',
      message: '$msg',
    ),
    OnBoardingModel(
      img: '${AppImages.ic_service2_img}',
      title: 'Select & Checkout',
      message: '$msg',
    ),
    OnBoardingModel(
      img: '${AppImages.ic_service3_img}',
      title: 'Safe Payment',
      message: '$msg',
    ),
  ];

  forwardAction() {
    if(isLastPage){
      setOnBoardingValue();
      Get.off(() => IndexScreen());
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  setOnBoardingValue() async {
    print('Call Set Value Method');
    SharedPreferences  prefs = await SharedPreferences.getInstance();
    prefs.setBool("onboarding", true);
    print('Set Value : ${prefs.getBool("onboarding")}');
  }
}