import 'package:electro_store/common/common_widgets.dart';
import 'package:electro_store/common/custom_appbar.dart';
import 'package:electro_store/controller/category_screen_controller/category_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'category_screen_widgets.dart';

class CategoryScreen extends StatelessWidget {
  // const CategoryScreen({Key? key}) : super(key: key);
  CategoryScreenController categoryScreenController = Get.put(CategoryScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule('Category'),

      body: Stack(
        children: [
          ScreenBackground(),
          CategoryListModule(),
        ],
      ),
    );
  }
}