// ignore_for_file: prefer_const_literals_to_create_immutables, implementation_imports, prefer_const_constructors

import 'package:aptus_stage/models/models.dart';
import 'package:aptus_stage/responsives/desktop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddQuestions extends StatefulWidget {
   AddQuestions({super.key, required this.quest});
  Questions quest ;
  @override
  State<AddQuestions> createState() => _AddQuestionsState();
}

class _AddQuestionsState extends State<AddQuestions> {


  
  List questions = [];
  int _value = 1;

  String selected = "QCM - Une seule réponse";
  String select = "Oui";
  @override
  Widget build(BuildContext context) {
   
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Questions",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "myfont",
                    fontSize: screenWidth(context) >= 800 ? 15 : 10)),
            SizedBox(
              width: screenWidth(context) >= 800 ? 40 : 20,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.2)),
              width: screenWidth(context) >= 800 ? 200 : 100,
              height: screenWidth(context) >= 800 ? 25 : 20,
              child: Text(widget.quest.username)
            ),
            SizedBox(
              width: screenWidth(context) >= 800 ? 40 : 20,
            ),
            Text("Mélanger les réponses",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "myfont",
                    fontSize: screenWidth(context) >= 800 ? 15 : 10)),
            SizedBox(
              width: screenWidth(context) >= 800 ? 40 : 20,
            ),
            // Container(
            //   padding: EdgeInsets.only(bottom: 10),
            //   margin: EdgeInsets.only(left: 10),
            //   decoration: BoxDecoration(
            //       border: Border.all(color: Colors.grey, width: 0.2)),
            //   width: screenWidth(context) >= 800 ? 100 : 80,
            //   height: screenWidth(context) >= 800 ? 20 : 20,
            //   child: DropdownButton(
            //       style: TextStyle(
            //           fontFamily: "myfont",
            //           fontSize: 10,
            //           color: Colors.grey[700]),
                      
            //       onChanged: (v) {}
             
            //       ),
            // ),
          ],
        ),
      ],
    );
  }
}
