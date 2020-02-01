import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  File _image;
  Position _currentPosition;
  String _currentAddress; // Naman knows

  Future getImage() async {
    File image;
    image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
    getLocation();
  }

  Future getLocation() async {
    Position position;
    position = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    setState(() {
      _currentPosition = position;
    });
    getAddressFromLatLng();
  }

  Future getAddressFromLatLng() async {
    List<Placemark> p = await geolocator.placemarkFromCoordinates(
        _currentPosition.latitude, _currentPosition.longitude);
    Placemark place = p[0];
    setState(() {
      _currentAddress =
          "${place.locality}, ${place.postalCode}, ${place.country}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.camera_alt, color: Colors.white),
                onPressed: getImage,
              ),
              Text(
                'Click a picture',
                style: TextStyle(color: Colors.white),
              ),
              _image == null
                  ? Container()
                  : Image.file(
                      _image,
                      height: 300.0,
                      width: 300.0,
                    ),
              _currentPosition == null
                  ? Container()
                  : Text(
                      "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}"),
              _currentAddress == null ? Container() : Text(_currentAddress),
            ],
          ),
        ),
      ),
    );
  }
}
