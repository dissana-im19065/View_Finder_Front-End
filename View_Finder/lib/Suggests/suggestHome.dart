// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:login/widgets/post_cart.dart';

import '../News_feed/home_screen.dart';
import '../Suggests/suggests.dart';
import '../screens/main_screen.dart';
// import 'package:login/widgets/story_widget.dart';

class suggestScreen extends StatefulWidget {
  suggestScreen({Key? key}) : super(key: key);

  @override
  State<suggestScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<suggestScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10),
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
                        setState(() {
                          Suggest = 'Wedding';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => suggestScreen()),
                        );
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
                        setState(() {
                          Suggest = 'Wild Life';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => suggestScreen()),
                        );
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
                        setState(() {
                          Suggest = 'Nikon';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => suggestScreen()),
                        );
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
                        setState(() {
                          Suggest = 'Canon';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => suggestScreen()),
                        );
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
                        setState(() {
                          Suggest = 'Sony';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => suggestScreen()),
                        );
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
                        setState(() {
                          Suggest = 'fuji';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => suggestScreen()),
                        );
                      },
                      child: Text('fuji'),
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
                        setState(() {
                          Suggest = 'Camera Lences';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => suggestScreen()),
                        );
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
                        setState(() {
                          Suggest = 'Repair Your Camera';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => suggestScreen()),
                        );
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
                        setState(() {
                          Suggest = 'Lens Coatings';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => suggestScreen()),
                        );
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
                        setState(() {
                          Suggest = 'For Beginners';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => suggestScreen()),
                        );
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
                        setState(() {
                          Suggest = 'Lens Filters';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => suggestScreen()),
                        );
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
                        setState(() {
                          Suggest = 'Lens coatings';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => suggestScreen()),
                        );
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
                        setState(() {
                          Suggest = 'For Rent';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => suggestScreen()),
                        );
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
                        setState(() {
                          Suggest = 'Locations';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => suggestScreen()),
                        );
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
                        setState(() {
                          Suggest = 'Drone Fly';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => suggestScreen()),
                        );
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
                        setState(() {
                          Suggest = 'MakeUp Artist';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => suggestScreen()),
                        );
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
                        setState(() {
                          Suggest = 'Macro Photography';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => suggestScreen()),
                        );
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
                        setState(() {
                          Suggest = 'Street photography';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => suggestScreen()),
                        );
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
                        setState(() {
                          Suggest = 'Mobile Photography';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => suggestScreen()),
                        );
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
                        setState(() {
                          Suggest = 'MODELS';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => suggestScreen()),
                        );
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
                        setState(() {
                          Suggest = 'Event photography';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => suggestScreen()),
                        );
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
                        setState(() {
                          Suggest = 'Camera Lences';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => suggestScreen()),
                        );
                      },
                      child: Text('Camera Lences'),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(height: 20),
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
      body: Stack(
        children: [
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
                  return SuggestCart();
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 350, top: 710),
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
    );
  }
}
