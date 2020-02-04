import 'package:tflite/tflite.dart';

class ModelInference {
  String res;
  String filpath;

  Future loadModel() async {
    res = await Tflite.loadModel(
        model: 'assets/Model/model.tflite',
        labels: 'assets/Model/lable_map.txt');
  }

  Future detectObject() async {
    var recognitions = await Tflite.detectObjectOnImage(
        path: filpath,
        model: "SSDMobilenet",
        imageMean: 127.5,
        imageStd: 127.5,
        threshold: 0.4,
        numResultsPerClass: 2,
        asynch: true);
  }

  print(recognitions);
}
