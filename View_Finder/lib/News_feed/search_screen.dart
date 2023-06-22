// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:login/data/image_data.dart';
import 'package:login/screens/image_cart.dart';
import 'package:login/widgets/search%20bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          title: CustomText()),
      body: Container(
        margin: EdgeInsets.only(top: 9.0),
        child: GridView.builder(
          itemCount: imageList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
          ),
          itemBuilder: (context, index) => ImageCart(
            imageData: imageList[index],
          ),
        ),
      ),
    );
  }
}
