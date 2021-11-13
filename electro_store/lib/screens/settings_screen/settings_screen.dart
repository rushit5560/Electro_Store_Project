import 'package:electro_store/common/common_widgets.dart';
import 'package:electro_store/common/custom_appbar.dart';
import 'settings_screen_widgets.dart';
import 'package:flutter/material.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}
class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule('Settings'),

      body: Stack(
        children: [
          ScreenBackground(),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                NotificationModule(),
                const SizedBox(height: 15),
                SMSNotificationModule(),
                const SizedBox(height: 15),
                EmailNotification(),
                const SizedBox(height: 15),
                DarkMode(),
                const SizedBox(height: 15),
                NewSale(),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


