import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroductionScreen(),
    );
  }
}

class IntroductionScreen extends StatefulWidget {
  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  final List<String> titles = ["Welcome to MyApp", "Features", "Get Started"];
  final List<String> descriptions = [
    "This is an awesome app!",
    "Discover amazing features!",
    "Let's get started!",
  ];
  final List<String> imagePaths = [
    "assets/welcome.png",
    "assets/features.png",
    "assets/get_started.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return buildIntroPage(titles[index], descriptions[index], imagePaths[index]);
        },
      ),
    );
  }

  Widget buildIntroPage(String title, String description, String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          height: 200,
        ),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          description,
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (_pageController.page! < titles.length - 1) {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AndroidPage()),
              );
            }
          },
          child: Text(_pageController.page! < titles.length - 1 ? "Next" : "Done"),
        ),
      ],
    );
  }
}

class AndroidPage extends StatelessWidget {
  final String constantInformation = 'Constant Information';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Android Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.android,
              size: 100,
              color: Colors.green,
            ),
            SizedBox(height: 40), // Adjust the height to move the icon higher
            Container(
              width: 250, // Adjust the width of the text box
              height: 50, // Adjust the height of the text box
              child: Marquee(
                text: constantInformation,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                blankSpace: 20.0, // Add space between the end and start of the text
                velocity: 100.0, // Adjust the scroll speed
                pauseAfterRound: Duration(seconds: 1), // Pause after each round of scrolling
                startPadding: 10.0, // Add padding at the beginning of the text
                accelerationDuration: Duration(seconds: 1), // Duration of acceleration
                accelerationCurve: Curves.linear, // Acceleration curve
                decelerationDuration: Duration(milliseconds: 500), // Duration of deceleration
                decelerationCurve: Curves.easeOut, // Deceleration curve
              ),
            ),
          ],
        ),
      ),
    );
  }
}
