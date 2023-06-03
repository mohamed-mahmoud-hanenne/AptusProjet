

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Quizz {
  final String title ;
  final String description;
  final int coeff;
  final int id;

  Quizz({
    required this.title,
    required this.description,
    required this.coeff,
    required this.id
  });

 static Quizz fromJson(Map<String,dynamic> json){
    return  Quizz(title: json['title'], description: json['description'], coeff: json['coeff'], id: json['id']);
  }

}




class Detail {
   String title;
   String description;
   String instructions;
   int? coeff;
   DateTime? publicationDate;
   DateTime? startedAt;
   DateTime? endedAt;
   bool isDraft;
   bool enableChangeAfterSending;
   int? additionalTime;
   bool randomQuestions;
   int? questionsRandomNumber;
   bool mixedQuestions;
   bool mixedResponses;
   bool manualCorrection;
   bool publicationCorrection;

  Detail({
  required this.title,
  required this.description,
  required this.instructions,
  required this.coeff,
  required this.publicationDate,
  required this.startedAt,
  required this.endedAt,
  required this.isDraft,
  required this.enableChangeAfterSending,
  required this.additionalTime,
  required this.randomQuestions,
  required this.questionsRandomNumber,
  required this.mixedQuestions,
  required this.mixedResponses,
  required this.manualCorrection,
  required this.publicationCorrection,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      title: json['title'],
      description: json['description'],
      instructions: json['instructions'],
      coeff: json['coeff'],
      publicationDate: json['publication_date'] != null ? DateTime.parse(json['publication_date']) : null,
      startedAt: json['started_at'] != null ? DateTime.parse(json['started_at']) : null ,
      endedAt: json['ended_at'] != null ? DateTime.parse(json['ended_at']) : null,
      isDraft: json['is_draft'],
      enableChangeAfterSending: json['enable_change_after_sending'],
      additionalTime: json['additional_time'],
      randomQuestions: json['random_questions'],
      questionsRandomNumber: json['questions_random_number'],
      mixedQuestions: json['mixed_questions'],
      mixedResponses: json['mixed_responses'],
      manualCorrection: json['manual_correction'],
      publicationCorrection: json['publication_correction'],
    );
  }
}


 class Questions{
  final String qcmsingle ;
  final String qcmmultiple;
  final String longanswer;
  final String shortanswer;
  final String matching ;
  final String numerical;
  final String fillin;


    Questions({
    required this.qcmsingle,
    required this.qcmmultiple,
    required this.longanswer,
    required this.shortanswer,
    required this.matching,
    required this.numerical,
    required this.fillin,
  });
  
    static Questions fromJson(Map<String,dynamic> ques){
    return  Questions(
      qcmsingle: ques['question_types']['qcm_single'], 
      qcmmultiple: ques['question_types']['qcm_multiple'], 
      longanswer: ques['question_types']['long_answer'], 
      shortanswer: ques['question_types']['short_answer'], 
      matching: ques['question_types']['matching'], 
      numerical: ques['question_types']['numerical'], 
      fillin: ques['question_types']['fill_in_the_blank']
      );
}

}
 

class Question {
  String questionText;
  String questionType;
  List<String> choices;
  String correctanswer;
  int point;
  bool shufflechoices;

  Question({
    required this.questionText,
    required this.questionType,
    required this.choices,
    required this.correctanswer,
    required this.point,
    required this.shufflechoices
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionText: json['question_text'],
      questionType: json['question_type'],
      choices: json['data']['choices'],
      correctanswer: json['data']['correct_answer'],
      point: json['questions_params']['point'],
      shufflechoices: json['questions_params']['shuffle_choices']

    );
  }
}


class QuestionLong{
  String questionText;
  String questiontype;
  String data;
  String point;

  QuestionLong({
   required this.questionText,
   required this.questiontype,
   required this.data,
   required this.point
  });

  factory QuestionLong.fromJson(Map<String, dynamic> jsonques){
    return QuestionLong(
      questionText: jsonques['question_text'], 
      questiontype: jsonques['question_type'], 
      data: jsonques['data'], 
      point: jsonques['questions_params']['point']
      );
  }
}