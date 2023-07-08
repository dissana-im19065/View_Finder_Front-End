// ignore_for_file: unused_import, prefer_const_constructors, unused_element, prefer_const_literals_to_create_immutables, deprecated_member_use, use_build_context_synchronously, unused_local_variable, prefer_const_declarations, avoid_print

import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Future<void> registerUser() async {
    final url = 'http://192.168.1.20:3000/api/users/';
    final headers = {'Content-Type': 'application/json'};

    final userData = {
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'password': passwordController.text,
    };

    final jsonData = json.encode(userData);

    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: jsonData);

      if (response.statusCode == 200) {
        // User registered successfully
        // final token = json.decode(response.body)['token'];
        // Store the token securely (e.g., shared preferences or secure storage)

        // Navigate to the login page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        // Error registering user
        print('User registration failed. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle the error
      print('Error registering user: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/1.jpg'),
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
                  margin: EdgeInsets.only(top: 20),
                  child: Center(
                    child: Icon(
                      Icons.account_circle,
                      size: 120,
                      color: const Color.fromARGB(255, 153, 168, 181),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 2),
                  child: Center(
                      child: RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 50),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'V',
                            style: TextStyle(
                                color: Color.fromARGB(255, 223, 223, 223))),
                        TextSpan(
                            text: 'iew',
                            style: TextStyle(
                                color: Color.fromARGB(255, 219, 219, 219))),
                        TextSpan(
                            text: ' F',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255))),
                        TextSpan(
                            text: 'inder',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255))),
                      ],
                    ),
                  )),
                ),
                Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
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
                            Offset(0, 50), // Offset in the x and y directions
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(top: 30),
                  child: Center(
                    child: SizedBox(
                      width: 300,
                      child: TextField(
                        controller: firstNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'firstName',
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
                            Offset(0, 50), // Offset in the x and y directions
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(top: 30),
                  child: Center(
                    child: SizedBox(
                      width: 300,
                      child: TextField(
                        controller: lastNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'lastName',
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
                            Offset(0, 50), // Offset in the x and y directions
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(top: 15),
                  child: Center(
                    child: SizedBox(
                      width: 300,
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
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
                            Offset(0, 50), // Offset in the x and y directions
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(top: 15),
                  child: Center(
                    child: SizedBox(
                      width: 300,
                      child: TextField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Mobile',
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
                  margin: EdgeInsets.only(top: 15),
                  child: Center(
                    child: SizedBox(
                      width: 300,
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Create Password',
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
                  margin: EdgeInsets.only(top: 15),
                  child: Center(
                    child: SizedBox(
                      width: 300,
                      child: TextField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Re Enter Password',
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 35),
                  child: Center(
                    child: SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 81, 81, 81),
                        ),
                        onPressed: registerUser,
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20,
                          ),
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
