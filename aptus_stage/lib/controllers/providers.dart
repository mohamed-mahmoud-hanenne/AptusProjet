import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EvaluProvider extends ChangeNotifier{

  bool _evalu = false;
  bool _creer = false;
  bool _edit = false;
  bool _radioSelected = false ;
  List<String> questions = [];
  int _correctAnswer = 0;
  

  bool get evalu => _evalu;
  bool get creer => _creer;
  bool get edit => _edit;
  bool get  radioSelected => _radioSelected;
  int  get correctAnswer => _correctAnswer;


 void setCorrectAnswer(int newCorrectAnswer){
  _correctAnswer =newCorrectAnswer;
  notifyListeners();
 }

 void setRadioSelected(){
  _radioSelected = !_radioSelected;
 }
 
  void setEvalu(newValue) {
    if(newValue){
          _evalu = newValue;
          _creer = false;
          _edit = false;
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

  void setEdit(newVa) {
    _edit = newVa;
    notifyListeners();
  }
}


