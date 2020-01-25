import 'package:flutter/material.dart';

void main() => runApp(NavBar());

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NOICE NOICE",
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black38,
          iconSize: 27.5,
          currentIndex: 1,
          selectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              title: Text("Upload"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border),
              title: Text("Track"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.description),
              title: Text("Something"),
            ),
          ],
        ),
      ),
    );
  }
}

class TrackRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text('TRACK')),
      ),
    );
  }
}

// class FirstRoute extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Heading',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Center(
//             child: Text("Futali"),
//           ),
//         ),
//         body: ,
//       ),
//     );
//   }
// }

// class SecondRoute extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Hello',
//       home: Scaffold(
//         appBar: AppBar(title: Center(child: Text("Second Page"))),
//         body: Text("Hello"),
//       ),
//     );
//   }
// }
