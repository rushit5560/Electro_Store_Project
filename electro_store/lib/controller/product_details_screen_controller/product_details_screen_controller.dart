import 'dart:ui';

import 'package:electro_store/common/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreenController extends GetxController {

  RxInt activeIndex = 0.obs;
  List productImgList = [AppImages.ic_collection1_img,AppImages.ic_collection2_img,AppImages.ic_collection3_img];
  List<Color> colorList = [
    Colors.blue, Colors.red, Colors.lightGreenAccent, Colors.orangeAccent,
  ];
  RxInt activeColor = 0.obs;


}