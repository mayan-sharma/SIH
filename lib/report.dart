import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

class Report extends StatefulWidget {
  final CameraDescription camera;

  const Report({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  CameraController _controller;
  Future<void> _initializeControllerFuture;

  File _image;
  Position _currentPosition;
  String _currentAddress; // Naman knows

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  Future<File> startCamera() async {
    await _initializeControllerFuture;

    final path = join(
      (await getTemporaryDirectory()).path,
      '${DateTime.now()}.png',
    );

    await _controller.takePicture(path);
    return File(path);
  }

  Future getImageAndLocation() async {
    File image;
    Position position;

    image = await startCamera();
    position = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    setState(() {
      _image = image;
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
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
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
                onPressed: () {
                  getImageAndLocation();
                },
              ),
              Text(
                'Click a picture',
                style: TextStyle(color: Colors.white),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 3,
                child: FutureBuilder<void>(
                  future: _initializeControllerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // If the Future is complete, display the preview.
                      return CameraPreview(_controller);
                    } else {
                      // Otherwise, display a loading indicator.
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
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
                      "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}",
                      style: TextStyle(color: Colors.white),
                    ),
              _currentAddress == null
                  ? Container()
                  : Text(
                      _currentAddress,
                      style: TextStyle(color: Colors.white),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
