// ignore_for_file: prefer_const_constructors

import 'package:aptus_stage/models/models.dart';
import 'package:aptus_stage/responsives/desktop.dart';
import 'package:aptus_stage/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditQuizz extends StatefulWidget {
  const EditQuizz({super.key, required this.detail});
  final Detail detail;

  @override
  State<EditQuizz> createState() => _EditQuizzState();
}

class _EditQuizzState extends State<EditQuizz> {
  static const String urlupdate =
      'http://192.168.0.120:8000/courses/quizzes/12/';
  Future<void> UpdateQuizz(String mytokens) async {
    final String title = _title.text;
    final String description = _descp.text;
    final String instructions = _inst.text;
    final String coeff = _coeff.text;
    final String publicationdate = _datepub.text;
    final String datedebut = _datedebut.text;
    final String datefin = _datefin.text;
    final String tempadt = _tempsadt.text;
    final String randomNb = _random.text;

    void update;
    final url = Uri.parse('$urlupdate');
    await http.put(url, headers: {
      // 'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'token $mytokens',
    }, body: {
      "title": title,
      "description": description,
      "instructions": instructions,
      "coeff": coeff,
      "publication_date": publicationdate,
      "started_at": datedebut,
      "ended_at": datefin,
      "additional_time": tempadt,
      "is_draft": widget.detail.isDraft.toString(),
      "enable_change_after_sending": widget.detail.enableChangeAfterSending.toString(),
      "random_questions": widget.detail.randomQuestions.toString(),
      "questions_random_number" : randomNb,
      "mixed_questions": widget.detail.mixedQuestions.toString(),
      "mixed_responses": widget.detail.mixedResponses.toString(),
      "manual_correction": widget.detail.manualCorrection.toString(),
      "publication_correction": widget.detail.publicationCorrection.toString()
    }).then((response) {
      print(response.statusCode);
      print(response.body);
    }).catchError((error) {
      print('Error: $error');
    });
    return update;
  }

  static const String urldelete =
      'http://192.168.0.120:8000/courses/quizzes/12/';
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

  final TextEditingController _title = TextEditingController();
  final TextEditingController _descp = TextEditingController();
  final TextEditingController _inst = TextEditingController();
  final TextEditingController _coeff = TextEditingController();
  final TextEditingController _datepub = TextEditingController();
  final TextEditingController _datedebut = TextEditingController();
  final TextEditingController _datefin = TextEditingController();
  final TextEditingController _tempsadt = TextEditingController();
  final TextEditingController _random = TextEditingController();


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
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: widget.detail.title),
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
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.detail.description),
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
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.detail.instructions),
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
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.detail.coeff.toString()),
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
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.detail.publicationDate.toString()),
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
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.detail.startedAt.toString()),
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
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.detail.endedAt.toString()),
                  ),
                )),
            SizedBox(
              width: 40,
            ),
            ChampsEdit(
                title: "Temps additionnel",
                champ: Container(
                  child: TextField(
                    controller: _tempsadt,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.detail.additionalTime.toString()),
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
              text: "Brouillons",
              check: Checkbox(
                  value: widget.detail.isDraft,
                  onChanged: (bool? value) {
                    setState(() {
                      widget.detail.isDraft = value!;
                    });
                  }),
            ),
            CheckEdit(
              text: "Autoriser la modification aprés envoi",
              check: Checkbox(
                  value: widget.detail.enableChangeAfterSending,
                  onChanged: (bool? value) {
                    setState(() {
                      widget.detail.enableChangeAfterSending = value!;
                    });
                  }),
            ),
            Row(
              children: [
                CheckEdit(
                  text: "Distrubition aléatoire des questions",
                  check: Checkbox(
                      value: widget.detail.randomQuestions,
                      onChanged: (bool? value) {
                        setState(() {
                          widget.detail.randomQuestions = value!;
                        });
                      }),
                ),
                SizedBox(
                  width: 20,
                ),
                widget.detail.randomQuestions
                    ? Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey, width: 0.2)),
                              width: screenWidth(context) >= 800 ? 80 : 80,
                              height: screenWidth(context) >= 800 ? 20 : 20,
                              child: TextField(
                                controller: _random,
                                decoration:
                                    InputDecoration(
                                      border: InputBorder.none,
                                       hintText: widget.detail.questionsRandomNumber.toString()
                                    ),
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Text("questions par étudiant",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "myfont",
                                  fontSize:
                                      screenWidth(context) >= 800 ? 15 : 10)),
                        ],
                      )
                    : Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  border: Border.all(
                                      color: Colors.grey, width: 0.2)),
                              width: screenWidth(context) >= 800 ? 80 : 80,
                              height: screenWidth(context) >= 800 ? 20 : 20,
                              child: Text("")),
                          SizedBox(
                            width: 20,
                          ),
                          Text("questions par étudiant",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "myfont",
                                  fontSize:
                                      screenWidth(context) >= 800 ? 15 : 10)),
                        ],
                      ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            CheckEdit(
              text: "Mélanger les questions",
              check: Checkbox(
                  value: widget.detail.mixedQuestions,
                  onChanged: (bool? value) {
                    setState(() {
                      widget.detail.mixedQuestions = value!;
                    });
                  }),
            ),
            CheckEdit(
              text: "Mélanger les réponses",
              check: Checkbox(
                  value: widget.detail.mixedResponses,
                  onChanged: (bool? value) {
                    setState(() {
                      widget.detail.mixedResponses = value!;
                    });
                  }),
            ),
            CheckEdit(
              text: "Activer la correction automatique",
              check: Checkbox(
                  value: widget.detail.manualCorrection,
                  onChanged: (bool? value) {
                    setState(() {
                      widget.detail.manualCorrection = value!;
                    });
                  }),
            ),
            CheckEdit(
              text: "Publier la correction ",
              check: Checkbox(
                  value: widget.detail.publicationCorrection,
                  onChanged: (bool? value) {
                    setState(() {
                      widget.detail.publicationCorrection = value!;
                    });
                  }),
            ),
            Container(
              margin: EdgeInsets.only(right: 30),
              child: Row(
                children: [
                  Iconstext(
                      icon: Icons.save,
                      name: "Enrégistrer",
                      callBack: () async {
                        await UpdateQuizz(storage.getItem('token'));
                      }),
                  Iconstext(icon: Icons.clear, name: "Annuler", callBack: () async{
                    await DeleteQuizz(storage.getItem('token'));
                  })
                ],
              ),
            )
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
            height: screenWidth(context) >= 800 ? 40 : 20,
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

class ChampHeddenT extends StatelessWidget {
  ChampHeddenT({super.key, required this.text});
  final String text;
  final TextEditingController _random = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.2)),
            width: screenWidth(context) >= 800 ? 80 : 80,
            height: screenWidth(context) >= 800 ? 20 : 20,
            child: TextField(
              controller: _random,
              decoration: InputDecoration(border: InputBorder.none),
            )),
        SizedBox(
          width: 20,
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

class ChampHeddenF extends StatelessWidget {
  const ChampHeddenF({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.grey, width: 0.2)),
            width: screenWidth(context) >= 800 ? 80 : 80,
            height: screenWidth(context) >= 800 ? 20 : 20,
            child: Text("")),
        SizedBox(
          width: 20,
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

class Iconstext extends StatelessWidget {
  const Iconstext(
      {super.key,
      required this.icon,
      required this.name,
      required this.callBack});

  final IconData icon;
  final String name;
  final Function callBack;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color: Color.fromARGB(255, 84, 211, 239), width: 0.5)),
        margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(
              icon,
              color: Color.fromARGB(255, 84, 211, 239),
              size: 15,
            ),
            TextButton(
              child: Text(
                name,
                style: TextStyle(
                  color: Color.fromARGB(255, 84, 211, 239),
                  fontFamily: 'myfont',
                  fontSize: screenWidth(context) >= 800 ? 12 : 8,
                ),
              ),
              onPressed: () async {
                await callBack();
              },
            ),
          ],
        ),
      ),
    ]);
  }
}
