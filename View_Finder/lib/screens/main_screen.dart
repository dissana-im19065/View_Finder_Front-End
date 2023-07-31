// ignore_for_file: unused_import, prefer_const_constructors, avoid_unnecessary_containers, duplicate_ignore

// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:login/CameraRenting/showrentpost.dart';
import 'package:login/News_feed/home_screen.dart';
import 'package:login/News_feed/login_screen.dart';
import 'package:login/News_feed/profile_scree.dart';
import 'package:login/News_feed/reels_screen.dart';
import 'package:login/News_feed/search_screen.dart';
import 'package:login/News_feed/shop_screen.dart';
import 'package:login/News_feed/user_type.dart';
import 'package:login/market/marketMain.dart';

import '../calendar.dart';
import '../customer requests/customerRequest.dart';
import '../customer/customer_profile.dart';
import '../login_page.dart';
import '../market/mArket.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CusRequests(),
    Calendar(),
    MarkeTs(),
    RentPost(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    if (index == 5) {
      if (usertype == 'PHOTOGRAPHER') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
      } else if (usertype == 'CUSTOMER') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CusProfileScreen()),
        );
        // Perform some other action, such as displaying a message
      } else if (usertype == 'SERVICE PROVIDER') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
      }
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Color.fromRGBO(255, 255, 255, 1),
        buttonBackgroundColor: Colors.white,
        height: 50,
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Color.fromRGBO(22, 22, 20, 1)),
          Icon(Icons.search, size: 30, color: Colors.black),
          Icon(Icons.video_collection, size: 30, color: Colors.black),
          Icon(Icons.shopping_bag, size: 30, color: Colors.black),
          Icon(Icons.storage_sharp, size: 30, color: Colors.black),
          Icon(Icons.person, size: 30, color: Colors.black),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}



 // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Colors.transparent,
      //   color: Color.fromARGB(255, 255, 255, 255),
      //   buttonBackgroundColor: Colors.white,
      //   height: 50,
      //   items: const <Widget>[
      //     Icon(Icons.home, size: 30, color: Color.fromARGB(255, 0, 0, 0)),
      //     Icon(Icons.search, size: 30, color: Colors.black),
      //     Icon(Icons.video_collection, size: 30, color: Colors.black),
      //     Icon(Icons.shopping_bag, size: 30, color: Colors.black),
      //     Icon(Icons.person, size: 30, color: Colors.black),
      //   ],
      //   onTap: _onItemTapped,
      // ),