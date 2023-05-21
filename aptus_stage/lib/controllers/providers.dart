import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EvaluProvider extends ChangeNotifier{

  bool _evalu = false;
  bool _creer = false;

  bool get evalu => _evalu;
  bool get creer => _creer;

  void setEvalu(newValue) {
    if(newValue){
          _evalu = newValue;
          _creer = false;
          notifyListeners();
    }
    else{
      _evalu = newValue;
      notifyListeners();
    }

  }

  void setCreer(newVal) {
    _creer = newVal;
    notifyListeners();
  }
}


