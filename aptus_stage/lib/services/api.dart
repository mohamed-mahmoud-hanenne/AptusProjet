import 'package:aptus_stage/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:aptus_stage/views/components/edit_quizz.dart';

  final LocalStorage storage = new LocalStorage('todo_app.json');
  late String mytokens;

//   //function get all quizz
   const String host = 'http://192.168.0.120:8002/';
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
   const String hosturl = 'http://192.168.0.120:8002/';
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
  const String urldeatil = 'http://192.168.0.120:8002/courses/quizzes/12';
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

     const String urlupdate =
      'http://192.168.0.120:8002/courses/quizzes/12/';
  Future<void> UpdateQuizz(String mytokens,Detail detail ) async {
   
   print("jj");
    var update;
    final url = Uri.parse('$urlupdate');
    print('lll');
    await http.put(url, headers: {
      // 'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'token $mytokens',
    }, body: {
      "title": detail.title,
      "description":  detail.description,
      "instructions": detail. instructions,
      "coeff":  detail.coeff.toString(),
      "publication_date":  detail.publicationDate.toString(),
      "started_at":  detail.startedAt.toString(),
      "ended_at":  detail.endedAt.toString(),
      "additional_time":  detail.additionalTime.toString(),
      "is_draft":  detail.isDraft.toString(),
      "enable_change_after_sending": detail.enableChangeAfterSending.toString(),
      "random_questions": detail.randomQuestions.toString(),
      "questions_random_number" : detail.questionsRandomNumber.toString(),
      "mixed_questions": detail.mixedQuestions.toString(),
      "mixed_responses": detail.mixedResponses.toString(),
      "manual_correction": detail.manualCorrection.toString(),
      "publication_correction": detail.publicationCorrection.toString()
    }).then((response) {
      print(response.statusCode);
      print(response.body);
    }).catchError((error) {
      print('Error: $error');
    });
    return update;
  }
  

   const String urldelete =
      'http://192.168.0.120:8002/courses/quizzes/16/';
  Future<void> DeleteQuizz(String mytokens) async {


    void delete;
    final url = Uri.parse('$urldelete');
    await http.delete(url, headers: {
      // 'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'token $mytokens',
    }, ).then((response) {
      print(response.statusCode);
      print(response.body);
    }).catchError((error) {
      print('Error: $error');
    });
    return delete;
  }