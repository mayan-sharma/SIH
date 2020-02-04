import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'services/killmepls.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  File _image;
  Position _currentPosition;
  String _currentAddress; // Naman knows

  PotholeData potholeData = PotholeData();

  Future sendData() async {
    await getImage();

    try {
      return await potholeData.updateData(
          _currentPosition.toString(), DateTime.now(), false);
    } catch (e) {
      print(e.toString());
    }
  }

  Future getImage() async {
    File image;
    image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
    await getLocation();
  }

  Future getLocation() async {
    Position position;
    position = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    setState(() {
      _currentPosition = position;
    });
    await getAddressFromLatLng();
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
                onPressed: sendData,
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
              Text(
                _currentPosition == null
                    ? "Location not available"
                    : "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                _currentAddress == null
                    ? "Address not available"
                    : _currentAddress,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
