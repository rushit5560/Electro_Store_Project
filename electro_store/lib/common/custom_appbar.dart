import 'package:flutter/material.dart';
import 'app_images.dart';

PreferredSizeWidget commonAppBarModule(String title, [int index = 0]) {
  return AppBar(
    title: index == 0 ? Text('$title') : null,
    leading: index == 1
        ? Padding(
      padding: EdgeInsets.only(left: 2),
      child: Image.asset(AppImages.ic_logo_img),
    )
        : null,
  );
}