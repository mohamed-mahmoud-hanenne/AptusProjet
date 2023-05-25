import 'package:aptus_stage/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:aptus_stage/views/components/edit_quizz.dart';

  final LocalStorage storage = new LocalStorage('todo_app.json');
  late String mytokens;

//   //function get all quizz
   const String host = 'http://192.168.1.130:8002/';
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

    var json = jsonDecode(response.body);
    
    
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
   const String hosturl = 'http://192.168.1.130:8002/';
   Future<void> createQuizze(String mytokens) async {
    
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
    
  }

   //function get deatil quizz
  const String urldeatil = 'http://192.168.1.130:8002/courses/quizzes/12';
  Future<Detail?> getdetail(String mytokens) async {
    Detail? detail;
    final url = Uri.parse('$urldeatil');
    await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'token $mytokens',
    }).then((response) {
      detail = Detail.fromJson(jsonDecode(response.body));
      
      // print(response.statusCode);
      // print(detail);
    }).catchError((error) {
      print('Error: $error');
    });
    return detail;
  }

  //    const String urlquestion = 'https://jsonplaceholder.typicode.com/users';
  // Future<List<Questions>> GetQuestions() async{

  //   List<Questions> quest = [];

  //   final url = Uri.parse('$urlquestion');
  //   await http.get(
  //     url
  //     ).then((question) {
  //     var ques = jsonDecode(question.body) ;
  //     print(question.statusCode);

  //     for(Map<String, dynamic> jsontest in ques){
  //       quest.add(
  //         Questions.fromJson(jsontest)
  //       );
  //     }
 
  //   }).catchError((error){
  //     print(error);
  //   });
  //   return quest;
  // }
  



