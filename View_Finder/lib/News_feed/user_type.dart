// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../register_page.dart';

String userType = '';

class UserTypeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/10.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(1.0), BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Select Your User Type',
                  style: GoogleFonts.abel(
                    textStyle: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                SizedBox(height: 170),
                SizedBox(
                  width: 800,
                  height: 60,
                  child: TextButton(
                    onPressed: () {
                      userType = 'PHOTOGRAPHER';
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                      // Handle photographer button press
                    },
                    // style: ButtonStyle(
                    //   backgroundColor: MaterialStateProperty.all<Color>(
                    //       Color.fromARGB(154, 255, 255, 255)),
                    //   foregroundColor:
                    //       MaterialStateProperty.all<Color>(Colors.white),
                    //   padding: MaterialStateProperty.all<EdgeInsets>(
                    //     EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    //   ),
                    // ),
                    child: Text(
                      'PHOTOGRAPHER',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 77, 76, 76),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60),
                SizedBox(
                  width: 800,
                  height: 60,
                  child: TextButton(
                    onPressed: () {
                      userType = 'SERVICE PROVIDER';
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                      // Handle photographer button press
                    },
                    // style: ButtonStyle(
                    //   backgroundColor: MaterialStateProperty.all<Color>(
                    //       Color.fromARGB(154, 255, 255, 255)),
                    //   foregroundColor:
                    //       MaterialStateProperty.all<Color>(Colors.white),
                    //   padding: MaterialStateProperty.all<EdgeInsets>(
                    //     EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    //   ),
                    // ),
                    child: Text(
                      'SERVICE PROVIDER',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 77, 76, 76),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60),
                SizedBox(
                  width: 800,
                  height: 60,
                  child: TextButton(
                    onPressed: () {
                      userType = 'CUSTOMER';
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                      // Handle photographer button press
                    },
                    // style: ButtonStyle(
                    //   backgroundColor: MaterialStateProperty.all<Color>(
                    //       Color.fromARGB(154, 255, 255, 255)),
                    //   foregroundColor:
                    //       MaterialStateProperty.all<Color>(Colors.white),
                    //   padding: MaterialStateProperty.all<EdgeInsets>(
                    //     EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    //   ),
                    // ),
                    child: Text(
                      'CUSTOMER',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 77, 76, 76),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60),
                // SizedBox(
                //   width: 800,
                //   height: 60,
                //   child: TextButton(
                //     onPressed: () {
                //       // Handle photographer button press
                //     },
                //     // style: ButtonStyle(
                //     //   backgroundColor: MaterialStateProperty.all<Color>(
                //     //       Color.fromARGB(154, 255, 255, 255)),
                //     //   foregroundColor:
                //     //       MaterialStateProperty.all<Color>(Colors.white),
                //     //   padding: MaterialStateProperty.all<EdgeInsets>(
                //     //     EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                //     //   ),
                //     // ),
                //     child: Text(
                //       'VENDOR',
                //       style: GoogleFonts.lato(
                //         textStyle: TextStyle(
                //           fontSize: 24,
                //           fontWeight: FontWeight.bold,
                //           color: Color.fromARGB(255, 77, 76, 76),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(height: 150),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                    // navigate to register page
                  },
                  child: Text(
                    'register Now is a sample,, you want direct register by pressing user type',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
