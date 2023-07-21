// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/circle_story.dart';

class CusProfileScreen extends StatelessWidget {
  // final List _stories = ['story 1', 'story 2', 'story 3', 'story 4', 'story 5'];

  CusProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Container(
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
                            builder: (context) => CusProfileScreen(),
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: CircleStory(),
                          ),
                        ],
                      ),
                      //////////////////////////////////////////////////////////////////////
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              'KUSAL MENDIS',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 30),
                            child: Text(
                              'I welcome you to my profile',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      //////////////////////////////////////////////////////////

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
                      SizedBox(height: 50),
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          // controller: descriptionController,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'ADD TO WALL',
                            labelStyle: TextStyle(color: Colors.white),
                            hintText: 'I am Seeking For',
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 30.0, horizontal: 20.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
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

                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('POST'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(104, 70, 68, 68),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(85.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.calendar_today_sharp,
                          color: Colors.white,
                          size: 70,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CusProfileScreen()),
                          );
                          // navigate to register page
                        },
                        child: Text(
                          'Check My Calenda®',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.storefront,
                          color: Colors.white,
                          size: 70,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CusProfileScreen()),
                          );
                          // navigate to register page
                        },
                        child: Text(
                          'Ma®ket place',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 150),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
