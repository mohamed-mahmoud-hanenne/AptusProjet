// ignore_for_file: prefer_const_constructors

import 'package:aptus_stage/responsives/desktop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EditQuizz extends StatefulWidget {
  const EditQuizz({super.key});

  @override
  State<EditQuizz> createState() => _EditQuizzState();
}

class _EditQuizzState extends State<EditQuizz> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _descp = TextEditingController();
  final TextEditingController _inst = TextEditingController();
  final TextEditingController _coeff = TextEditingController();
  final TextEditingController _datepub = TextEditingController();
  final TextEditingController _datedebut = TextEditingController();
  final TextEditingController _datefin = TextEditingController();
  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
      child: Column(children: [
        Row(
          children: [
            ChampsEdit(
              title: "title",
              champ: Container(
                child: TextField(
                  controller: _title,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              width: 40,
            ),
            ChampsEdit(
                title: "description",
                champ: Container(
                  margin: EdgeInsets.only(left: 100),
                  child: TextField(
                    controller: _descp,
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ))
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            ChampsEdit(
                title: "instructions",
                champ: Container(
                  child: TextField(
                    controller: _inst,
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                )),
            SizedBox(
              width: 40,
            ),
            ChampsEdit(
                title: "coefficient",
                champ: Container(
                  child: TextField(
                    controller: _coeff,
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                )),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            ChampsEdit(
                title: "Date et heure de publication",
                champ: Container(
                  child: TextField(
                    controller: _datepub,
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                )),
            SizedBox(
              width: 40,
            ),
            ChampsEdit(
                title: "Date et heure de début",
                champ: Container(
                  child: TextField(
                    controller: _datedebut,
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ))
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            ChampsEdit(
                title: "Date et heure de fin",
                champ: Container(
                  child: TextField(
                    controller: _datefin,
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                )),
            SizedBox(
              width: 40,
            ),
            ChampsEdit(
                title: "Temps additionnel",
                champ: Container(
                  child: TextField(
                    controller: _datefin,
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                )),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Column(
          children: [
            CheckEdit(
              text: "draft",
              check: Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  }),
            ),
            CheckEdit(
              text: "Autoriser la modification aprés envoi",
              check: Checkbox(
                  value: isChecked2,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked2 = value!;
                    });
                  }),
            ),
            Row(
              children: [
                CheckEdit(
                  text: "Distrubition aléatoire des questions",
                  check: Checkbox(
                      value: isChecked3,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked3 = value!;
                        });
                      }),
                ),
                SizedBox(
                  width: 20,
                ),
                isChecked3
                    ? Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.2)),
                        width: screenWidth(context) >= 800 ? 80 : 80,
                        height: screenWidth(context) >= 800 ? 20 : 20,
                        child: TextField(
                          decoration: InputDecoration(border: InputBorder.none),
                        ))
                    : Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.2),
                            color: Colors.grey
                            ),
                        width: screenWidth(context) >= 800 ? 80 : 80,
                        height: screenWidth(context) >= 800 ? 20 : 20,
                        child: Text('')),
                SizedBox(
                  width: 20,
                ),
                Text("questions par étudiant",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "myfont",
                        fontSize: screenWidth(context) >= 800 ? 15 : 10)),
              ],
            ),
          ],
        )
      ]),
    );
  }
}

class ChampsEdit extends StatelessWidget {
  ChampsEdit({super.key, required this.title, required this.champ});

  final String title;
  final Container champ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: Text(title,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "myfont",
                  fontSize: screenWidth(context) >= 800 ? 15 : 10)),
        ),
        SizedBox(
          width: screenWidth(context) >= 800 ? 50 : 20,
        ),
        Container(
            padding: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.2)),
            width: screenWidth(context) >= 800 ? 140 : 100,
            height: screenWidth(context) >= 800 ? 20 : 20,
            child: champ),
      ],
    );
  }
}

class CheckEdit extends StatelessWidget {
  const CheckEdit({super.key, required this.check, required this.text});

  final String text;
  final Checkbox check;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        check,
        SizedBox(
          width: screenWidth(context) >= 800 ? 15 : 10,
        ),
        Text(text,
            style: TextStyle(
                color: Colors.black,
                fontFamily: "myfont",
                fontSize: screenWidth(context) >= 800 ? 15 : 10)),
      ],
    );
  }
}
