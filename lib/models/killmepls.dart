import 'package:cloud_firestore/cloud_firestore.dart';

class PotholeData {
  final CollectionReference potholeCollection =
      Firestore.instance.collection('Pothole');

  String position;
  DateTime time;
  bool status;

  Future updateData(String position, DateTime time, bool status) async {
    var data = {'positon': position, 'report_time': time, 'status': status};

    return await potholeCollection.add(data).then((ref) {
      print(ref.documentID);
    }).catchError((error) {
      print(error);
    });
  }
}
