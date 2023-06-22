// ignore_for_file: unused_import, depend_on_referenced_packages, non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;



Future userLogin(String email,String Password)async{
  
  final body ={ "email" :email, "password" :Password };
      final response=await http.post(Uri.parse('http://10.0.2.2:3000/user/login'),
      headers: <String,String>{
        'content-Type': 'application/json; charset=UTF-8',
      },
      body:jsonEncode(body)  //define param in json format
      
      );
print(jsonEncode(body));
var decodedData=jsonDecode(response.body);
return decodedData;


}
