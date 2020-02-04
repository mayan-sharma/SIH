import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class ModelInference extends StatefulWidget {
  @override
  _ModelInferenceState createState() => _ModelInferenceState();
}

class _ModelInferenceState extends State<ModelInference> {
  String res;
  List _recognitions;
  String filepath;

  Future loadModel() async {
    res = await Tflite.loadModel(
        model: 'assets/Model/model.tflite',
        labels: 'assets/Model/lable_map.txt');

    print(res);
  }

  Future detectObject() async {
    var recognitions = await Tflite.detectObjectOnImage(
        path: filepath,
        model: "SSDMobilenet",
        imageMean: 127.5,
        imageStd: 127.5,
        threshold: 0.4,
        numResultsPerClass: 2,
        asynch: true);

    setState(() {
      _recognitions = recognitions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.0),
      child: Text(
        _recognitions.toString(),
      ),
    );
  }
}
