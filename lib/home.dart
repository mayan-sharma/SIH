import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          titleSpacing: 0,
          flexibleSpace: Image(
            image: AssetImage('assets/images/AppBar_Background.png'),
            fit: BoxFit.cover,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          bottom: PreferredSize(
              child: Align(
                alignment: Alignment(-0.85, 1),
                child: Text(
                  "SpotHole",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.0,
                  ),
                ),
              ),
              preferredSize: Size.fromHeight(50)),
        ),
        body: Column(
          children: <Widget>[PotholesReported(), Carousel()],
        ),
      ),
    );
  }
}

class PotholesReported extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            elevation: 5,
            child: Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      "Potholes Reported",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage('assets/images/graph_Image.png'),
                  fit: BoxFit.fitWidth,
                  width: 250,
                  height: 300,
                ),
              )
            ])));
  }
}

class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 0.0),
        height: 180.0,
        child: ListView(
          // This next line does the trick.
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              child: Reports(),
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              child: Reports(),
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              child: Reports(),
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              child: Reports(),
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              child: Reports(),
            ),
          ],
        ));
  }
}

class Reports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(height: 50, width: 150),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[Text("19 Dec' 20"), Icon(Icons.more_vert)],
                )
              ],
            )));
  }
}
