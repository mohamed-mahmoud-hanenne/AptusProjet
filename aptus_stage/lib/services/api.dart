import 'package:aptus_stage/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:localstorage/localstorage.dart';

  final LocalStorage storage = new LocalStorage('todo_app.json');
  late String mytokens;
  

//   //function get all quizz
   const String host = 'http://srv4.aptusmaroc.com:8000/';
  Future<List<Quizz>> getQuizzes(String mytokens) async {
    
    List<Quizz> quizzes = [];

    try {
       final url = Uri.parse('$host'+'courses/quizzes');
    final response =
    await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'token $mytokens',
    });

    var json = jsonDecode(response.body) ;


    for (Map<String,dynamic> jsonQuizz in json) {
     quizzes.add(
     Quizz.fromJson(jsonQuizz)
     );
   }
    
    } catch (e) {
      print(e);
    }
 
 
    return quizzes;
  }


  //function create quizz
   const String hosturl = 'http://srv4.aptusmaroc.com:8000/';
   Future<void> createQuizze(String mytokens) async {
    var result;
    final url = Uri.parse('$hosturl'+'courses/quizzes/');

    await http.post(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'token $mytokens',
    }).then((respon) {
      print(respon.body);
    }).catchError((error) {
      print(error);
    });
    return (result);
  }