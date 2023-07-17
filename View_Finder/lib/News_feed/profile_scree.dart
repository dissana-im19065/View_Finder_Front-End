// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, unused_import, use_build_context_synchronously, avoid_unnecessary_containers, avoid_print, prefer_const_declarations, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:login/News_feed/login_screen.dart';
import 'package:login/login_page.dart';
import 'package:login/screens/main_screen.dart';
import 'package:login/widgets/circle_story.dart';
import 'package:mime/mime.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  // final List _stories = ['story 1', 'story 2', 'story 3', 'story 4', 'story 5'];

  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final descriptionController = TextEditingController();

  PlatformFile? pickedFile;
  bool isUploading = false;
  UploadTask? uploadTask;

  Future<void> createPost(imageurl) async {
    final url = 'http://192.168.189.206:3000/api/users/post';
    final headers = {'Content-Type': 'application/json'};

    final userData = {
      'userId': userId,
      'image_url': imageurl,
      'description': descriptionController.text,
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
        print('User registration failed. Status code: ${response.statusCode}');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
      }
    } catch (error) {
      // Handle the error
      print('Error registering user: $error');
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
    // setState(() {
    //   isUploading = false;
    // });
    // StoreSalonType(
    //   salon_id,
    //   selectedOptions,
    //   urlDownload,
    // );
    // final shortedUrl = shortenUrl(urlDownload);
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
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
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 15.0, left: 10),
                        child: CircleStory(),
                      ),
                      Row(
                        children: [
                          Column(
                            children: const [
                              Text(
                                '10',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                              Text(
                                'Posts',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          Text(
                            '130',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          Text(
                            'Followers',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 26.0),
                        child: Column(
                          children: const [
                            Text(
                              '405',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            Text(
                              'Following',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //////////////////////////////////////////////////////////////////////
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 130, top: 10),
                        child: Text(
                          '$firstName ' ' $lastName',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 50.0, top: 20, bottom: 20),
                        child: Text(
                          'I welcome you to my profile please do not stalk me',
                          style: TextStyle(color: Colors.white),
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

                  const TabBar(tabs: <Widget>[
                    Tab(
                      icon: Icon(Icons.video_collection_outlined),
                    ),
                    Tab(
                      icon: Icon(Icons.person_add_alt_outlined),
                    ),
                  ]),

                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        Center(
                          child: Column(
                            children: const [
                              SizedBox(
                                height: 50,
                              ),
                              Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                                size: 60,
                              ),
                              Text(
                                "No Posts Yet",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // print('sss');
                                  addImage();
                                },
                                child: Icon(
                                  Icons.person_add,
                                  color: Colors.white,
                                  size: 60,
                                ),
                              ),
                              Text(
                                "ADD PHOTOS",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 30),
                              //      description to post .................
                              SizedBox(
                                width: 350,
                                child: TextFormField(
                                  controller: descriptionController,
                                  maxLines: null,
                                  keyboardType: TextInputType.multiline,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    labelText: 'Description',
                                    labelStyle: TextStyle(color: Colors.white),
                                    hintText: 'Enter a description',
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 20.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2.0),
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
                              SizedBox(height: 30),
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
                              ElevatedButton(
                                onPressed: () {
                                  uploadImage();
                                },
                                child: Text('ADD POST'),
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
        ));
  }
}
