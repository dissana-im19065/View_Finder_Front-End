// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, prefer_const_declarations, unnecessary_null_comparison, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:login/login_page.dart';
import 'dart:convert';

import '../widgets/circle_story.dart';

class SearchMarket extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SearchMarket> {
  List data = [];
  final TextEditingController _searchController = TextEditingController();

  Future<void> getData() async {
    if (_searchController.text != '' || _searchController.text != null) {
      final url = 'http://192.168.105.206:3000/api/users/searchadds';
      final headers = {'Content-Type': 'application/json'};

      final userData = {
        'search': _searchController.text,
        // 'location': dropdownValue1,
        // 'category': dropdownValue2,
        //
      };

      final jsonData = json.encode(userData);

      try {
        final response =
            await http.post(Uri.parse(url), headers: headers, body: jsonData);

        if (response.statusCode == 200) {
          setState(() {
            var decodedData = jsonDecode(response.body);
            print(decodedData.toString());
            data = decodedData['data'];
          });
        } else {
          // Error registering user
          print('Search failed. Status code: ${response.statusCode}');
        }
      } catch (error) {
        // Handle the error
        print('Error searching: $error');
      }
    } else if ((dropdownValue1 != '' || dropdownValue1 != null) &&
        (dropdownValue2 == '' || dropdownValue2 == null)) {
      final url = 'http://192.168.105.206:3000/api/users/searchadds';
      final headers = {'Content-Type': 'application/json'};

      final userData = {
        // 'search': _searchController.text,
        'location': dropdownValue1,
        // 'category': dropdownValue2,
        //
      };

      final jsonData = json.encode(userData);

      try {
        final response =
            await http.post(Uri.parse(url), headers: headers, body: jsonData);

        if (response.statusCode == 200) {
          setState(() {
            var decodedData = jsonDecode(response.body);
            print(decodedData.toString());
            data = decodedData['data'];
          });
        } else {
          // Error registering user
          print('Search failed. Status code: ${response.statusCode}');
        }
      } catch (error) {
        // Handle the error
        print('Error searching: $error');
      }
    } else if ((dropdownValue1 != '' || dropdownValue1 != null) &&
        (dropdownValue2 != '' || dropdownValue2 != null)) {
      final url = 'http://192.168.105.206:3000/api/users/searchadds';
      final headers = {'Content-Type': 'application/json'};

      final userData = {
        // 'search': _searchController.text,
        'location': dropdownValue1,
        'category': dropdownValue2,
        //
      };

      final jsonData = json.encode(userData);

      try {
        final response =
            await http.post(Uri.parse(url), headers: headers, body: jsonData);

        if (response.statusCode == 200) {
          setState(() {
            var decodedData = jsonDecode(response.body);
            print(decodedData.toString());
            data = decodedData['data'];
          });
        } else {
          // Error registering user
          print('Search failed. Status code: ${response.statusCode}');
        }
      } catch (error) {
        // Handle the error
        print('Error searching: $error');
      }
    } else if ((dropdownValue2 != '' || dropdownValue2 != null) &&
        (dropdownValue1 == '' || dropdownValue1 == null)) {
      final url = 'http://192.168.105.206:3000/api/users/searchadds';
      final headers = {'Content-Type': 'application/json'};

      final userData = {
        // 'search': _searchController.text,
        // 'location': dropdownValue1,
        'category': dropdownValue2,
        //
      };

      final jsonData = json.encode(userData);

      try {
        final response =
            await http.post(Uri.parse(url), headers: headers, body: jsonData);
        if (response.statusCode == 200) {
          setState(() {
            var decodedData = jsonDecode(response.body);
            print(decodedData.toString());
            data = decodedData['data'];
          });
        } else {
          // Error registering user
          print('Search failed. Status code: ${response.statusCode}');
        }
      } catch (error) {
        // Handle the error
        print('Error searching: $error');
      }
    } else if (_searchController.text == '' ||
        _searchController.text == null ||
        dropdownValue1 == '' ||
        dropdownValue1 == null ||
        dropdownValue2 == '' ||
        dropdownValue2 == null) {
      Fluttertoast.showToast(
        msg: 'Not FOund',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    }
  }

  // Future<String> getData() async {
  //   print('searching');
  //   // button eke on pressed ekata danna
  //   var response = await http
  //       .post(Uri.parse("http://192.168.144.206:3000/api/users/searchadds"));

  //   final userData = {
  //     'search': _searchController.text,
  //   };

  //   final jsonData = json.encode(userData);
  //   print(jsonData.toString());

  //   setState(() {
  //     var decodedData = jsonDecode(response.body);
  //     print(decodedData.toString());
  //     data = decodedData['data'];
  //   });

  //   return "Success!";
  // }

  String dropdownValue1 = '';
  String dropdownValue2 = '';
  String choose = 'Category';
  String choose1 = 'Location';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage('images/15.jpg'),
      //     fit: BoxFit.cover,
      //     colorFilter: ColorFilter.mode(
      //         Colors.black.withOpacity(1.0), BlendMode.dstATop),
      //   ),
      // ),
      child: Scaffold(
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        appBar: AppBar(
          toolbarHeight: 145,
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          title: Container(
            width: 400,
            child: Column(
              children: [
                TextField(
                  style: TextStyle(
                    color: const Color.fromARGB(
                        255, 255, 255, 255), // Set the text color
                  ),
                  controller: _searchController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0)),
                    fillColor: Colors.grey.shade700,
                    prefixIconColor: Colors.white,
                    filled: true,
                    constraints:
                        BoxConstraints.tightFor(width: 3850, height: 48),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search_outlined,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                      onPressed: () {
                        getData();
                      },
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText:
                        '           search here anything related on Market',
                  ),
                  // onChanged: _onSearchTextChanged,
                ),

                SizedBox(height: 15),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: SizedBox(
                          height: 35,
                          width: 182,
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
                              showMenu(
                                context: context,
                                position: RelativeRect.fromLTRB(0, 180, 0, 0),
                                items: <PopupMenuEntry<String>>[
                                  PopupMenuItem<String>(
                                    child: ListTile(
                                      title: Text('nil'),
                                      onTap: () {
                                        setState(() {
                                          dropdownValue1 = 'nil';
                                          choose1 = 'nil';
                                          getData();
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  PopupMenuItem<String>(
                                    child: ListTile(
                                      title: Text('Option 2'),
                                      onTap: () {
                                        setState(() {
                                          dropdownValue1 = 'Option 2';
                                          choose1 = 'Option 2';
                                          getData();
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  PopupMenuItem<String>(
                                    child: ListTile(
                                      title: Text('Option 3'),
                                      onTap: () {
                                        setState(() {
                                          dropdownValue1 = 'Option 3';
                                          choose1 = 'Option 3';
                                          getData();
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
                            child: Text(choose1,
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255))),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: SizedBox(
                          height: 35,
                          width: 182,
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
                              showMenu(
                                context: context,
                                position: RelativeRect.fromLTRB(50, 180, 0, 10),
                                items: <PopupMenuEntry<String>>[
                                  PopupMenuItem<String>(
                                    child: ListTile(
                                      title: Text('Option 1'),
                                      onTap: () {
                                        setState(() {
                                          dropdownValue2 = 'Option 1';
                                          choose = 'Option 1';
                                          getData();
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  PopupMenuItem<String>(
                                    child: ListTile(
                                      title: Text('Option 2'),
                                      onTap: () {
                                        setState(() {
                                          dropdownValue2 = 'Option 2';
                                          choose = 'Option 2';
                                          getData();
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  PopupMenuItem<String>(
                                    child: ListTile(
                                      title: Text('Option 3'),
                                      onTap: () {
                                        setState(() {
                                          dropdownValue2 = 'Option 3';
                                          choose = 'Option 3';
                                          getData();
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
                            child: Text(choose,
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(width: 15),
                SizedBox(height: 10),
                Divider(
                  color: Colors.grey,
                  thickness: 0.45,
                ),
              ],
            ),
          ),
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
                        child: Image.network(data[index]['image1_url'],
                            fit: BoxFit.cover)),
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
                      child: Text(data[index]['title'],
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    SizedBox(height: 10),
                    Text(data[index]['Location'],
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
                        Text('Rs. ' + data[index]['price'].toString() + '.00',
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
                        'for Sale by            ' +
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
                        'Brand         :                                        ' +
                            data[index]['subtitle'],
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
                    Text('Description',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    SizedBox(height: 10),
                    Text(data[index]['description'],
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
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(
                                  76,
                                  175,
                                  80,
                                  1,
                                )), // Set the background color of the button
                              ),
                              onPressed: () {},
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
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(
                                  76,
                                  175,
                                  80,
                                  1,
                                )), // Set the background color of the button
                              ),
                              onPressed: () {},
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
      ),
    );
  }
}

// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:login/data/image_data.dart';
// import 'package:login/screens/image_cart.dart';
// import 'package:login/widgets/search%20bar.dart';
// import 'package:mysql1/mysql1.dart';

// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   final TextEditingController _searchController = TextEditingController();

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     backgroundColor: Color.fromARGB(255, 0, 0, 0),
//     appBar: AppBar(
//       toolbarHeight: 85,
//       automaticallyImplyLeading: false,
//       backgroundColor: Color.fromARGB(255, 0, 0, 0),
//       title: Center(
//         child: TextField(
//           style: TextStyle(
//             color:
//                 const Color.fromARGB(255, 255, 255, 255), // Set the text color
//           ),
//           controller: _searchController,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//             fillColor: Colors.grey.shade700,
//             prefixIconColor: Colors.white,
//             filled: true,
//             constraints: BoxConstraints.tightFor(width: 3550, height: 50),
//             prefixIcon: Icon(
//               Icons.search_outlined,
//               color: const Color.fromARGB(255, 255, 255, 255),
//             ),
//             hintStyle: TextStyle(color: Colors.grey),
//             hintText: 'search here',
//           ),
//           // onChanged: _onSearchTextChanged,
//         ),
//       ),
//     ),
//     body: Column(
//       children: [
//         SizedBox(height: 5),
//         Container(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 35,
//                 width: 182,
//                 child: ElevatedButton(
//                   style: ButtonStyle(
//                     backgroundColor:
//                         MaterialStateProperty.all<Color>(Color.fromRGBO(
//                       76,
//                       175,
//                       80,
//                       1,
//                     )), // Set the background color of the button
//                   ),
//                   onPressed: () {},
//                   child: Text('Location',
//                       style: const TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                           color: Color.fromARGB(255, 255, 255, 255))),
//                 ),
//               ),
//               SizedBox(width: 15),
//               SizedBox(
//                 height: 35,
//                 width: 182,
//                 child: ElevatedButton(
//                   style: ButtonStyle(
//                     backgroundColor:
//                         MaterialStateProperty.all<Color>(Color.fromRGBO(
//                       76,
//                       175,
//                       80,
//                       1,
//                     )), // Set the background color of the button
//                   ),
//                   onPressed: () {},
//                   child: Text('Category',
//                       style: const TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                           color: Color.fromARGB(255, 255, 255, 255))),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
// // // // // }
