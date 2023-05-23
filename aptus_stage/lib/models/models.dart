

import 'package:flutter/material.dart';

class Quizz {
  final String title ;
  final String description;
  final int coeff;

  Quizz({
    required this.title,
    required this.description,
    required this.coeff
  });

 static Quizz fromJson(Map<String,dynamic> json){
    return  Quizz(title: json['title'], description: json['description'], coeff: json['coeff']);
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
  final String username;

  Questions({
    required this.username
  });
 }