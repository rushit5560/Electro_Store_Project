import 'package:electro_store/common/common_widgets.dart';
import 'package:electro_store/common/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'all_order_screen_widgets.dart';

class AllOrderScreen extends StatelessWidget {
  const AllOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule('Order'),

      body: Stack(
        children: [
          ScreenBackground(),
          OrderListModule(),
        ],
      ),
    );
  }
}
