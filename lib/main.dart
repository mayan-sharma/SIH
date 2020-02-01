import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'home.dart';
import 'report.dart';
import 'profile.dart';

CameraDescription camera;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  camera = cameras.first;

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int currentIndex = 0;
  final List<Widget> children = [
    Home(),
    Report(camera: camera),
    Profile(),
  ];

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: children[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          iconSize: 20,
          onTap: onTapped,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                ),
                title: Text(
                  'Report',
                  style: TextStyle(color: Colors.white),
                )),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.portrait,
                color: Colors.white,
              ),
              title: Text(
                'Profile',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  void onTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
