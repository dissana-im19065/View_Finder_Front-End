import 'package:flutter/material.dart';
import 'package:login/News_feed/login_screen.dart';
import 'package:login/market/marketMain.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  // building the indicators
  List<Widget> buildIndicators() {
    List<Widget> list = [];
    for (int i = 0; i < 4; i++) {
      list.add(i == 1 ? indicator(true) : indicator(false));
    }
    return list;
  }

  Widget indicator(bool isActive) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      duration: const Duration(microseconds: 150),
      height: 8.0,
      width: isActive ? 30.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // image transition
          Positioned(
            top: -10,
            left: -150,
            child: Row(
              children: const [
                // ImageListView(startIndex: 0),
                // ImageListView(startIndex: 1),
                // ImageListView(startIndex: 2),
              ],
            ),
          ),

          // title
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            child: const Text(
              "MNMLMANDI",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          // information screen
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.60,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.white60,
                    Colors.white,
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your Appearance \nShows Your Quality",
                    // style: kNormalStyle.copyWith(
                    //   fontSize: 30,
                    //   fontWeight: FontWeight.bold,
                    // ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Change The Quality Of Your \n Appearance with MNMLMANDI",
                    // style: kNormalStyle.copyWith(
                    //   color: Colors.grey,
                    //   fontWeight: FontWeight.w400,
                    //   height: 1.5,
                    // ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: buildIndicators(),
                  ),
                ],
              ),
            ),
          ),

          // bottom button
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Market(),
                  ),
                ),
                child: const Text("Sign Up with Email"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
