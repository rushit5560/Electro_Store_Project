import 'package:electro_store/common/common_widgets.dart';
import 'package:electro_store/common/custom_appbar.dart';
import 'package:electro_store/controller/collection_screen_controller/collection_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'collection_screen_widgets.dart';

class CollectionScreen extends StatelessWidget {
  // const CollectionScreen({Key? key}) : super(key: key);
  CollectionScreenController collectionScreenController = Get.put(CollectionScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule('Collection'),

      body: Stack(
        children: [
          ScreenBackground(),
          CollectionListModule(),
        ],
      ),
    );
  }
}
