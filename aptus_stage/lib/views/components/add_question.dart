// ignore_for_file: prefer_const_literals_to_create_immutables, implementation_imports, prefer_const_constructors, unnecessary_new, prefer_const_constructors_in_immutables

import 'package:aptus_stage/controllers/providers.dart';
import 'package:aptus_stage/models/models.dart';
import 'package:aptus_stage/responsives/desktop.dart';
import 'package:aptus_stage/services/api.dart';
import 'package:aptus_stage/views/components/edit_quizz.dart';
import 'package:aptus_stage/views/components/home_screen_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

class AddQuestions extends StatefulWidget {
  AddQuestions({
    super.key,
    required this.quest,
  });
  final String quest;

  @override
  State<AddQuestions> createState() => _AddQuestionsState();
}

class _AddQuestionsState extends State<AddQuestions> {
  List<Widget> repone = [];
  List<Widget> Bonrepone = [];

  String selected = "MCQ - Only one answer";
  String select = "Oui";
  bool ajouter = false;
  bool bonrep = false;
  bool check = false;
  bool paramques = false;
  bool paramshort = false;
  bool ajoutershort = false;

  final TextEditingController _uneseule = TextEditingController();
  final TextEditingController _queslong = TextEditingController();
  final TextEditingController _replong = TextEditingController();
  final TextEditingController _point = TextEditingController();


  final TextEditingController _quesshort = TextEditingController();
  final TextEditingController _repshort = TextEditingController();
  final TextEditingController _pointshort = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      margin: EdgeInsets.all(20),
      width: screenWidth(context) >= 800 ? 1100 : 700,
      height: screenWidth(context) >= 800 ? 700 : 600,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(widget.quest,
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
                height: screenWidth(context) >= 800 ? 50 : 20,
                child: FutureBuilder(
                    future: gettypeques(storage.getItem('token')),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        Questions question = snapshot.data!;
                        return ListView.builder(
                            itemCount: 7,
                            itemBuilder: (context, index) {
                              return DropdownButton(
                                style: TextStyle(
                                    fontFamily: "myfont",
                                    fontSize: 10,
                                    color: Colors.grey[700]),
                                items: [
                                  question.qcmsingle,
                                  question.qcmmultiple,
                                  question.longanswer,
                                  question.shortanswer,
                                  question.matching,
                                  question.numerical,
                                  question.fillin
                                ]
                                    .map((e) => DropdownMenuItem(
                                          child: Text("$e"),
                                          value: e,
                                        ))
                                    .toList(),
                                onChanged: (v) {
                                  setState(() {
                                    selected = v.toString();
                                  });
                                },
                                value: selected,
                              );
                            });
                      } else {
                        return CupertinoActivityIndicator();
                      }
                    }),
              )
            ],
          ),
          if (selected == 'MCQ - Only one answer')
            Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(100, 30, 0, 0),
                      width: 400,
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        controller: _uneseule,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 9, 212, 212))),
                          border: OutlineInputBorder(),
                          hintText: "Ajouter une question",
                          filled: true,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30, left: 120),
                      child: Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  repone.add(
                                      ReponseWidget(index: repone.length + 1));
                                });
                              },
                              child: Text(
                                "Ajouter les réponses",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 39, 237, 224)),
                              )),
                          SizedBox(
                            width: 230,
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  bonrep = true;
                                });
                              },
                              child: Text(
                                "Enregistrer la paramétre",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 39, 237, 224)),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Column(
                          children: repone,
                        ),
                        bonrep
                            ? Column(
                                children: [
                                  BonneReponse(gval: 1),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  CheckEdit(
                                    text: "Mélanger les réponses",
                                    check: Checkbox(
                                        value: check,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            check = value!;
                                          });
                                        }),
                                  ),
                                ],
                              )
                            : SizedBox()
                      ],
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 90),
                  child: Row(
                    children: [
                      IconsWidget(
                          icon: Icons.add,
                          name: 'Ajouter',
                          callBack: () async {
                            print(Provider.of<EvaluProvider>(context,
                                    listen: false)
                                .questions[0]);

                            try {
                              Question question = Question(
                                  questionText: _uneseule.text,
                                  questionType: "qcm_single",
                                  choices: Provider.of<EvaluProvider>(context,
                                          listen: false)
                                      .questions,
                                  correctanswer: Provider.of<EvaluProvider>(
                                          context,
                                          listen: false)
                                      .questions[0],
                                  point: Provider.of<EvaluProvider>(context,
                                          listen: false)
                                      .textfield,
                                  shufflechoices: check);
                              await addquestions(storage.getItem('token'),
                                  question, storage.getItem('id'));
                            } catch (e) {
                              print(e);
                            }
                          }),
                      IconsWidget(
                          icon: Icons.clear, name: 'Annuler', callBack: () {})
                    ],
                  ),
                )
              ],
            ),

            if (selected == 'Long answer')
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                     
                      margin: EdgeInsets.fromLTRB(100, 30, 0, 0),
                      width: 400,
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        controller: _queslong,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          border: OutlineInputBorder(),
                          hintText: "Ajouter une question",
                          filled: true,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(110, 30, 0, 0),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              ajouter = true;
                            });
                          },
                          child: Text(
                            "Ajouter une réponse longue",
                            style: TextStyle(
                                color: Color.fromARGB(255, 39, 237, 224)),
                          )),
                    ),
                    SizedBox(width: 30,),
                  ],
                ),
                        ajouter
                        ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.fromLTRB(120, 30, 0, 0),
                                width: 380,
                                child: TextField(
                                  controller: _replong,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 60),
                                    border: OutlineInputBorder(),
                                    hintText: "Ecrire le réponse",
                                    filled: true,
                                  ),
                                ),
                              ),
                          ],
                        )
                        : SizedBox(),

                  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(110, 30, 0, 0),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              paramques = true;
                            });
                          },
                          child: Text(
                            "Ajouter la paramétre",
                            style: TextStyle(
                                color: Color.fromARGB(255, 39, 237, 224)),
                          )),
                    ),
                    SizedBox(width: 30,),
                  ],
                ),

                  paramques ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.fromLTRB(120, 30, 0, 0),
                                width: 380,
                                child: TextField(
                                  controller: _point,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Ecrire la point",
                                    filled: true,
                                  ),
                                ),
                              ),
                          ],
                        )
                        :SizedBox(),

                        Container(
                          margin: EdgeInsets.fromLTRB(100, 30, 0, 0),
                          child: Row(
                            children: [
                              IconsWidget(icon: Icons.add, name: 'Ajouter', callBack: () async{
                                try{
                                  QuestionLong queslong = QuestionLong(
                                  questionText: _queslong.text, 
                                    questionType: "long_answer", 
                                    data: {
                                      "reponse_long" : _replong.text
                                    }, 
                                    questionParams: {
                                      "point" : _point.text
                                    },
                                    );
                                    await addlong(storage.getItem('token'), queslong, storage.getItem('id'));
                                }catch(e){
                                  print(e);
                                }

                              }),
                              IconsWidget(icon: Icons.clear, name: 'Annuler', callBack: () {
                                Provider.of<EvaluProvider>(context, listen: false).setEvalu(
                                  !Provider.of<EvaluProvider>(context, listen: false).evalu
                                );
                              })
                            ],
                          ),
                        ),
                        
              ],
            ),

            if (selected == 'Short answer')
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                     
                      margin: EdgeInsets.fromLTRB(100, 30, 0, 0),
                      width: 400,
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        controller: _quesshort,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          border: OutlineInputBorder(),
                          hintText: "Ajouter une question",
                          filled: true,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(110, 30, 0, 0),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              ajoutershort = true;
                            });
                          },
                          child: Text(
                            "Ajouter une réponse courte",
                            style: TextStyle(
                                color: Color.fromARGB(255, 39, 237, 224)),
                          )),
                    ),
                    SizedBox(width: 30,),
                  ],
                ),
                        ajoutershort
                        ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.fromLTRB(120, 30, 0, 0),
                                width: 380,
                                child: TextField(
                                  controller: _repshort,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                                    border: OutlineInputBorder(),
                                    hintText: "Ecrire le réponse",
                                    filled: true,
                                  ),
                                ),
                              ),
                          ],
                        )
                        : SizedBox(),

                  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(110, 30, 0, 0),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              paramshort = true;
                            });
                          },
                          child: Text(
                            "Ajouter la paramétre",
                            style: TextStyle(
                                color: Color.fromARGB(255, 39, 237, 224)),
                          )),
                    ),
                    SizedBox(width: 30,),
                  ],
                ),

                  paramshort ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.fromLTRB(120, 30, 0, 0),
                                width: 380,
                                child: TextField(
                                  controller: _pointshort,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Ecrire la point",
                                    filled: true,
                                  ),
                                ),
                              ),
                          ],
                        )
                        :SizedBox(),

                        Container(
                          margin: EdgeInsets.fromLTRB(100, 30, 0, 0),
                          child: Row(
                            children: [
                              IconsWidget(icon: Icons.add, name: 'Ajouter', callBack: () async{
                                try{
                                  QuestionLong queslong = QuestionLong(
                                    questionText: _quesshort.text, 
                                    questionType: "short_answer", 
                                    data: {
                                      "correct_answer" : _repshort.text
                                    }, 
                                    questionParams: {
                                      "point" : _pointshort.text
                                    },
                                    );
                                    await addlong(storage.getItem('token'), queslong, storage.getItem('id'));
                                }catch(e){
                                  print(e);
                                }

                              }),
                              IconsWidget(icon: Icons.clear, name: 'Annuler', callBack: () {
                                Provider.of<EvaluProvider>(context, listen: false).setEvalu(
                                  !Provider.of<EvaluProvider>(context, listen: false).evalu
                                );
                              })
                            ],
                          ),
                        ),
                        
              ],
            )
        ],
      ),
    );
  }
}

class ReponseWidget extends StatefulWidget {
  ReponseWidget({super.key, required this.index});
  final int index;
  @override
  State<ReponseWidget> createState() => _ReponseWidgetState();
}

class _ReponseWidgetState extends State<ReponseWidget> {
  final TextEditingController _reponse = TextEditingController();
  bool selec = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(30, 40, 0, 0),
          child: Row(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selec) {
                          selec = false;
                          Provider.of<EvaluProvider>(context, listen: false)
                              .setRadioSelected();
                        } else {
                          if (Provider.of<EvaluProvider>(context, listen: false)
                              .radioSelected) {
                          } else {
                            selec = true;
                            Provider.of<EvaluProvider>(context, listen: false)
                                .setRadioSelected();
                            Provider.of<EvaluProvider>(context, listen: false)
                                .questions
                                .remove(_reponse.text);
                            Provider.of<EvaluProvider>(context, listen: false)
                                .questions
                                .insert(0, _reponse.text);
                          }
                        }
                      });
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: selec ? Colors.blue : Colors.grey,
                            width: 0.5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: selec ? Colors.blue : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                  width: 300,
                  margin: EdgeInsets.only(left: 50),
                  child: TextField(
                    controller: _reponse,
                    onChanged: (value) {
                      if (selec) {
                        Provider.of<EvaluProvider>(context, listen: false)
                            .questions
                            .insert(0, value);
                      } else {
                        Provider.of<EvaluProvider>(context, listen: false)
                            .questions
                            .add(value);
                      }
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 9, 212, 212))),
                      border: OutlineInputBorder(),
                    ),
                  ))
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        // Container(
        //   margin: EdgeInsets.fromLTRB(30, 40, 0, 0),
        //   child: Row(
        //     children: [
        //       Radio(
        //          value: 2,
        //          groupValue:widget.gval,
        //          onChanged: (value){
        //            setState(() {
        //              widget.gval = value!;
        //            });
        //          }
        //          ),
        //         SizedBox(width: 10,),
        //         Container(
        //           width: 300,
        //           margin: EdgeInsets.only(left: 50),
        //           child: TextField(
        //             controller: _reponse,
        //           decoration: InputDecoration(
        //             border: OutlineInputBorder(),
        //           ),
        //           )
        //         )
        //     ],
        //   ),
        // )
      ],
    );
  }
}

class BonneReponse extends StatefulWidget {
  BonneReponse({super.key, required this.gval});
  late int gval;
  @override
  State<BonneReponse> createState() => _BonneReponseState();
}

class _BonneReponseState extends State<BonneReponse> {
  final TextEditingController _param = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(30, 40, 0, 0),
          child: Row(
            children: [
              // Radio(
              //    value: 1,
              //    groupValue:widget.gval,
              //    onChanged: (value){
              //      setState(() {
              //        widget.gval = value!;
              //      });
              //    }
              //    ),
              SizedBox(
                width: 10,
              ),
              Container(
                  width: 300,
                  margin: EdgeInsets.only(left: 50),
                  child: TextField(
                    controller: _param,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 9, 212, 212))),
                        border: OutlineInputBorder(),
                        hintText: 'Ecrire le paramétre'),
                  ))
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        // Container(
        //   margin: EdgeInsets.fromLTRB(30, 40, 0, 0),
        //   child: Row(
        //     children: [
        //       Radio(
        //          value: 2,
        //          groupValue:widget.gval,
        //          onChanged: (value){
        //            setState(() {
        //              widget.gval = value!;
        //            });
        //          }
        //          ),
        //         SizedBox(width: 10,),
        //         Container(
        //           width: 300,
        //           margin: EdgeInsets.only(left: 50),
        //           child: TextField(
        //             controller: _reponse,
        //           decoration: InputDecoration(
        //             border: OutlineInputBorder(),
        //           ),
        //           )
        //         )
        //     ],
        //   ),
        // )
      ],
    );
  }
}
