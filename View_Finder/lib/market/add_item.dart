// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/market/mArket.dart';
import 'package:mime/mime.dart';

import '../News_feed/home_screen.dart';
import '../profiles/profile_scree.dart';
import '../login_page.dart';
import 'package:http/http.dart' as http;

import '../screens/main_screen.dart';
import '../widgets/circle_story.dart';

class addItem extends StatefulWidget {
  addItem({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<addItem> {
  final List<Post> _posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (BuildContext context, int index) {
                return PostWidget(post: _posts[index]);
              },
            ),
          ),
          AddPostWidget(
            onAddPost: (description, images) {
              setState(() {
                _posts.add(Post(
                  name: 'John Doe',
                  avatarUrl: '',
                  imageUrl: images?.first.path,
                  text: description,
                  likes: 0,
                ));
              });
            },
          ),
        ],
      ),
    );
  }
}

class Post {
  final String name;
  final String avatarUrl;
  final String? imageUrl;
  final String text;
  final int likes;

  Post({
    required this.name,
    required this.avatarUrl,
    this.imageUrl,
    required this.text,
    required this.likes,
  });
}

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (post.imageUrl != null) ...[
            SizedBox(height: 16),
            Image.file(File(post.imageUrl!)),
          ],
          SizedBox(height: 5),
        ],
      ),
    );
  }
}

class AddPostWidget extends StatefulWidget {
  final Function(String, List<XFile>?) onAddPost;

  const AddPostWidget({Key? key, required this.onAddPost}) : super(key: key);

  @override
  _AddPostWidgetState createState() => _AddPostWidgetState();
}

class _AddPostWidgetState extends State<AddPostWidget> {
  final TextEditingController _controller = TextEditingController();
  List<XFile>? _imageFiles;

  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final priceController = TextEditingController();
  final categoryController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  final contactController = TextEditingController();
  final whatsappController = TextEditingController();

  PlatformFile? pickedFile;
  bool isUploading = false;
  UploadTask? uploadTask;

  Future<void> _selectImages() async {
    final imagePicker = ImagePicker();
    final pickedFiles = await imagePicker.pickMultiImage();
    setState(() {
      _imageFiles = pickedFiles;
    });
  }

  Future<void> createPost(imageurl) async {
    final url = 'http://192.168.184.206:3000/api/users/adds';
    final headers = {'Content-Type': 'application/json'};

    final userData = {
      "user_id": userId,
      "title": titleController.text,
      "subtitle": subtitleController.text,
      "price": priceController.text,
      "category": categoryController.text,
      "description": descriptionController.text,
      "image1_url": imageurl,
      "Location": locationController.text,
      "contactNo": contactController.text,
      "whatsappNo": whatsappController.text,
      "cart": true,
      "availability": true
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
          MaterialPageRoute(builder: (context) => MarkeTs()),
        );
      } else {
        // Error registering user
        print('post publish failed. Status code: ${response.statusCode}');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: SingleChildScrollView(
            child: Expanded(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    child: Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              // Padding(
                              //   padding: EdgeInsets.only(top: 0.0, bottom: 0),
                              //   child: SizedBox(
                              //       height: 50, width: 50, child: CircleStory()),
                              // ),
                              // SizedBox(width: 8),
                              // Text(firstName + ' ' + lastName),
                            ],
                          ),
                          SizedBox(height: 3),
                          Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 5),
                                  Flexible(
                                    child: TextField(
                                      controller: titleController,
                                      // controller: _controller,

                                      decoration: InputDecoration(
                                        hintText: 'TITLE',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 100),
                                  Flexible(
                                    child: TextField(
                                      controller: subtitleController,
                                      decoration: InputDecoration(
                                        hintText: 'SubTITLE',
                                        hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 150, 148, 148),
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 5),
                                  Flexible(
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: priceController,
                                      decoration: InputDecoration(
                                        hintText: 'PRICE',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 100),
                                  Flexible(
                                    child: TextField(
                                      controller: categoryController,
                                      decoration: InputDecoration(
                                        hintText: 'CATEGORY',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 5),
                                  Flexible(
                                    child: TextField(
                                      controller: descriptionController,
                                      decoration: InputDecoration(
                                        hintText: 'DESCRIPTION',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 100),
                                  Flexible(
                                    child: TextField(
                                      controller: locationController,
                                      decoration: InputDecoration(
                                        hintText: 'LOCATION',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 5),
                                  Flexible(
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: contactController,
                                      decoration: InputDecoration(
                                        hintText: 'CONTACT',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 100),
                                  Flexible(
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: whatsappController,
                                      decoration: InputDecoration(
                                        hintText: 'WHATSAPP',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          if (_imageFiles != null)
                            Expanded(
                              child: GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                ),
                                itemCount: _imageFiles!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Image.file(
                                    File(_imageFiles![index].path),
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(255, 150, 148, 148),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.photo_album),
                              onPressed: () {
                                _selectImages();
                                addImage();
                              },
                            ),
                            SizedBox(width: 5),
                            Text('Add Photo'),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle post button press
                            final description = _controller.text;

                            final images = _imageFiles;
                            widget.onAddPost(description, images);
                            _controller.clear();
                            setState(() {
                              _imageFiles = null;
                            });
                          },
                          child: Text('Preview',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 68, 68, 68))),
                        ),
                        TextButton(
                          onPressed: () {
                            uploadImage();
                            // Handle post button press
                          },
                          child: Text('Post',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 210, 210, 210))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}


// TextField(
//                   controller: descriptionController,
//                   decoration: InputDecoration(
//                     hintText: 'Title',
//                     border: InputBorder.none,
//                   ),
//                 ),
//                 SizedBox(height: 3),