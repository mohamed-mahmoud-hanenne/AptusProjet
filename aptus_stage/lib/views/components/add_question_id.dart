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

class AddQuestionsId extends StatefulWidget {
  AddQuestionsId({super.key, required this.quest,});
  final String quest;
  
  @override
  State<AddQuestionsId> createState() => _AddQuestionsIdState();
}

class _AddQuestionsIdState extends State<AddQuestionsId> {
  
  List<Widget> repone = [];
  List<Widget> Bonrepone = [];

  String selected = "MCQ - Only one answer";
  String select = "Oui";
  bool ajouter = false;
  bool bonrep = false;
  bool check = false;

  final TextEditingController _uneseule = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      width: screenWidth(context) >= 800 ? 1300 : 800,
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
                                style: TextStyle(color: Color.fromARGB(255, 39, 237, 224)),
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
                                  SizedBox(height: 20,),
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
                          callBack: () async{
                            print(
                                Provider.of<EvaluProvider>(context, listen: false)
                                    .questions[0]);

                              try{
                                Question newquestions = 
                                Question(
                                  questionText: _uneseule.text, 
                                questionType: selected.toString(), 
                                data: {
                                  "choices":[
                                     Provider.of<EvaluProvider>(context, listen: false)
                                    .questions.length
                                  ],
                                  "correct_answer": Provider.of<EvaluProvider>(context, listen: false)
                                    .questions[0]
                                }, 
                                questionParams: {
                                  "point": 1,
                                  "shuffle_choices": check.toString()
                                });
                                await addquestions(storage.getItem('token'), newquestions, idquizz);
                              }catch(e){
                                print(e);
                              }
                          }),
                      IconsWidget(
                          icon: Icons.clear, name: 'Annuler', callBack: () {
                     Provider.of<EvaluProvider>(context, listen: false).setEvalu(
                     !Provider.of<EvaluProvider>(context, listen: false).evalu);
                          })
                    ],
                  ),
                )
              ],
            ),
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