// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, file_names, unnecessary_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({
    Key? key,
  }) : super(key: key);
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0, left: 0),
      height: 48,
      width: 700,
      child: Center(
        child: TextField(
          style: TextStyle(
            color:
                const Color.fromARGB(255, 255, 255, 255), // Set the text color
          ),
          controller: _textController,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            fillColor: Colors.grey.shade700,
            prefixIconColor: Colors.white,
            filled: true,
            constraints: BoxConstraints.tightFor(width: 3550, height: 50),
            prefixIcon: Icon(
              Icons.search_outlined,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            hintStyle: TextStyle(color: Colors.grey),
            hintText: 'search here',
          ),
        ),
      ),
    );
  }
}
