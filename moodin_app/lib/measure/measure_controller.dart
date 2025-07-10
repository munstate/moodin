import 'measure_model.dart';
import 'package:flutter/material.dart';

class MeasureController extends ChangeNotifier {
  final MeasureModel model;

  MeasureController(this.model);

  void startMeasurement() { //측정 전
    model.isMeasuring = true;
    model.isDone = false;
    //model.state = MeasureState.measuring;
    notifyListeners();

    Future.delayed(const Duration(seconds: 5), () { //측정 후 , Duration = 측정 시작하고 n초 후에 완료 처리 (수정가능)
      model.isMeasuring = false;
      model.isDone = true;
      model.hrv = 30; //측정값을 예시로 넣어둔거라 나중에 수정해야함
      model.gsr = 57; //마찬가지
      //model.state = MeasureState.done;
      notifyListeners();
    });
  }
}
