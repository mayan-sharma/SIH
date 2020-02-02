import 'package:flutter/material.dart';

import 'home.dart';
import 'report.dart';
import 'profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

 
final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
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
    Report(),
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
