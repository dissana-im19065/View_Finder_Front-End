// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:login/data/image_data.dart';
import 'package:login/screens/image_cart.dart';
import 'package:login/widgets/search%20bar.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: CustomText(),
        actions: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.shopping_cart,
                  size: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.table_rows_rounded,
                  size: 30,
                ),
              ),
            ],
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(top: 10.0),
        child: GridView.builder(
          itemCount: imageList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
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
