// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:login/widgets/post_cart.dart';
// import 'package:login/widgets/story_widget.dart';

String Suggest = '';

class HomeScreen extends StatelessWidget {
  // final List _stories = ['story 1', 'story 2', 'story 3', 'story 4', 'story 5', 'story 6', 'story 7', 'story 8', 'story 9', 'story 10'];
  final List _posts = [
    'post 1',
    'post 2',
    'post 3',
    'post 4',
    'post 5',
    'post 6',
    'post 7',
    'post 8',
    'post 9',
    'post 10'
  ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 55,
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
                  height: 70,
                  width: 180,
                  child: Image(image: AssetImage('images/logo.png')),
                ),
              ],
            ),
            // Container(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       SizedBox(
            //         height: 35,
            //         width: 100,
            //         child: ElevatedButton(
            //           style: ButtonStyle(
            //             backgroundColor:
            //                 MaterialStateProperty.all<Color>(Color.fromRGBO(
            //               76,
            //               175,
            //               80,
            //               1,
            //             )), // Set the background color of the button
            //           ),
            //           onPressed: () {},
            //           child: Text('Location',
            //               style: const TextStyle(
            //                   fontSize: 15,
            //                   fontWeight: FontWeight.bold,
            //                   color: Color.fromARGB(255, 255, 255, 255))),
            //         ),
            //       ),
            //       SizedBox(width: 15),
            //       SizedBox(
            //         height: 35,
            //         width: 100,
            //         child: ElevatedButton(
            //           style: ButtonStyle(
            //             backgroundColor:
            //                 MaterialStateProperty.all<Color>(Color.fromRGBO(
            //               76,
            //               175,
            //               80,
            //               1,
            //             )), // Set the background color of the button
            //           ),
            //           onPressed: () {},
            //           child: Text('Category',
            //               style: const TextStyle(
            //                   fontSize: 15,
            //                   fontWeight: FontWeight.bold,
            //                   color: Color.fromARGB(255, 255, 255, 255))),
            //         ),
            //       ),
            //       SizedBox(width: 15),
            //       SizedBox(
            //         height: 35,
            //         width: 100,
            //         child: ElevatedButton(
            //           style: ButtonStyle(
            //             backgroundColor:
            //                 MaterialStateProperty.all<Color>(Color.fromRGBO(
            //               76,
            //               175,
            //               80,
            //               1,
            //             )), // Set the background color of the button
            //           ),
            //           onPressed: () {},
            //           child: Text('Category',
            //               style: const TextStyle(
            //                   fontSize: 15,
            //                   fontWeight: FontWeight.bold,
            //                   color: Color.fromARGB(255, 255, 255, 255))),
            //         ),
            //       ),
            //       SizedBox(width: 15),
            //       SizedBox(
            //         height: 35,
            //         width: 100,
            //         child: ElevatedButton(
            //           style: ButtonStyle(
            //             backgroundColor:
            //                 MaterialStateProperty.all<Color>(Color.fromRGBO(
            //               76,
            //               175,
            //               80,
            //               1,
            //             )), // Set the background color of the button
            //           ),
            //           onPressed: () {},
            //           child: Text('Category',
            //               style: const TextStyle(
            //                   fontSize: 15,
            //                   fontWeight: FontWeight.bold,
            //                   color: Color.fromARGB(255, 255, 255, 255))),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    SizedBox(width: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color.fromRGBO(
                          76,
                          175,
                          80,
                          1,
                        )), // Set the background color of the button
                      ),
                      onPressed: () {
                        Suggest = 'Wedding';
                      },
                      child: Text('Wedding'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color.fromRGBO(
                          76,
                          175,
                          80,
                          1,
                        )), // Set the background color of the button
                      ),
                      onPressed: () {
                        Suggest = 'Wild Life';
                      },
                      child: Text('Wild Life'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color.fromRGBO(
                          76,
                          175,
                          80,
                          1,
                        )), // Set the background color of the button
                      ),
                      onPressed: () {
                        Suggest = 'Nikon';
                      },
                      child: Text('Nikon'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color.fromRGBO(
                          76,
                          175,
                          80,
                          1,
                        )), // Set the background color of the button
                      ),
                      onPressed: () {
                        Suggest = 'Canon';
                      },
                      child: Text('Canon'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color.fromRGBO(
                          76,
                          175,
                          80,
                          1,
                        )), // Set the background color of the button
                      ),
                      onPressed: () {
                        Suggest = 'Sony';
                      },
                      child: Text('Sony'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color.fromRGBO(
                          76,
                          175,
                          80,
                          1,
                        )), // Set the background color of the button
                      ),
                      onPressed: () {
                        Suggest = 'Camera Lences';
                      },
                      child: Text('Camera Lences'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color.fromRGBO(
                          76,
                          175,
                          80,
                          1,
                        )), // Set the background color of the button
                      ),
                      onPressed: () {
                        Suggest = 'Repair Your Camera';
                      },
                      child: Text('Repair Your Camera'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color.fromRGBO(
                          76,
                          175,
                          80,
                          1,
                        )), // Set the background color of the button
                      ),
                      onPressed: () {
                        Suggest = 'Lens Coatings';
                      },
                      child: Text('Lens Coatings'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color.fromRGBO(
                          76,
                          175,
                          80,
                          1,
                        )), // Set the background color of the button
                      ),
                      onPressed: () {
                        Suggest = 'For Beginners';
                      },
                      child: Text('For Beginners'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color.fromRGBO(
                          76,
                          175,
                          80,
                          1,
                        )), // Set the background color of the button
                      ),
                      onPressed: () {
                        Suggest = 'Lens Filters';
                      },
                      child: Text('Lens Filters'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color.fromRGBO(
                          76,
                          175,
                          80,
                          1,
                        )), // Set the background color of the button
                      ),
                      onPressed: () {
                        Suggest = 'Lens coatings';
                      },
                      child: Text('Lens coatings'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color.fromRGBO(
                          76,
                          175,
                          80,
                          1,
                        )), // Set the background color of the button
                      ),
                      onPressed: () {
                        Suggest = 'For Rent';
                      },
                      child: Text('For Rent'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color.fromRGBO(
                          76,
                          175,
                          80,
                          1,
                        )), // Set the background color of the button
                      ),
                      onPressed: () {
                        Suggest = 'Locations';
                      },
                      child: Text('Locations'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color.fromRGBO(
                          76,
                          175,
                          80,
                          1,
                        )), // Set the background color of the button
                      ),
                      onPressed: () {
                        Suggest = 'Drone Fly';
                      },
                      child: Text('Drone Fly'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color.fromRGBO(
                          76,
                          175,
                          80,
                          1,
                        )), // Set the background color of the button
                      ),
                      onPressed: () {
                        Suggest = 'MakeUp Artist';
                      },
                      child: Text('MakeUp Artist'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color.fromRGBO(
                          76,
                          175,
                          80,
                          1,
                        )), // Set the background color of the button
                      ),
                      onPressed: () {
                        Suggest = 'Macro Photography';
                      },
                      child: Text('Macro Photography'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color.fromRGBO(
                          76,
                          175,
                          80,
                          1,
                        )), // Set the background color of the button
                      ),
                      onPressed: () {
                        Suggest = 'Street photography';
                      },
                      child: Text('Street photography'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color.fromRGBO(
                          76,
                          175,
                          80,
                          1,
                        )), // Set the background color of the button
                      ),
                      onPressed: () {
                        Suggest = 'Mobile Photography';
                      },
                      child: Text('Mobile Photography'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color.fromRGBO(
                          76,
                          175,
                          80,
                          1,
                        )), // Set the background color of the button
                      ),
                      onPressed: () {
                        Suggest = 'MODELS';
                      },
                      child: Text('MODELS'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color.fromRGBO(
                          76,
                          175,
                          80,
                          1,
                        )), // Set the background color of the button
                      ),
                      onPressed: () {
                        Suggest = 'Event photography';
                      },
                      child: Text('Event photography'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color.fromRGBO(
                          76,
                          175,
                          80,
                          1,
                        )), // Set the background color of the button
                      ),
                      onPressed: () {
                        Suggest = 'Camera Lences';
                      },
                      child: Text('Camera Lences'),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ),
        ),
        // actions: [
        //   Row(
        //     children: const [
        //       // Padding(
        //       //   padding: EdgeInsets.all(8.0),
        //       //   child: Icon(
        //       //     Icons.add_box_outlined,
        //       //     size: 30,
        //       //   ),
        //       // ),
        //       Padding(
        //         padding: EdgeInsets.all(8.0),
        //         child: Icon(
        //           Icons.favorite_outline_rounded,
        //           size: 30,
        //         ),
        //       ),
        //       Padding(
        //         padding: EdgeInsets.all(8.0),
        //         child: Icon(
        //           Icons.energy_savings_leaf_outlined,
        //           size: 30,
        //         ),
        //       ),
        //     ],
        //   )
        // ],
      ),
      body: Column(
        children: [
          Divider(
            color: Colors.grey,
            thickness: 0.25,
          ),
          Container(
            color: Color.fromARGB(255, 0, 0, 0),
            height: 15,
            width: MediaQuery.of(context).size.width,
          ),
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
          Container(
            color: const Color.fromARGB(255, 0, 0, 0),
            height: 1,
            width: MediaQuery.of(context).size.width,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _posts.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return PostCart();
                }),
          ),
        ],
      ),
    );
  }
}
