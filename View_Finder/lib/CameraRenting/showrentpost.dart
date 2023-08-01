// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login/login_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';

import '../widgets/circle_story.dart';

String phone = '';

class RentPost extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RentPost> {
  List data = [];

  Future<String> getData() async {
    var response = await http
        .get(Uri.parse("http://192.168.105.206:3000/api/users/rents"));

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
                "RENTING SERVICES",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
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
            icon: Icon(Icons.search),
            onPressed: () {
              // showSearch(context: context, delegate: DataSearch(data));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          bool isAvailable = data[index]['availability'] == 1 ? true : false;
          return Container(
            color: Color.fromARGB(105, 45, 45, 45),
            child: Card(
              color: Color.fromARGB(255, 25, 25, 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 400,
                    width: double.infinity,
                    child: PageView(
                      children: [
                        Image.network(data[index]['image_url1'],
                            fit: BoxFit.cover),
                        Image.network(data[index]['image_url2'],
                            fit: BoxFit.cover),
                        Image.network(data[index]['image_url3'],
                            fit: BoxFit.cover),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isAvailable
                          ? Container(
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(76, 175, 80, 1),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'Available',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'sorry Not Available',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
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
                    child: Text((data[index]['title'] ?? ''),
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  SizedBox(height: 10),
                  Text((data[index]['location'] ?? ''),
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
                      Text(
                          'Rs. ' +
                              (data[index]['time1'].toString() ?? '') +
                              '.00',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(76, 175, 80, 1),
                          )),
                      SizedBox(width: 10),
                      Text(' Negotible',
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 199, 199, 199))),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                      (data[index]['firstname'] ?? '') +
                          (data[index]['lastname'] ?? ''),
                      style:
                          const TextStyle(fontSize: 15, color: Colors.white)),
                  SizedBox(height: 10),
                  Divider(
                    color: Colors.grey,
                    thickness: 0.45,
                  ),
                  SizedBox(height: 20),

                  Text(
                      'Brand         :                                        ' +
                          (data[index]['email'] ?? ''),
                      style:
                          const TextStyle(fontSize: 15, color: Colors.white)),

                  Text(
                      'Category    :                                        ' +
                          (data[index]['facebook'] ?? ''),
                      style:
                          const TextStyle(fontSize: 15, color: Colors.white)),

                  // Text(data[index]['contactNo'].toString(),
                  //     style:
                  //         const TextStyle(fontSize: 20, color: Colors.white)),
                  // Text(data[index]['whatsappNo'].toString(),
                  //     style:
                  //         const TextStyle(fontSize: 20, color: Colors.white)),
                  SizedBox(height: 20),
                  Text('Description',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(height: 10),
                  Text((data[index]['description'] ?? ''),
                      style:
                          const TextStyle(fontSize: 15, color: Colors.white)),
                  SizedBox(height: 20),

                  Divider(
                    color: Colors.grey,
                    thickness: 0.45,
                  ),

                  SizedBox(height: 25),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 35,
                          width: 189,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(
                                76,
                                175,
                                80,
                                1,
                              )), // Set the background color of the button
                            ),
                            onPressed: () {
                              phone = data[index]['mobile'].toString();
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
                          height: 35,
                          width: 189,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
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
                  SizedBox(height: 25),
                  Divider(
                    color: Colors.grey,
                    thickness: 0.45,
                  ),

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
