import 'package:electro_store/common/app_colors.dart';
import 'package:electro_store/common/app_images.dart';
import 'package:electro_store/controller/onboarding_screen_controller/onboarding_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  // const OnBoardingScreen({Key? key}) : super(key: key);
  OnBoardingScreenController onBoardingScreenController = Get.put(OnBoardingScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              '${AppImages.ic_background_img}',
              fit: BoxFit.cover,
              height: Get.height,
            ),
            PageView.builder(
              controller: onBoardingScreenController.pageController,
              onPageChanged: onBoardingScreenController.selectedPageIndex,
              itemCount: onBoardingScreenController.onBoardingPages.length,
              itemBuilder: (context ,index){
                return pageViewBuilderTile(index);
              },
            ),
            _indicator(),
            _forwardButton(),
          ],
        ),
      ),
    );
  }

  Widget pageViewBuilderTile(int index) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            '${onBoardingScreenController.onBoardingPages[index].img}',
            height: Get.height * 0.35,
          ),
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.only(bottom: 120),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      '${onBoardingScreenController.onBoardingPages[index].title}',
                      textScaleFactor: 1.9,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      '${onBoardingScreenController.onBoardingPages[index].message}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _indicator() {
    return Positioned(
      bottom: 25,
      left: 20,
      child: Row(
        children: List.generate(onBoardingScreenController.onBoardingPages.length,
              (index) => Obx(() => Container(
            margin: EdgeInsets.all(4),
            width: 12,
            height: 12,
            decoration: BoxDecoration(
                color: onBoardingScreenController.selectedPageIndex.value == index ? Colors.black : Colors.white,
                shape: BoxShape.circle
            ),
          ),
          ),
        ),
      ),
    );
  }

  Widget _forwardButton() {
    return Positioned(
      right: 20,
      bottom: 25,
      child: GestureDetector(
        onTap: () => onBoardingScreenController.forwardAction(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.arrow_forward_rounded, color: AppColors.kPinkColor),
          ),
        ),
      ),
    );
  }
}
