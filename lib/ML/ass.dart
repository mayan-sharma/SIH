import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class ModelInference extends StatefulWidget {
  final File image;

  ModelInference({
    Key key,
    @required this.image,
  }) : super(key: key);

  @override
  _ModelInferenceState createState() => _ModelInferenceState();
}

class _ModelInferenceState extends State<ModelInference> {
  String res;
  List _recognitions;

  void initState() {
    super.initState();
    loadModel();
  }

  Future loadModel() async {
    res = await Tflite.loadModel(
        model: 'assets/Model/model.tflite',
        labels: 'assets/Model/lable_map.txt');

    print(res);
    await detectObject();
  }

  Future detectObject() async {
    var recognitions = await Tflite.detectObjectOnImage(
        path: widget.image.path,
        model: "SSDMobilenet",
        imageMean: 127.5,
        imageStd: 127.5,
        threshold: 0.2,
        numResultsPerClass: 2,
        asynch: true);

    setState(() {
      _recognitions = recognitions;
    });

    print(recognitions);
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
