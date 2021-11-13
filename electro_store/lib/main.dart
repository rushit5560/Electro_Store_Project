import 'package:electro_store/screens/category_screen/category_screen.dart';
import 'package:electro_store/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common/app_theme.dart';
import 'screens/cart_screen/cart_screen.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Electro Store',
      debugShowCheckedModeBanner: false,
      theme: appLightTheme(),

      home: CategoryScreen(),
    );
  }
}
