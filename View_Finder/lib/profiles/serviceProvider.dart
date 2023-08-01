// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, unused_import, use_build_context_synchronously, avoid_unnecessary_containers, avoid_print, prefer_const_declarations, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:login/News_feed/login_screen.dart';
import 'package:login/login_page.dart';
import 'package:login/market/marketMain.dart';
import 'package:login/screens/main_screen.dart';
import 'package:login/widgets/circle_story.dart';
import 'package:mime/mime.dart';
import 'package:http/http.dart' as http;

import '../CameraRenting/RentingSer_FormReg.dart';
import '../calendar.dart';
import '../customer requests/addRequest.dart';
import '../customer requests/customerRequest.dart';
import '../market/add_item.dart';

import '../reports/report2.dart';
import '../reviews/addReview.dart';
import '../reviews/showReviews.dart';

class ServiceProviderProfileScreen extends StatefulWidget {
  // final List _stories = ['story 1', 'story 2', 'story 3', 'story 4', 'story 5'];

  ServiceProviderProfileScreen({Key? key}) : super(key: key);

  @override
  State<ServiceProviderProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ServiceProviderProfileScreen> {
  final descriptionController = TextEditingController();

  PlatformFile? pickedFile;
  bool isUploading = false;
  UploadTask? uploadTask;

  Future<void> createPost(imageurl) async {
    final url = 'http://192.168.105.206:3000/api/users/post';
    final headers = {'Content-Type': 'application/json'};

    final userData = {
      'userId': userId,
      'image_url': imageurl,
      'description': descriptionController.text,
      'category': _selectedOption,
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
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      } else {
        // Error registering user
        print('post publish failed. Status code: ${response.statusCode}');
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ServiceProviderProfileScreen()),
        );
      }
    } catch (error) {
      // Handle the error
      print('Error posting post: $error');
    }
  }

  Future uploadImage() async {
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    // setState(() {
    //   isUploading = true;
    // });
    uploadTask = ref.putFile(file);
    final snapshot = await uploadTask!.whenComplete(() {});

    String urlDownload = await snapshot.ref.getDownloadURL();
    createPost(urlDownload);

    print('Download-Link: $urlDownload');
  }

  //
  Future addImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );
    if (result == null) return;
    File file = File(result.files.single.path!);
    String mimeType = lookupMimeType(file.path)!;

    if (mimeType.startsWith('image/')) {
      setState(() {
        pickedFile = result.files.first;
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Invalid file type'),
          content: Text('Please select an image file'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  String _selectedOption = 'Wedding';

  final List<String> _options = [
    'Wedding',
    'Wild Life',
    'Nikon',
    'Canon',
    'Sony',
    'Fuji',
    'Camera Lences',
    'Repair Your Camera',
    'Lences Coatings',
    'for Beginners',
    'Lens Filters',
    'For Rent',
    'Locations',
    'Drone Fly',
    'MakeUp Artists',
    'macro photography',
    'Street photography',
    'Mobile Photography',
    'MODELS',
    'Event Photography',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 70,
                      width: 180,
                      child: Image(image: AssetImage('images/logo.png')),
                    ),
                  ],
                ),
              ],
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            // title: Text(
            //   firstName.toString() + ' ' + lastName.toString(),
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
            actions: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'LOGOUT     ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Container(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/666.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(1.0), BlendMode.dstATop),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 15.0, bottom: 10),
                              child: CircleStory(),
                            ),
                          ],
                        ),
                        //////////////////////////////////////////////////////////////////////
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                '$firstName ' ' $lastName',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Color.fromARGB(255, 38, 38, 38),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 50.0, top: 20, bottom: 20),
                              child: Text(
                                usertype,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 29, 29, 29)),
                              ),
                            ),
                          ],
                        ),
                        //////////////////////////////////////////////////////////
                        // Row(
                        //   children: [
                        //     Padding(
                        //       padding:
                        //           const EdgeInsets.only(left: 10, top: 17, right: 8),
                        //       child: Container(
                        //         height: 45,
                        //         width: 320,
                        //         decoration: BoxDecoration(
                        //             color: Color.fromARGB(8, 190, 184, 184),
                        //             borderRadius: BorderRadius.circular(8)),
                        //         child: const Center(
                        //             child: Text(
                        //           'Edit Profile',
                        //           style: TextStyle(
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.bold),
                        //         )),
                        //       ),
                        //     ),
                        //     Padding(
                        //         padding: const EdgeInsets.only(
                        //             left: 9.0, top: 17, right: 5),
                        //         child: Container(
                        //           height: 45,
                        //           width: 40,
                        //           decoration: BoxDecoration(
                        //               color: Colors.grey.shade700,
                        //               borderRadius: BorderRadius.circular(8)),
                        //           child: const Center(
                        //             child: Icon(
                        //               Icons.person_add,
                        //               color: Colors.white,
                        //             ),
                        //           ),
                        //         )),
                        //   ],
                        // ),
                        /////////////////////////////////////////////////////////////
                        // Row(
                        //   children: const [
                        //     Padding(
                        //       padding: EdgeInsets.only(top: 16.0, left: 18),
                        //       child: Text(
                        //         'Story Hightlights',
                        //         style: TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 17,
                        //             fontWeight: FontWeight.bold),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        //
                        ///////////////////////////////////////////////////////////////////////
                        // SizedBox(
                        //   height: 120,
                        //   child: ListView.builder(
                        //       itemCount: _stories.length,
                        //       scrollDirection: Axis.horizontal,
                        //       itemBuilder: (context, index) {
                        //         return StoryWidget(
                        //           username: _stories[index],
                        //         );
                        //       }),
                        // ),

                        Expanded(
                          child: TabBarView(
                            children: <Widget>[
                              Center(
                                child: Column(
                                  children: [
                                    // SizedBox(
                                    //   height: 50,
                                    // ),
                                    GestureDetector(
                                      onTap: () {
                                        // print('sss');
                                        addImage();
                                      },
                                      child: Icon(
                                        Icons.person_add,
                                        color: const Color.fromARGB(
                                            255, 36, 36, 36),
                                        size: 60,
                                      ),
                                    ),
                                    Text(
                                      "ADD PHOTOS",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 36, 36, 36)),
                                    ),
                                    SizedBox(height: 30),
                                    //      description to post .................
                                    SizedBox(
                                      width: 350,
                                      child: TextFormField(
                                        controller: descriptionController,
                                        maxLines: null,
                                        keyboardType: TextInputType.multiline,
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 39, 39, 39)),
                                        decoration: InputDecoration(
                                          labelText: 'Description',
                                          labelStyle: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 35, 35, 35)),
                                          hintText: 'Enter a description',
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 20.0, horizontal: 20.0),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 156, 156, 156),
                                                width: 2.0),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter a description';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    if (pickedFile != null)
                                      Expanded(
                                          child: Container(
                                        child: Image.file(
                                          File(
                                            pickedFile!.path.toString(),
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                    SizedBox(height: 20),

                                    DropdownButton<String>(
                                      iconDisabledColor:
                                          const Color.fromARGB(255, 82, 81, 81),
                                      iconEnabledColor:
                                          const Color.fromARGB(255, 96, 95, 95),
                                      focusColor:
                                          const Color.fromARGB(255, 80, 79, 79),
                                      hint: Text('Select an option'),
                                      menuMaxHeight: 200,
                                      value: _selectedOption,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _selectedOption = newValue!;
                                        });
                                        print(_selectedOption);
                                      },
                                      items: _options
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),

                                    ElevatedButton(
                                      onPressed: () {
                                        uploadImage();
                                      },
                                      child: Text('ADD POST'),
                                    ),
                                    SizedBox(height: 10),
                                    // Container(
                                    //   margin: EdgeInsets.only(top: 20),
                                    // ),
                                    SizedBox(height: 0),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      addItem()),
                                            );
                                          },
                                          child: Text(
                                            'PUBLISH ADD',
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
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
                                                  builder: (context) => Rent()),
                                            );
                                          },
                                          child: Text(
                                            'Rent Register Form',
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
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
                                                  builder: (context) =>
                                                      MyRequestForm()),
                                            );
                                          },
                                          child: Text(
                                            'Any Regest Form',
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
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
                                                  builder: (context) =>
                                                      ReviewFormPopup()),
                                            );
                                          },
                                          child: Text(
                                            'ADD REVIEW',
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
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
                                                  builder: (context) =>
                                                      ReviewsScreen()),
                                            );
                                          },
                                          child: Text(
                                            'View REVIEWs',
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
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
                                                  builder: (context) =>
                                                      PieChartPage()),
                                            );
                                          },
                                          child: Text(
                                            'View REVIEWs',
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 350, top: 780),
                child: FloatingActionButton(
                  elevation: 0.0, // Removes the border or elevation
                  highlightElevation: 0.0,

                  backgroundColor: Colors.green,

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  },
                  child: Icon(Icons.home,
                      size: 40, color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ],
          ),
        ));
  }
}
