// ignore_for_file: prefer_interpolation_to_compose_strings, unnecessary_string_interpolations, unused_local_variable

import 'package:aptus_stage/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:aptus_stage/views/components/edit_quizz.dart';

  final LocalStorage storage = new LocalStorage('todo_app.json');
  
  late int idquizz;
  
  _saveToStorage(int id) {
    storage.setItem('id', id);
  }


//function get all quizz
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

       //function get question type
   const String hostques = 'http://192.168.0.120:8002/init/';
   Future<Questions?> gettypeques(String mytokens) async {
    
  Questions? question;

    try {
       final url = Uri.parse('$hostques'+'courses_init');
    final response =
    await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'token $mytokens',
    });

    var jsonques = jsonDecode(response.body);
    
     print(jsonques);
    //  print(jsonques['question_types']['qcm_single']);
    question=
        Questions.fromJson(jsonques)
      ;
     
    
    
    } catch (e) {
      print(e);
      question =null;
    }
    
    return question;
  }
  //function create quizz
   const String hosturl = 'http://192.168.0.120:8002/';
   Future<int> createQuizze(String mytokens) async {
    
   int id =0;
    final url = Uri.parse('$hosturl'+'courses/quizzes/');

    await http.post(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'token $mytokens',
    }).then((respon) {
     
     
    Map<String,dynamic> create = jsonDecode(respon.body);
     print(create);
     id = create['id'];
    
    int idcreate = create['id'];
     _saveToStorage(idcreate);
    }).catchError((error) {
      print(error);
    });
    
    return id;
    
  }



   //function get deatil quizz
  const String urldeatil = 'http://192.168.0.120:8002/courses/quizzes/';
  Future<Detail?> getdetail(String mytokens, int idquizz) async {
    Detail? detail;
    final url = Uri.parse('$urldeatil'+ idquizz.toString());
    await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'token $mytokens',
    }).then((response) {
      detail = Detail.fromJson(jsonDecode(response.body));
      
      print(response.statusCode);
      print(response.body);
    }).catchError((error) {
      print('Error: $error');
    });
    return detail;
  }

     const String urlupdate =
      'http://192.168.0.120:8002/courses/quizzes/';
  Future<void> UpdateQuizz(String mytokens,Detail detail , int idquizz) async {
   
    var update;
    final url = Uri.parse('$urlupdate'+ idquizz.toString() + '/');
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
      'http://192.168.0.120:8002/courses/quizzes/';
  Future<void> DeleteQuizz(String mytokens, int idquizz) async {


    
    final url = Uri.parse('$urldelete'+ idquizz.toString() + '/');
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
    
  }

const String urladdlong = 'http://192.168.0.120:8002/courses/quizzes/';
Future<void> addlong(String mytokens, QuestionLong queslong , int idquizz) async{
  final url = Uri.parse('$urladdlong' + idquizz.toString() + '/add_question/');

  Map<String, dynamic> dataques = {
    'question_text' : queslong.questionText,
    'question_type' : queslong.questiontype,
    'data' : {
      queslong.data
    },
    'questions_params' : {
      "point" : queslong.point
    }
  };
  await http.post(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'token $mytokens',
  },
  body: jsonEncode(dataques)
  ).then((queslongue) {
   Map<String, dynamic> addques = jsonDecode(queslongue.body);
   print(queslongue.statusCode);
   print(queslongue.body);
  }).catchError((error){
    print(error);
  });

}

 const String urladdques = 'http://192.168.0.120:8002/courses/quizzes/';
 Future<void> addquestions(String mytokens, Question  question, int idquizz) async{
 
  final url = Uri.parse('$urladdques'+ idquizz.toString() + '/add_question/');

    Map<String,dynamic> data = {
      'question_text':question.questionText,
      'question_type':question.questionType,
       'data': {
        'choices':[
          question.choices.map((e) => '$e').join(',')
        ],
        'correct_answer': question.correctanswer
      },
      'questions_params' : {
        "point" : question.point,
        "shuffle_choices" : question.shufflechoices
      }

    };
  await http.post(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'token $mytokens',
     
    },
    body: jsonEncode(data)
    ).then((question) {
      
      Map<String,dynamic> add = jsonDecode(question.body);
      print(question.statusCode);
      print(question.body);
    }).catchError((error){
      print(error);
 });
 }



