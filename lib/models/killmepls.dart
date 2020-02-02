import 'dart:io';
import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PotholeData {
  final CollectionReference potholeCollection =
      Firestore.instance.collection('Pothole');

  String position;
  DateTime time;
  bool status;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }

  Future<File> _localFile(String documentID) async {
    // TODO: store every potholeData at documentID's location
    final path = await _localPath;
    return File('$path/data.txt');
  }

  Future updateData(String position, DateTime time, bool status) async {
    var data = {'positon': position, 'report_time': time, 'status': status};

    return await potholeCollection.add(data).then((ref) {
      writeToLocal(ref.documentID, position, time, status);
    }).catchError((error) {
      print(error);
    });
  }

  Future writeToLocal(
      String documentID, String position, DateTime time, bool status) async {
    final file = await _localFile(documentID);
    return file.writeAsString({
      "document_id": documentID,
      "positon": position,
      "report_time": time,
      "status": status
    }.toString());
  }
}
