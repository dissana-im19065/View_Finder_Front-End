import 'package:flutter/material.dart';

class CircleStory extends StatelessWidget {
  const CircleStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 0),
      child: ClipOval(
        child: Image(
          height: 88,
          width: 88,
          image: NetworkImage(
              'https://www.islandcricket.lk/wp-content/uploads/2020/02/mendis_fernado_srilanka1-min.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
