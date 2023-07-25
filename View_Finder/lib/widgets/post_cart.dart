// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, unused_local_variable, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings, prefer_final_fields, unused_field, must_be_immutable, avoid_print, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login/login_page.dart';
import 'package:login/widgets/circle_story.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class Post {
  final int userId;
  final String firstName;
  final String lastName;
  final int postId;
  final String imageUrl;
  final String description;
  final int likecount;

  Post(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.postId,
      required this.imageUrl,
      required this.description,
      required this.likecount});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['user_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      postId: json['post_id'],
      imageUrl: json['image_url'],
      description: json['description'],
      likecount: json['like_count'],
    );
  }
}

//int user_Id = 0;

Future<List<Post>> fetchPosts() async {
  final response =
      await http.get(Uri.parse('http://192.168.124.206:3000/api/users/post'));

  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    print(responseData);

    final parsed =
        jsonDecode(response.body)['data'].cast<Map<String, dynamic>>();
    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  } else {
    throw Exception('Failed to fetch posts');
  }
}

class PostListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: fetchPosts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print("sss" + snapshot.data!.toString());
          final posts = snapshot.data!;
          posts.shuffle(); // Shuffle the list of posts randomly
          return Column(
            children: posts.map((post) => PostWidget(post: post)).toList(),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
////////////////////////////////////////////////////////////////////////////// like

void like(int postId) async {
  // Define the API endpoint URL
  final url = Uri.parse('http://192.168.124.206:3000/api/users/like');

  // Define the request headers (if any)
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // Define the request body as a JSON-encoded string
  final body = {
    'user_id': userId,
    'post_id': postId,
  };
  final jsonBody = json.encode(body);

  // Send the POST request to the API endpoint
  final response = await http.post(url, headers: headers, body: jsonBody);

  // Handle the response
  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    // likeCount = responseData['data']['like_count'];
    print('like added successfully!');
  } else {
    print('Failed to like post: ${response.body}');
  }
}
///////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////// unlike

void unlike(int postId) async {
  // Define the API endpoint URL
  final url = Uri.parse('http://192.168.124.206:3000/api/users/unlike');

  // Define the request headers (if any)
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // Define the request body as a JSON-encoded string
  final body = {
    'post_id': postId,
  };
  final jsonBody = json.encode(body);

  // Send the POST request to the API endpoint
  final response = await http.post(url, headers: headers, body: jsonBody);

  // Handle the response
  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    // likeCount = responseData['data']['like_count'];
    print('like removed successfully!');
  } else {
    print('Failed to remove like : ${response.body}');
  }
}

//////////////////////////////////////////////////////////////////////////////

class PostWidget extends StatefulWidget {
  final Post post;

  PostWidget({required this.post});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool _isLiked = false;

  int _likeCount = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 0, 0, 0),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 5),
                    child:
                        SizedBox(height: 55, width: 55, child: CircleStory()),
                  ),

                  // Text(
                  //   'Rusiru Dissanayake',
                  //   style: TextStyle(color: Colors.white, fontSize: 15),
                  // )
                ],
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 12.0,
                    top: 10,
                  ),
                  child: Text(
                    widget.post.firstName + '  ' + widget.post.lastName,
                    style: GoogleFonts.alegreyaSans(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    // child: SizedBox(height: 55, width: 55, child: CircleStory()),
                  ),
                  // SizedBox(
                  //   width: 3,
                  // ),
                ],
              ),
            ],
          ),

          ///////////////////////////////////////////////////////////////////////////////////////////////////////////

          Image.network(widget.post.imageUrl),
          // Text(
          //   post.description,
          //   style: GoogleFonts.russoOne(
          //       fontWeight: FontWeight.bold,
          //       color: const Color.fromARGB(255, 255, 255, 255)),
          // ),

          ///////////////////////////////////////////////////////////////////////////////////////////////////////////

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 171.0, top: 4),
                      child: IconButton(
                        icon: Icon(
                          _isLiked ? Icons.favorite : Icons.favorite_border,
                          color: _isLiked ? Colors.red : Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          if (!_isLiked) {
                            like(widget.post.postId);
                          } else {
                            unlike(widget.post.postId);
                          }

                          setState(() {
                            // toggle the like status
                            _isLiked = !_isLiked;
                            // update the like count
                            _likeCount += _isLiked ? 1 : -1;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 140.0, top: 4),
                      child: Icon(
                        Icons.chat_bubble_outline_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(left: 13.0),
                    //   child: Icon(
                    //     Icons.near_me_outlined,
                    //     color: Colors.white,
                    //     size: 30,
                    //   ),
                    // )
                  ],
                ),
                // const Icon(
                //   Icons.bookmark_border,
                //   color: Colors.white,
                //   size: 30,
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "123 likes",
                  style: GoogleFonts.alegreyaSans(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                widget.post.description,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: Row(
              children: [
                Text(
                  '54 comments',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 232, 232, 232)),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.grey,
            thickness: 0.15,
          ),
        ],
      ),
    );
  }
}

class PostCart extends StatelessWidget {
  const PostCart({Key? key})
      : super(key: key); //const PostCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Post post;
    return Column(
      children: [
        /////////////////////////////////////////////////////////////////////

        ///////////////////////////////////////////////////////////////////////////

        PostListWidget(),

        //////////////////////////////////////////////////////////////////////////
      ],
    );
  }
}
