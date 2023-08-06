import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:login/screens/main_screen.dart';

import '../profiles/profile_scree.dart';
import '../login_page.dart';

class ReviewFormPopup extends StatefulWidget {
  @override
  _ReviewFormPopupState createState() => _ReviewFormPopupState();
}

class _ReviewFormPopupState extends State<ReviewFormPopup> {
  final TextEditingController _reviewController = TextEditingController();
  double _currentRating = 0;

  Future<void> _submitReview() async {
    final url = Uri.parse('http://192.168.184.206:3000/api/users/rev');
    try {
      final response = await http.post(
        url,
        body: jsonEncode({
          'count': _currentRating,
          'review': _reviewController.text,
          'reviewer_id': userId,
          "profile_id": 55,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 201) {
        print('Review submitted successfully!');
        // Do something after successful review submission
      } else {
        print('Error submitting review: ${response.statusCode}');
      }
    } catch (error) {
      print('Error submitting review: $error');
    }
  }

  void showReviewAddedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: AlertDialog(
            title: Center(child: Text('  Your review was added')),
            content: Row(
              children: [
                SizedBox(height: 130),
                Icon(Icons.check, color: Colors.green, size: 90),
                SizedBox(width: 12),
                Text('Thank you for your review!'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                  );
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RatingBar.builder(
                initialRating: _currentRating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _currentRating = rating;
                  });
                },
              ),
              TextField(
                controller: _reviewController,
                decoration: InputDecoration(labelText: 'Add Review'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _submitReview();
                  showReviewAddedDialog(context);
                },
                child: Text('Submit Review'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => ReviewFormPopup(),
              );
            },
            child: Text('Add Review'),
          ),
        ),
      ),
    );
  }
}
































// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:http/http.dart' as http;

// class MyReviewForm extends StatefulWidget {
//   @override
//   _MyReviewFormState createState() => _MyReviewFormState();
// }

// class _MyReviewFormState extends State<MyReviewForm> {
//   final TextEditingController _reviewController = TextEditingController();
//   double _currentRating = 0;

//   Future<void> _submitReview() async {
//     final url = Uri.parse('http://192.168.105.206:3000/api/users/rev');
//     try {
//       final response = await http.post(
//         url,
//         body: jsonEncode({
//           'rating': _currentRating,
//           'review': _reviewController.text,
//         }),
//         headers: {'Content-Type': 'application/json'},
//       );
//       if (response.statusCode == 201) {
//         print('Review submitted successfully!');
//         // Do something after successful review submission
//       } else {
//         print('Error submitting review: ${response.statusCode}');
//       }
//     } catch (error) {
//       print('Error submitting review: $error');
//     }
//   }

//   @override
//   void dispose() {
//     _reviewController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Review Form'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               RatingBar.builder(
//                 initialRating: _currentRating,
//                 minRating: 1,
//                 direction: Axis.horizontal,
//                 allowHalfRating: true,
//                 itemCount: 5,
//                 itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//                 itemBuilder: (context, _) => Icon(
//                   Icons.star,
//                   color: Colors.amber,
//                 ),
//                 onRatingUpdate: (rating) {
//                   setState(() {
//                     _currentRating = rating;
//                   });
//                 },
//               ),
//               TextField(
//                 controller: _reviewController,
//                 decoration: InputDecoration(labelText: 'Review'),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _submitReview,
//                 child: Text('Submit Review'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
