import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';
import 'app_images.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('${AppImages.ic_logo_img}', height: Get.height * 0.07);
  }
}

InputDecoration inputDecoration(index, hintText) {
  return InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.all(15),
      fillColor: Colors.white,
      filled: true,
      hintText: '$hintText',
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(35),
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(35),
        borderSide: BorderSide(color: Colors.white),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(35),
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(35),
        borderSide: BorderSide(color: Colors.white),
      ),
      prefixIcon: Icon(
        index == 0
            ? Icons.person
            : index ==1
            ? Icons.mail
            : Icons.lock,
        color: AppColors.kPinkColor,
        size: 22,
      )
  );
}

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      '${AppImages.ic_background2_img}',
      fit: BoxFit.cover,
      height: Get.height,
      width: Get.width,
    );
  }
}


class SocialButtons extends StatelessWidget {
  const SocialButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('${AppImages.ic_fb_img}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('${AppImages.ic_twitter_img}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('${AppImages.ic_google_img}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomCircularProgressIndicator extends StatelessWidget {
  // const CustomCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: Colors.transparent,
      child: Center(
        child: CircularProgressIndicator(
          color: AppColors.kPinkColor,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
