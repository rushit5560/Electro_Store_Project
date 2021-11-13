import 'package:electro_store/common/common_widgets.dart';
import 'package:electro_store/common/custom_appbar.dart';
import 'package:electro_store/controller/check_out_screen_controller/check_out_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'check_out_screen_widgets.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  CheckOutScreenController checkOutScreenController = Get.put(CheckOutScreenController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule('CheckOut'),
      body: Stack(
        children: [
          ScreenBackground(),
          CheckOutScreenModule(),
        ],
      ),
    );
  }
}

