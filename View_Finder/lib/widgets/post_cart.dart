// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, unused_local_variable, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings

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

  Post({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.postId,
    required this.imageUrl,
    required this.description,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['user_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      postId: json['post_id'],
      imageUrl: json['image_url'],
      description: json['description'],
    );
  }
}

Future<List<Post>> fetchPosts() async {
  final response =
      await http.get(Uri.parse('http://192.168.189.206:3000/api/users/post'));

  if (response.statusCode == 200) {
    final parsed =
        jsonDecode(response.body)['data'].cast<Map<String, dynamic>>();
    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  } else {
    throw Exception('Failed to fetch posts');
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////

class PostListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: fetchPosts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
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

//////////////////////////////////////////////////////////////////////////////

class PostWidget extends StatelessWidget {
  final Post post;

  PostWidget({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 165.0, top: 0),
                    child:
                        SizedBox(height: 75, width: 75, child: CircleStory()),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  // Text(
                  //   'Rusiru Dissanayake',
                  //   style: TextStyle(color: Colors.white, fontSize: 15),
                  // )
                ],
              ),
              Center(
                child: const Padding(
                  padding:
                      EdgeInsets.only(right: 10.0, top: 20.0, bottom: 20.0),
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40, bottom: 10),
                    // child: SizedBox(height: 55, width: 55, child: CircleStory()),
                  ),
                  // SizedBox(
                  //   width: 3,
                  // ),
                  Text(
                    post.firstName + '  ' + post.lastName,
                    style: GoogleFonts.alegreyaSans(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                ],
              ),
            ],
          ),

          ///////////////////////////////////////////////////////////////////////////////////////////////////////////

          Image.network(post.imageUrl),
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
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 182.0, top: 4),
                      child: Icon(
                        Icons.favorite_outline_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 150.0, top: 4),
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
            padding: const EdgeInsets.only(left: 0.0, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '133 likes',
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
                post.description,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Text(
                  'view 54 comments',
                  style: TextStyle(color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 2),
            child: Row(
              children: [
                Text(
                  '2 days ago',
                  style: TextStyle(color: Colors.grey.shade500),
                ),
              ],
            ),
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
