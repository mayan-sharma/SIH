import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String data;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    // For your reference print the AppDoc directory
    print(directory.path);
    return directory.path;
  }

  Future<File> _localFile() async {
    final path = await _localPath;
    return File('$path/data.txt');
  }

  Future readFile() async {
    try {
      final file = await _localFile();
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    readFile().then((value) {
      setState(() {
        data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        data ?? "no data available",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      )),
    );
  }
}
