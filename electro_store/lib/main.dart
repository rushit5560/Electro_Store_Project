import 'package:electro_store/screens/index_screen/index_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common/app_theme.dart';

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

      home: IndexScreen(),
    );
  }
}
