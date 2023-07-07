// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:login/News_feed/login_screen.dart';
import 'package:login/widgets/circle_story.dart';


class ProfileScreen extends StatelessWidget {
  // final List _stories = ['story 1', 'story 2', 'story 3', 'story 4', 'story 5'];

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            title: const Text(
              'Rusiru Dissanayake',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.add_box_outlined,
                      size: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.table_rows_rounded,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          backgroundColor: Colors.black,
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 5.0, left: 10),
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
                            style: TextStyle(color: Colors.white, fontSize: 15),
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
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //////////////////////////////////////////////////////////////////////
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, top: 10),
                    child: Text(
                      'Rusiru Dissanayake',
                      style: TextStyle(
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
                    padding: EdgeInsets.only(left: 8.0, top: 3),
                    child: Text(
                      'I welcome you to my profile please do not stalk me',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              //////////////////////////////////////////////////////////
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 17, right: 8),
                    child: Container(
                      height: 45,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade700,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(
                          child: Text(
                        'Edit Profile',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 9.0, top: 17, right: 5),
                      child: Container(
                        height: 45,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade700,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                          child: Icon(
                            Icons.person_add,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ],
              ),
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
                        children: const [
                          SizedBox(
                            height: 50,
                          ),
                          Icon(
                            Icons.person_add,
                            color: Colors.white,
                            size: 60,
                          ),
                          Text(
                            "Photos and videos of you",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
