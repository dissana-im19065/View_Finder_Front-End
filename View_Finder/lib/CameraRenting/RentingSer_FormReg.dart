// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, use_build_context_synchronously, prefer_final_fields

import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/CameraRenting/showrentpost.dart';
import 'package:login/market/mArket.dart';
import 'package:mime/mime.dart';

import '../News_feed/home_screen.dart';
import '../profiles/profile_scree.dart';
import '../login_page.dart';
import 'package:http/http.dart' as http;

import '../screens/main_screen.dart';
import '../widgets/circle_story.dart';

class Rent extends StatefulWidget {
  Rent({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Rent> {
  final List<Post> _posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Column(
        children: [
          // Expanded(
          //   // child: ListView.builder(
          //   //   itemCount: _posts.length,
          //   //   itemBuilder: (BuildContext context, int index) {
          //   //     return PostWidget(post: _posts[index]);
          //   //   },
          //   // ),
          // ),
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

// class PostWidget extends StatelessWidget {
//   final Post post;

//   const PostWidget({Key? key, required this.post}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 8),
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           if (post.imageUrl != null) ...[
//             SizedBox(height: 16),
//             Image.file(File(post.imageUrl!)),
//           ],
//           SizedBox(height: 5),
//         ],
//       ),
//     );
//   }
// }

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
  final business_nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  final contactController = TextEditingController();
  final whatsappController = TextEditingController();
  final facebookController = TextEditingController();
  final instaController = TextEditingController();
  final notAvailable_daysController = TextEditingController();

  PlatformFile? pickedFile;
  bool isUploading = false;
  UploadTask? uploadTask;

  Future<void> createPost(imageurl1, imageurl2, imageurl3) async {
    final url = 'http://192.168.105.206:3000/api/users/rent';
    final headers = {'Content-Type': 'application/json'};

    final userData = {
      "user_id": userId,
      "business_name": business_nameController.text,
      "title": titleController.text,
      "description": descriptionController.text,
      "image_url1": imageurl1,
      "image_url2": imageurl2,
      "image_url3": imageurl3,
      "whatsapp": whatsappController.text,
      "mobile": mobileController.text,
      "email": emailController.text,
      "facebook": facebookController.text,
      "insta": instaController.text,
      "location": locationController.text,
      "availability": true,
      "time1": 9,
      "time2": 10,
      "notAvailable_days": notAvailable_daysController.text,
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
          MaterialPageRoute(builder: (context) => RentPost()),
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

  List<File?> _images =
      List.generate(3, (_) => null); // list to store selected images
  List<String?> _downloadUrls = List.generate(
      3, (_) => null); // list to store download URLs of uploaded images

  Future<void> addImage(int index) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
      allowMultiple: true, // enable selecting multiple files
    );
    print('resultsssss' + result.toString());
    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      print('resultssddddddddsss' + files.length.toString());

      for (int i = 0; i < files.length && i + index < _images.length; i++) {
        String mimeType = lookupMimeType(files[i].path)!;
        print('resultssxxxxsss' + mimeType);
        // final pickedFiles = await result.paths.map((path) => File(path!));
        if (mimeType.startsWith('image/')) {
          setState(() {
            _images[i + index] = files[i];
            // _imageFiles = files[i] as List<XFile>?;
          });
        }
      }
    }
  }

  Future<void> uploadImages() async {
    for (int i = 0; i < _images.length; i++) {
      print('image length: ${_images.length}');
      File? file = _images[i];
      if (file != null) {
        print('inside loop');
        final path = 'files/${file.path.split('/').last}';
        final ref = FirebaseStorage.instance.ref().child(path);
        uploadTask = ref.putFile(file);
        final snapshot = await uploadTask!.whenComplete(() {});
        print('after upload----------');
        String urlDownload = await snapshot.ref.getDownloadURL();

        _downloadUrls[i] = urlDownload;
      }
    }
    createPost(_downloadUrls[0], _downloadUrls[1], _downloadUrls[2]);
    print(
        'Download-Links: $_downloadUrls[0] + $_downloadUrls[1] + $_downloadUrls[2]');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
                  height: 400,
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
                                    controller: business_nameController,
                                    decoration: InputDecoration(
                                      hintText: 'business_name',
                                      hintStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 150, 148, 148),
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
                                    controller: descriptionController,
                                    decoration: InputDecoration(
                                      hintText: 'description',
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
                                      hintText: 'whatsapp',
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
                                    controller: mobileController,
                                    decoration: InputDecoration(
                                      hintText: 'mobile',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 100),
                                Flexible(
                                  child: TextField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      hintText: 'email',
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
                                    // keyboardType: TextInputType.number,
                                    controller: facebookController,
                                    decoration: InputDecoration(
                                      hintText: 'facebook',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 100),
                                Flexible(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: instaController,
                                    decoration: InputDecoration(
                                      hintText: 'insta',
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
                                    // keyboardType: TextInputType.number,
                                    controller: locationController,
                                    decoration: InputDecoration(
                                      hintText: 'location',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 100),
                                Flexible(
                                  child: TextField(
                                    // keyboardType: TextInputType.number,
                                    controller: notAvailable_daysController,
                                    decoration: InputDecoration(
                                      hintText: 'notAvailable_days',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 5),
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
                              // _selectImages();
                              addImage(0);
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
                          uploadImages();
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