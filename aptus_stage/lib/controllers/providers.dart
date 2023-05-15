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


