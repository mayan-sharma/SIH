import 'package:flutter/material.dart';
import 'home.dart';
import 'report.dart';
import 'profile.dart';

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
          iconSize: 20,
          onTap: onTapped,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline), title: Text('Report')),
            BottomNavigationBarItem(
                icon: Icon(Icons.portrait), title: Text('Profile')),
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
