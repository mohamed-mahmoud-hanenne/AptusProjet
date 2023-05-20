import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:localstorage/localstorage.dart';

  final LocalStorage storage = new LocalStorage('todo_app.json');
  late String mytokens;

//   //function get all quizz
  static const urlquiz = 'http://srv4.aptusmaroc.com:8000/courses/quizzes';
  Future<void> makeGetRequest(String mytokens) async {
    
  final url = Uri.parse('$urlquiz');
    final response =
    await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'token $mytokens',
    });

    Map<String,dynamic> 
 
   .then((response) {
      res = jsonDecode(response.body);
    }).catchError((error) {
      print('Error: $error');
    });
    return res;
  }


