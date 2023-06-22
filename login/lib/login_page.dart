// ignore_for_file: unused_import, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

@override
State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/2.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(1.0),
            BlendMode.dstATop
          ),
        ),
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column (
          children: [
    
          Container(
              margin: EdgeInsets.only(top: 40),
              child : Center(
              child: Icon(
                Icons.account_circle,
                size: 120,
                color: const Color.fromARGB(255, 153, 168, 181),
              ),
              ),
            ),
    
    
            Container(

              decoration: BoxDecoration(
              boxShadow: [
               BoxShadow(
                color: Color.fromARGB(255, 248, 250, 249).withOpacity(0.5), // Shadow color
                 spreadRadius: 03, // Spread radius
                 blurRadius: 105, // Blur radius
                offset: Offset(0, 5), // Offset in the x and y directions
      ),
    ],
  ),


              margin: EdgeInsets.only(top: 35),
              child: Center(
                child: RichText(
                  text: TextSpan(
                  style: TextStyle(fontSize: 50),
                  children: <TextSpan>[
                    TextSpan(text: 'View', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                    TextSpan(text: ' Fin', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                    TextSpan(text: 'der', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                ],
             ),
          )
              ),
            ),

            Container(

              decoration: BoxDecoration(
              boxShadow: [
               BoxShadow(
                color: Color.fromARGB(255, 248, 250, 249).withOpacity(0.5), // Shadow color
                 spreadRadius: 12, // Spread radius
                 blurRadius: 105, // Blur radius
                offset: Offset(0, 50), // Offset in the x and y directions
      ),
    ],
  ),
              margin: EdgeInsets.only(top: 50),
              child: Center(
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                  ),
                ),
              ),
            ),
            Container(

              decoration: BoxDecoration(
              boxShadow: [
               BoxShadow(
                color: Color.fromARGB(255, 248, 250, 249).withOpacity(0.5), // Shadow color
                 spreadRadius: 12, // Spread radius
                 blurRadius: 105, // Blur radius
                offset: Offset(0, 70), // Offset in the x and y directions
      ),
    ],
  ),


              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 190, 190, 190),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Color.fromARGB(255, 29, 29, 29),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 140),
              child: Center(
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 15,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 15,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}