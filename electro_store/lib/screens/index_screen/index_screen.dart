import 'package:electro_store/common/app_colors.dart';
import 'package:electro_store/screens/cart_screen/cart_screen.dart';
import 'package:electro_store/screens/home_screen/home_screen.dart';
import 'package:electro_store/screens/notification_screen/notification_screen.dart';
import 'package:electro_store/screens/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int _currentIndex = 2;

  final tabs = [
    ProfileScreen(),
    NotificationScreen(),
    HomeScreen(),
    NotificationScreen(),
    CartScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        iconSize: 20,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print(_currentIndex);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: '',
            backgroundColor: AppColors.kPinkColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_rounded),
            label: '',
            backgroundColor: AppColors.kPinkColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: '',
            backgroundColor: AppColors.kPinkColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outlined),
            label: '',
            backgroundColor: AppColors.kPinkColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: '',
            backgroundColor: AppColors.kPinkColor,
          ),

        ],
      ),
    );
  }
}
