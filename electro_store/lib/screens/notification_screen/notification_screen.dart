import 'package:electro_store/common/common_widgets.dart';
import 'package:electro_store/common/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'notification_screen_widgets.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule('Notification'),
      body: Stack(
        children: [
          ScreenBackground(),
          NotificationListModule(),
        ],
      ),
    );
  }
}
