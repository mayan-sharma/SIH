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
    detectObject();
  }

  Future loadModel() async {
    res = await Tflite.loadModel(
      model: 'assets/Model/model.tflite',
      labels: 'assets/Model/lable_map.txt',
      numThreads: 1,
    );

    print('peepoo');
    print(res);
  }

  Future detectObject() async {
    await loadModel();

    // print(widget.image.path);

    var recognitions = await Tflite.detectObjectOnImage(
      path:
          "/storage/emulated/0/Download/images.jpeg", // /storage/emulated/0/DCIM/Camera/IMG_20200204_232136.jpg
      model: "SSDMobilenet",
      imageMean: 127.5,
      imageStd: 127.5,
      threshold: 0.2,
      numResultsPerClass: 1,
    );
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
