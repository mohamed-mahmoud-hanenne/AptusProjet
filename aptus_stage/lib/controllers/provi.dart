import 'package:flutter/material.dart';
class EvaluParametres extends ChangeNotifier{

  bool _evaluParam = false;


  bool get evaluParam => _evaluParam;

  void setEvalu(newValue) {
    _evaluParam = newValue;
     notifyListeners();
  }
}