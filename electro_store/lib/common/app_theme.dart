import 'package:electro_store/common/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData appLightTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.kPinkColor,
      elevation: 0,
    ),
  );
}