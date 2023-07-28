// ignore_for_file: unused_import, prefer_const_constructors, avoid_unnecessary_containers, duplicate_ignore

// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:login/News_feed/home_screen.dart';
import 'package:login/News_feed/profile_scree.dart';
import 'package:login/News_feed/reels_screen.dart';
import 'package:login/News_feed/search_screen.dart';
import 'package:login/News_feed/shop_screen.dart';
import 'package:login/market/marketMain.dart';

import '../CameraRenting/showrentpost.dart';
import '../calendar.dart';
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
    RentPost(),
    Calendar(),
    MarkeTs(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
        color: Color.fromARGB(255, 255, 255, 255),
        buttonBackgroundColor: Colors.white,
        height: 50,
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Color.fromARGB(255, 0, 0, 0)),
          Icon(Icons.search, size: 30, color: Colors.black),
          Icon(Icons.video_collection, size: 30, color: Colors.black),
          Icon(Icons.shopping_bag, size: 30, color: Colors.black),
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