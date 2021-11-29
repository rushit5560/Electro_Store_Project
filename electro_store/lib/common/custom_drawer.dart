import 'package:electro_store/common/app_images.dart';
import 'package:electro_store/screens/all_order_screen/all_order_screen.dart';
import 'package:electro_store/screens/category_screen/category_screen.dart';
import 'package:electro_store/screens/collection_screen/collection_screen.dart';
import 'package:electro_store/screens/contact_us_screen/contact_us_screen.dart';
import 'package:electro_store/screens/notification_screen/notification_screen.dart';
import 'package:electro_store/screens/profile_screen/profile_screen.dart';
import 'package:electro_store/screens/settings_screen/settings_screen.dart';
import 'package:electro_store/screens/sign_in_screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CloseButton(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        ProfileAndNameModule(),
                        const SizedBox(height: 15),
                        HomeButton(),
                        ProfileButton(),
                        CategoryButton(),
                        OrderButton(),
                        CollectionButton(),
                        NotificationButton(),
                        SettingButton(),
                        ContactUsButton(),
                      ],
                    ),
                  ),
                ),
              ),
              // LogoutButton(),
              LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class CloseButton extends StatelessWidget {
  const CloseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.close_rounded,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class ProfileAndNameModule extends StatelessWidget {
  const ProfileAndNameModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: Get.width * 0.30,
            width: Get.width * 0.30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('${AppImages.ic_profile_img}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Jenny Doe',
            textScaleFactor: 1.3,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'jenny123@gmail.com',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.back();
      },
      leading: Icon(Icons.home_rounded, color: Colors.white),
      title: Text(
        'Home',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => ProfileScreen());
      },
      leading: Icon(Icons.person_rounded, color: Colors.white),
      title: Text(
        'Profile',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class CollectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => CollectionScreen());
      },
      leading: Icon(Icons.store_rounded, color: Colors.white),
      title: Text(
        'Collection',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class OrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => AllOrderScreen());
      },
      leading: Icon(Icons.store_rounded, color: Colors.white),
      title: Text(
        'Order',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => CategoryScreen());
      },
      leading: Icon(Icons.store_rounded, color: Colors.white),
      title: Text(
        'Category',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class NotificationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => NotificationScreen());
      },
      leading: Icon(Icons.notifications_rounded, color: Colors.white),
      title: Text(
        'Notification',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class SettingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => SettingsScreen());
      },
      leading: Icon(Icons.settings_rounded, color: Colors.white),
      title: Text(
        'Settings',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class ContactUsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => ContactUsScreen());
      },
      leading: Icon(Icons.perm_contact_calendar_rounded, color: Colors.white),
      title: Text(
        'Contact Us',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.back();
      },
      leading: Icon(Icons.logout_rounded, color: Colors.white),
      title: Text(
        'Logout',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(()=> SignInScreen());
      },
      leading: Icon(Icons.logout_rounded, color: Colors.white),
      title: Text(
        'LogIn',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}