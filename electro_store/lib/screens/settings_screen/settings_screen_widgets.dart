import 'package:electro_store/common/app_colors.dart';
import 'package:electro_store/screens/change_password_screen/change_password_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationModule extends StatefulWidget {
  const NotificationModule({Key? key}) : super(key: key);

  @override
  _NotificationModuleState createState() => _NotificationModuleState();
}
class _NotificationModuleState extends State<NotificationModule> {

  bool _notificationValue = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(35),
      elevation: 10,
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Notification',
                textScaleFactor: 1.3,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                  value: _notificationValue,
                  onChanged: (value) {
                    setState(() {
                      _notificationValue = value;
                      print(_notificationValue);
                    });
                  },
                  trackColor: AppColors.kLightPinkColor,
                  activeColor: AppColors.kPinkColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class SMSNotificationModule extends StatefulWidget {
  const SMSNotificationModule({Key? key}) : super(key: key);

  @override
  _SMSNotificationModuleState createState() => _SMSNotificationModuleState();
}
class _SMSNotificationModuleState extends State<SMSNotificationModule> {
  bool _smsNotificationValue = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(35),
      elevation: 10,
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'SMS Notification',
                textScaleFactor: 1.3,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                  value: _smsNotificationValue,
                  onChanged: (value) {
                    setState(() {
                      _smsNotificationValue = value;
                      print(_smsNotificationValue);
                    });
                  },
                  trackColor: AppColors.kLightPinkColor,
                  activeColor: AppColors.kLightPinkColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailNotification extends StatefulWidget {
  const EmailNotification({Key? key}) : super(key: key);

  @override
  _EmailNotificationState createState() => _EmailNotificationState();
}
class _EmailNotificationState extends State<EmailNotification> {
  bool _emailNotificationValue = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(35),
      elevation: 10,
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Email Notification',
                textScaleFactor: 1.3,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                  value: _emailNotificationValue,
                  onChanged: (value) {
                    setState(() {
                      _emailNotificationValue = value;
                      print(_emailNotificationValue);
                    });
                  },
                  trackColor: AppColors.kLightPinkColor,
                  activeColor: AppColors.kLightPinkColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DarkMode extends StatefulWidget {
  const DarkMode({Key? key}) : super(key: key);

  @override
  _DarkModeState createState() => _DarkModeState();
}
class _DarkModeState extends State<DarkMode> {
  bool _darkModeValue = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(35),
      elevation: 10,
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dark Mode',
                textScaleFactor: 1.3,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                  value: _darkModeValue,
                  onChanged: (value) {
                    setState(() {
                      _darkModeValue = value;
                      print(_darkModeValue);
                    });
                  },
                  trackColor: AppColors.kLightPinkColor,
                  activeColor: AppColors.kLightPinkColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewSale extends StatefulWidget {
  const NewSale({Key? key}) : super(key: key);

  @override
  _NewSaleState createState() => _NewSaleState();
}
class _NewSaleState extends State<NewSale> {
  bool _newSaleValue = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(35),
      elevation: 10,
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'New Sale',
                textScaleFactor: 1.3,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                  value: _newSaleValue,
                  onChanged: (value) {
                    setState(() {
                      _newSaleValue = value;
                      print(_newSaleValue);
                    });
                  },
                  trackColor: AppColors.kLightPinkColor,
                  activeColor: AppColors.kLightPinkColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(()=> ChangePasswordScreen());
      },
      child: Material(
        borderRadius: BorderRadius.circular(35),
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Container(
            width: Get.width,
            child: Text(
              'Change Password',
              textScaleFactor: 1.3,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
