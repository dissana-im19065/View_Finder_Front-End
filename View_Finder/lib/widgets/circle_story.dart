import 'package:flutter/material.dart';

class CircleStory extends StatelessWidget {
  const CircleStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(6.0),
      child: ClipOval(
        child: Image(
          height: 68,
          width: 68,
          image: NetworkImage(
              'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&w=800'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
