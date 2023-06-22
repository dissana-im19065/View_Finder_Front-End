// ignore_for_file: unused_import, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, deprecated_member_use, camel_case_types, prefer_typing_uninitialized_variables, prefer_final_fields, unused_field, unused_local_variable, avoid_print, use_build_context_synchronously


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/screens/main_screen.dart';
import 'register_page.dart';
import 'package:login/api/api_login.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

@override
State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  // SharedPreferences _sharedPreferences;



  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/15.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(1.0),
            BlendMode.dstATop
          ),
        ),
      ),
    
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column (
            children: [
            
            Container(
                margin: EdgeInsets.only(top: 80),
                child : Center(
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
                  color: Color.fromARGB(255, 248, 250, 249).withOpacity(0.5), // Shadow color
                   spreadRadius: 03, // Spread radius
                   blurRadius: 105, // Blur radius
                  offset: Offset(0, 5), // Offset in the x and y directions
              ),
            ],
            ),
            
            
                margin: EdgeInsets.only(top: 18),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                    style: TextStyle(fontSize: 50),
                    children: <TextSpan>[
                      TextSpan(text: 'V', style: TextStyle(color: Color.fromARGB(255, 90, 90, 90))),
                      TextSpan(text: 'iew', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                      TextSpan(text: ' F', style: TextStyle(color: Color.fromARGB(255, 84, 84, 84))),
                      TextSpan(text: 'inder', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
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
                margin: EdgeInsets.only(top: 120),
                child: Center(
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _emailController,
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
                      controller: _passwordController,
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
                      onPressed: () {

                        _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty
                            ? doLogin(_emailController.text, _passwordController.text)
                            : Fluttertoast.showToast(
                                msg: "all fields are required",
                                textColor: Color.fromARGB(255, 255, 255, 255),
                                );



                        




                      },
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
                        MaterialPageRoute(builder: (context) => RegisterPage()),
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
        )
      ),
    ); 
  }


  
  
  doLogin(String email, String password) async {
    print("inside dologin");
    var res=await userLogin(email.trim(), password.trim());
print(res);
    if(res['success']){
      print(res);
      Route route = MaterialPageRoute(builder: (context) => MainScreen());
      Navigator.pushReplacement(context, route);

    }else{
      Fluttertoast.showToast(
        msg: 'email and password not valid?',
        textColor: Color.fromARGB(255, 254, 1, 1),
      );
    }
    
  }
}
