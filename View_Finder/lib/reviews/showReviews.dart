// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login/profiles/profile_scree.dart';
import 'package:login/login_page.dart';

import 'addReview.dart';

class ReviewsScreen extends StatefulWidget {
  ReviewsScreen({Key? key}) : super(key: key);

  @override
  _ReviewsScreenState createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  List<Map<String, dynamic>> _reviews = [];

  @override
  void initState() {
    super.initState();
    _fetchReviews();
  }

  Future<void> _fetchReviews() async {
    final url = 'http://192.168.184.206:3000/api/users/revv';

    final headers = {'Content-Type': 'application/json'};

    final userData = {
      'profile_id': 55,
    };

    final jsonData = json.encode(userData);

    final response =
        await http.post(Uri.parse(url), headers: headers, body: jsonData);

    try {
      if (response.statusCode == 200) {
        print(response.body);
        final jsonResponse = jsonDecode(response.body);
        final data = jsonResponse['data'];
        setState(() {
          _reviews = List<Map<String, dynamic>>.from(data);
        });
      } else {
        print('Error fetching reviews: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching reviews: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
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
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 25,
              ),
              Text(
                "Reviews",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
      body: Stack(children: [
        Container(
          child: _reviews.isNotEmpty
              ? ListView.builder(
                  itemCount: _reviews.length,
                  itemBuilder: (BuildContext context, int index) {
                    final review = _reviews[index];
                    final rating = review['count'].toDouble();
                    final reviewText = review['review'];
                    return Column(
                      children: [
                        Container(
                          height: 140,
                          width: 500,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 166, 167, 168),
                          ),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  SizedBox(height: 18),
                                  Container(
                                    child: Text(
                                      "Added By : " + "User Name",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  RatingBar.builder(
                                    itemSize: 35,
                                    initialRating: rating,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 2.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    child: Flexible(
                                      child: Text(
                                        reviewText,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                      ],
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 350, top: 730),
          child: FloatingActionButton(
            elevation: 0.0, // Removes the border or elevation
            highlightElevation: 0.0,

            backgroundColor: Colors.green,

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReviewFormPopup()),
              );
            },
            child: Icon(Icons.add,
                size: 40, color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 730),
          child: FloatingActionButton(
            elevation: 0.0, // Removes the border or elevation
            highlightElevation: 0.0,

            backgroundColor: Colors.green,

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            child: Icon(Icons.home,
                size: 40, color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
      ]),
    );
  }
}
