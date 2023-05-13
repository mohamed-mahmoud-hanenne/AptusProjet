import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EvaluProvider extends ChangeNotifier{

  bool _evalu = false;


  bool get evalu => _evalu;

  void setEvalu(newValue) {
    _evalu = newValue;
     notifyListeners();
  }
}


class EvaluParametres extends ChangeNotifier{

  bool _evaluParam = false;


  bool get evaluParam => _evaluParam;

  void setEvalu(newValue) {
    _evaluParam = newValue;
     notifyListeners();
  }
}