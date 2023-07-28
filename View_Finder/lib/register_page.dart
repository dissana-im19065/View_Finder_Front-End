// ignore_for_file: unused_import, prefer_const_constructors, unused_element, prefer_const_literals_to_create_immutables, deprecated_member_use, use_build_context_synchronously, unused_local_variable, prefer_const_declarations, avoid_print, unused_field, duplicate_import

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  // RePasswordField({@required this.originalPassword);

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

  void saveTokenToSharedPreferences(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('jwt_token', token);
  }

  String phoneNumber = '';
  bool isPhoneNumberValid = false;
  bool isPhoneNumberUnique = true;

  String password = '';
  bool isPasswordValid = false;

  String rePassword = '';
  bool isRePasswordValid = false;

  Future<void> registerUser() async {
    final url = 'http://192.168.140.206:3000/api/users/';
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

                SizedBox(height: 16.0),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      value = value
                          .toLowerCase(); // Convert input value to lowercase
                      if (value.length < 2) {
                        return 'First name should be at least 2 characters long';
                      }
                      if (!RegExp(r'^[a-zA-ZÀ-ÿ ]+$').hasMatch(value)) {
                        return 'Please enter a valid first name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      if (firstNameController.text.isNotEmpty) {
                        _validateFirstName();
                      }
                    },
                  ),
                ),

                SizedBox(height: 16.0),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      value = value
                          .toLowerCase(); // Convert input value to lowercase
                      if (value.length < 2) {
                        return 'Last name should be at least 2 characters long';
                      }
                      if (!RegExp(r'^[a-zA-ZÀ-ÿ ]+$').hasMatch(value)) {
                        return 'Please enter a valid last name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      if (firstNameController.text.isNotEmpty) {
                        _validateLastName();
                      }
                    },
                  ),
                ),

                SizedBox(height: 16.0),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!EmailValidator.validate(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      if (emailController.text.isNotEmpty) {
                        _validateEmail();
                      }
                    },
                  ),
                ),

                SizedBox(height: 16.0),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          labelText: 'Mobile Number',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your mobile number';
                          }
                          phoneNumber = value.replaceAll(RegExp(r'[^0-9]'),
                              ''); // remove non-digit characters
                          if (phoneNumber.isEmpty) {
                            return 'Please enter a valid phone number';
                          }
                          if (!phoneNumber.startsWith('0')) {
                            return 'Phone number must start with 0';
                          }
                          if (phoneNumber.length != 10) {
                            return 'Phone number must have exactly 10 digits';
                          }
                          if (!RegExp(r'^[0-9]+$').hasMatch(phoneNumber)) {
                            return 'Phone number must contain only digits';
                          }
                          if (!isPhoneNumberUnique) {
                            return 'This phone number is already in use';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            isPhoneNumberValid = _isValidPhoneNumber(value);
                          });
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16.0),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          password = value;
                          if (password.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          if (!RegExp(r'[A-Z]').hasMatch(password)) {
                            return 'Password must contain at least one uppercase letter';
                          }
                          if (!RegExp(r'[a-z]').hasMatch(password)) {
                            return 'Password must contain at least one lowercase letter';
                          }
                          if (!RegExp(r'[0-9]').hasMatch(password)) {
                            return 'Password must contain at least one digit';
                          }
                          if (_isCommonPassword(password)) {
                            return 'Please choose a stronger password';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            isPasswordValid = _isValidPassword(value);
                          });
                        },
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'A strong password:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        '- Is at least 8 characters long',
                        style: TextStyle(
                          color: isPasswordValid ? Colors.green : Colors.red,
                        ),
                      ),
                      Text(
                        '- Contains at least one uppercase letter',
                        style: TextStyle(
                          color: isPasswordValid ? Colors.green : Colors.red,
                        ),
                      ),
                      Text(
                        '- Contains at least one lowercase letter',
                        style: TextStyle(
                          color: isPasswordValid ? Colors.green : Colors.red,
                        ),
                      ),
                      Text(
                        '- Contains at least one digit',
                        style: TextStyle(
                          color: isPasswordValid ? Colors.green : Colors.red,
                        ),
                      ),
                      Text(
                        '- Avoids common passwords',
                        style: TextStyle(
                          color: isPasswordValid ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),

// re enter password

                //             Container(
                //   padding: EdgeInsets.symmetric(horizontal: 16.0),
                //   child: Column(
                //     children: [
                //       TextFormField(
                //         controller: confirmPasswordController,
                //         decoration: InputDecoration(
                //           labelText: 'Re-enter Password',
                //           border: OutlineInputBorder(),
                //         ),
                //         obscureText: true,
                //         validator: (value) {
                //           if (value == null || value.isEmpty) {
                //             return 'Please re-enter your password';
                //           }
                //           rePassword = value;
                //           if (rePassword != widget.originalPassword ) {
                //             return 'Passwords do not match';
                //           }
                //           return null;
                //         },
                //         onChanged: (value) {
                //           setState(() {
                //             isRePasswordValid = _isMatchingPasswords(value);
                //           });
                //         },
                //       ),
                //     ],
                //   ),
                // ),

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

  void _validateFirstName() {
    final firstName = firstNameController.text;
    final isValid = firstNameController.text.isNotEmpty &&
        firstNameController.text.length >= 2 &&
        RegExp(r'^[a-zA-ZÀ-ÿ ]+$').hasMatch(firstNameController.text);

    if (isValid) {
      Fluttertoast.showToast(
        msg: 'Valid First Name',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Invalid First Name',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  void _validateLastName() {
    final lastName = lastNameController.text;
    final isValid = lastNameController.text.isNotEmpty &&
        lastNameController.text.length >= 2 &&
        RegExp(r'^[a-zA-ZÀ-ÿ ]+$').hasMatch(lastNameController.text);

    if (isValid) {
      Fluttertoast.showToast(
        msg: 'Valid Last Name',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Invalid Last Name',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  void _validateEmail() async {
    final email = emailController.text;
    final isValid = EmailValidator.validate(email);

    if (isValid) {
      final isDisposable = await _checkDisposableEmail(email);
      if (isDisposable) {
        Fluttertoast.showToast(
          msg: 'Disposable email addresses are not allowed',
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        return;
      }

      final isDuplicate = await _checkDuplicateEmail(email);
      if (isDuplicate) {
        Fluttertoast.showToast(
          msg: 'This email address is already in use',
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        return;
      }

      Fluttertoast.showToast(
        msg: 'Valid Email',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Invalid Email',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  Future<bool> _checkDisposableEmail(String email) async {
    final response = await http
        .get(Uri.parse('https://open.kickbox.com/v1/disposable/$email'));
    return response.statusCode == 200;
  }

  Future<bool> _checkDuplicateEmail(String email) async {
    // Check if the email already exists in the database
    // Replace this with your own implementation
    return false;
  }

  bool _isValidPhoneNumber(String value) {
    String sanitizedPhoneNumber = value.replaceAll(RegExp(r'[^0-9]'), '');
    return sanitizedPhoneNumber.startsWith('0') &&
        sanitizedPhoneNumber.length == 10 &&
        RegExp(r'^[0-9]+$').hasMatch(sanitizedPhoneNumber);
  }

  bool _isValidPassword(String value) {
    if (value.isEmpty) {
      return false;
    }
    String password = value;
    return password.length >= 8 &&
        RegExp(r'[A-Z]').hasMatch(password) &&
        RegExp(r'[a-z]').hasMatch(password) &&
        RegExp(r'[0-9]').hasMatch(password) &&
        !_isCommonPassword(password);
  }

  bool _isCommonPassword(String password) {
    // Insert your own code here to check if the password is common
    // For example, you can compare the password against a list of common passwords
    // In this example, we assume that the password is not common
    return false;
  }

  void _submitForm() {
    if (isPasswordValid) {
      // // Insert your own code here to handle the submitted password
      // // For example, you can hash the password and store it in your database
      // Fluttertoast.showToast(
      //   msg: 'Confirm your password',
      //   backgroundColor: Colors.green,
      //   textColor: Colors.white,
      // );
    } else {
      Fluttertoast.showToast(
        msg: 'Please enter a strong password',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

// bool _isMatchingPasswords(String value) {
//     if (value.isEmpty) {
//       return false;
//     }
//     String rePassword = value;
//     return rePassword == widget.originalPassword;
//   }

//   void _resubmitForm() {
//     if (isRePasswordValid) {
//       // Insert your own code here to handle the submitted password
//       // For example, you can hash the password and store it in your database
//       Fluttertoast.showToast(
//         msg: 'Password saved',
//         backgroundColor: Colors.green,
//         textColor: Colors.white,
//       );
//     } else {
//       Fluttertoast.showToast(
//         msg: 'Passwords do not match',
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//       );
//     }
//   }
}
