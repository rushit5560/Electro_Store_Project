import 'package:electro_store/common/common_widgets.dart';
import 'package:electro_store/common/custom_appbar.dart';
import 'package:electro_store/controller/cart_screen_controller/cart_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart_screen_widgets.dart';

class CartScreen extends StatelessWidget {
  // const CartScreen({Key? key}) : super(key: key);
  CartScreenController cartScreenController = Get.put(CartScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule('Cart'),

      body: Stack(
        children: [
          ScreenBackground(),
          Padding(
            padding: EdgeInsets.all(10),
            child: CartScreenModules(),
          ),
        ],
      ),
    );
  }
}
