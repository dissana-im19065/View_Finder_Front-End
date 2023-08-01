// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login/login_page.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import '../News_feed/search_screen.dart';
import '../widgets/circle_story.dart';
import 'package:url_launcher/url_launcher.dart';

String phone = '';

class CusRequests extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CusRequests> {
  List data = [];

  Future<String> getData() async {
    var response =
        await http.get(Uri.parse("http://192.168.105.206:3000/api/users/req"));

    setState(() {
      var decodedData = jsonDecode(response.body);
      data = decodedData['data'];
    });

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 83, 83, 83)),
          onPressed: () {},
        ),

        toolbarHeight: 85,
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                  width: 150,
                  child: Image(image: AssetImage('images/logo.png')),
                ),
              ],
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   width: 24,
              // ),
              Text(
                "CUSTOMER REQUESTS",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Divider(
                color: const Color.fromARGB(255, 236, 236, 236),
                thickness: 1.45,
              ),
              SizedBox(
                height: 60,
              )
            ],
          ),
        ),
        //search bar
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Color.fromARGB(255, 83, 83, 83)),
            onPressed: () {
              // navigate
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchMarket()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Color.fromARGB(105, 0, 0, 0),
            child: Card(
              color: Color.fromARGB(157, 82, 81, 81),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 15),

                  // SizedBox(height: 10),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {
                  //         setState(() {
                  //           isAvailable = !isAvailable;
                  //         });
                  //       },
                  //       child: Ink(
                  //         decoration: BoxDecoration(
                  //           shape: BoxShape.circle,
                  //           color: isAvailable ? Colors.green : Colors.red,
                  //         ),
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Icon(
                  //             isAvailable ? Icons.check : Icons.close,
                  //             color: Colors.white,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(data[index]['title'],
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  SizedBox(height: 10),
                  Text(data[index]['description'],
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Divider(
                    color: Colors.grey,
                    thickness: 0.45,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Text('Rs. ' + data[index]['category'] + '.00',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(76, 175, 80, 1),
                          )),
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                      'Requested by            ' +
                          data[index]['first_name'] +
                          ' ' +
                          data[index]['last_name'],
                      style:
                          const TextStyle(fontSize: 15, color: Colors.white)),
                  SizedBox(height: 10),
                  Divider(
                    color: Colors.grey,
                    thickness: 0.45,
                  ),
                  SizedBox(height: 20),

                  Text(
                      'location         :                                        ' +
                          data[index]['location'],
                      style:
                          const TextStyle(fontSize: 15, color: Colors.white)),

                  Text(
                      'Category    :                                        ' +
                          data[index]['category'],
                      style:
                          const TextStyle(fontSize: 15, color: Colors.white)),

                  // Text(data[index]['contactNo'].toString(),
                  //     style:
                  //         const TextStyle(fontSize: 20, color: Colors.white)),
                  // Text(data[index]['whatsappNo'].toString(),
                  //     style:
                  //         const TextStyle(fontSize: 20, color: Colors.white)),
                  SizedBox(height: 20),
                  Text('want_date',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(height: 10),
                  Text(data[index]['want_date'],
                      style:
                          const TextStyle(fontSize: 15, color: Colors.white)),
                  SizedBox(height: 20),

                  SizedBox(height: 25),

                  Center(
                    child: Container(
                      height: 60,
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                            width: 189,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(
                                  76,
                                  175,
                                  80,
                                  1,
                                )), // Set the background color of the button
                              ),
                              onPressed: () {
                                phone = data[index]['contact1'].toString();
                                launch("tel:$phone");
                              },
                              child: Text('Phone',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 42, 41, 41))),
                            ),
                          ),
                          SizedBox(width: 15),
                          SizedBox(
                            height: 30,
                            width: 189,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(
                                  76,
                                  175,
                                  80,
                                  1,
                                )), // Set the background color of the button
                              ),
                              onPressed: () =>
                                  launch('https://wa.me/$phone?text=Hello'),
                              child: Text('Whatsapp',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 50, 49, 49))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 25),

                  // Text(data[index]['cart'].toString()),
                  // Text(data[index]['availability'].toString()),
                  // Text(data[index]['first_name']),
                  // Text(data[index]['last_name']),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
