// ignore_for_file: unused_import, prefer_const_constructors, unused_element

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
 const RegisterPage({Key? key}) : super(key: key);

@override
State<RegisterPage> createState() => _RegisterPageState();

}

class _RegisterPageState extends State<RegisterPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:
      
       Column (
        children: [

           Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),

        Container(
            margin: EdgeInsets.only(top: 50),
            child : Center(
            child: Icon(
              Icons.account_circle,
              size: 120,
              color: const Color.fromARGB(255, 153, 168, 181),
            ),
            ),
          ),
        ],
       )
    );
  }
}

  
