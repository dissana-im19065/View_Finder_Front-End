// ignore_for_file: unused_import, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, deprecated_member_use, camel_case_types, prefer_typing_uninitialized_variables, prefer_final_fields, unused_field, unused_local_variable, avoid_print, use_build_context_synchronously, unnecessary_null_comparison, prefer_interpolation_to_compose_strings, prefer_const_declarations

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/screens/main_screen.dart';
import 'News_feed/user_type.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

int userId = 0;
String firstName = '';
String lastName = '';
String usertype = '';

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> sharedPreferences =
      SharedPreferences.getInstance();

  Future<void> loginUser() async {
    final url = 'http://192.168.105.206:3000/api/users/login';
    final headers = {'Content-Type': 'application/json'};
    final loginData = {
      'email': usernameController.text,
      'password': passwordController.text,
    };

    final jsonData = json.encode(loginData);

    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: jsonData);

      if (response.statusCode == 200) {
        // Login successful
        final responseData = json.decode(response.body);
        final token = responseData['token'];
        userId = responseData['result']['user_id'];
        firstName = responseData['result']['first_name'];
        lastName = responseData['result']['last_name'];
        usertype = responseData['result']['userType'];

        print('userid' + userId.toString());

        // Store the token securely using shared preferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwtToken', token);

        // Proceed to the next screen or perform necessary actions
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      } else {
        // Login failed
        Fluttertoast.showToast(
          msg: 'Login failed. Please check your credentials.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } catch (error) {
      print('Error logging in: $error');
      // Handle the error
      Fluttertoast.showToast(
        msg: 'Error logging in. Please try again later.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/15.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(1.0), BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 80),
                  child: Center(
                    child: Icon(
                      Icons.account_circle,
                      size: 100,
                      color: Color.fromARGB(255, 106, 107, 107),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 248, 250, 249)
                            .withOpacity(0.5), // Shadow color
                        spreadRadius: 03, // Spread radius
                        blurRadius: 105, // Blur radius
                        offset:
                            Offset(0, 5), // Offset in the x and y directions
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(top: 18),
                  child: Center(
                      child: RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 50),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'V',
                            style: TextStyle(
                                color: Color.fromARGB(255, 90, 90, 90))),
                        TextSpan(
                            text: 'iew',
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                        TextSpan(
                            text: ' F',
                            style: TextStyle(
                                color: Color.fromARGB(255, 84, 84, 84))),
                        TextSpan(
                            text: 'inder',
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                      ],
                    ),
                  )),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 248, 250, 249)
                            .withOpacity(0.5), // Shadow color
                        spreadRadius: 12, // Spread radius
                        blurRadius: 105, // Blur radius
                        offset:
                            Offset(0, 50), // Offset in the x and y directions
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(top: 120),
                  child: Center(
                    child: SizedBox(
                      width: 300,
                      child: TextField(
                        controller: usernameController,
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
                        color: Color.fromARGB(255, 248, 250, 249)
                            .withOpacity(0.5), // Shadow color
                        spreadRadius: 12, // Spread radius
                        blurRadius: 105, // Blur radius
                        offset:
                            Offset(0, 70), // Offset in the x and y directions
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(top: 20),
                  child: Center(
                    child: SizedBox(
                      width: 300,
                      child: TextField(
                        controller: passwordController,
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
                  margin: EdgeInsets.only(top: 60),
                  child: Center(
                    child: SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 236, 236, 236),
                        ),
                        onPressed: loginUser,
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
                  margin: EdgeInsets.only(top: 70),
                  child: Center(
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserTypeScreen()),
                        );
                      },
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
