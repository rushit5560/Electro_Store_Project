import 'package:electro_store/common/custom_appbar.dart';
import 'package:electro_store/common/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: commonAppBarModule('Home',1),
      endDrawer: CustomDrawer(),
    );
  }
}
