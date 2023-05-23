// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, unused_local_variable, unnecessary_string_interpolations

import 'package:aptus_stage/controllers/providers.dart';
import 'package:aptus_stage/services/api.dart';
import 'package:aptus_stage/views/components/add_question.dart';
import 'package:aptus_stage/views/components/edit_quizz.dart';
import 'package:aptus_stage/views/components/home_screen_components.dart';
import 'package:aptus_stage/views/screens/sidebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:localstorage/localstorage.dart';

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

class MyDesktop extends StatefulWidget {
  const MyDesktop({super.key});

  @override
  State<MyDesktop> createState() => _MyDesktopState();
}

class _MyDesktopState extends State<MyDesktop> {
  bool quest = true;
//   bool ajouter = false;
//   bool importer = false;





//   @override
//   void initState() {
//     super.initState();
//     mytokens
//     getdetail();
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Sidebar(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Builder(
              builder: (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(Icons.menu),
                    color: Color.fromARGB(255, 10, 238, 254),
                  )),
          elevation: 0,
          title: Row(children: [
            Image.asset(
              "assets/img/ap.png",
              width: screenWidth(context) >= 800 ? 110 : 30,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Marketing Digital",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "myfont",
                fontSize: screenWidth(context) >= 800 ? 12 : 8,
              ),
            ),
          ]),
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.school),
                  color: Color.fromARGB(255, 17, 238, 254),
                  iconSize: screenWidth(context) >= 800 ? 15 : 10,
                ),
                Text(
                  "Formation Continue",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "myfont",
                    fontSize: screenWidth(context) >= 800 ? 12 : 8,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.calendar_month),
                  color: Color.fromARGB(255, 17, 238, 254),
                  iconSize: screenWidth(context) >= 800 ? 15 : 10,
                ),
                Text(
                  "2022-2023",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "myfont",
                    fontSize: screenWidth(context) >= 800 ? 12 : 8,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications),
                  color: Color.fromARGB(255, 17, 238, 254),
                  iconSize: screenWidth(context) >= 800 ? 15 : 10,
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.email),
                  color: Color.fromARGB(255, 17, 238, 254),
                  iconSize: screenWidth(context) >= 800 ? 15 : 10,
                ),
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.person),
                    color: Color.fromARGB(255, 17, 238, 254),
                    iconSize: screenWidth(context) >= 800 ? 15 : 10,
                  ),
                )
              ],
            )
          ],
        ),
        body: ChangeNotifierProvider(
            create: (context) => EvaluProvider(),
            builder: (context, child) => SingleChildScrollView(
                    child: Column(children: [
                  SousMenu(),
                  Provider.of<EvaluProvider>(context).evalu
                      ? QuizzList()
                      : SizedBox(),
                  Provider.of<EvaluProvider>(context).edit 
                  ? Column(
                          children: [
                            Row(
                              children: [
                                ParamQuestions(
                                    name: 'Questions',
                                    paramQues: () {
                                      setState(() {
                                        quest = true;
                                      });
                                    }),
                                ParamQuestions(
                                    name: 'Paramétrages',
                                    paramQues: () {
                                      setState(() {
                                        quest = false;
                                      });
                                    }),
                              ],
                            ),
                            quest
                                ? AddQuestions()
                                : FutureBuilder(
                                    future: getdetail(storage.getItem('token')),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return EditQuizz(
                                          detail: snapshot.data!,
                                        );
                                      } else
                                        return CupertinoActivityIndicator();
                                    },
                                  )
                          ],
                        )
                  : SizedBox(),
                  Provider.of<EvaluProvider>(context).creer
                      ? Column(
                          children: [
                            Row(
                              children: [
                                ParamQuestions(
                                    name: 'Questions',
                                    paramQues: () {
                                      setState(() {
                                        quest = true;
                                      });
                                    }),
                                ParamQuestions(
                                    name: 'Paramétrages',
                                    paramQues: () {
                                      setState(() {
                                        quest = false;
                                      });
                                    }),
                              ],
                            ),
                            quest
                                ? AddQuestions()
                                : FutureBuilder(
                                    future: getdetail(storage.getItem('token')),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return EditQuizz(
                                          detail: snapshot.data!,
                                        );
                                      } else
                                        return CupertinoActivityIndicator();
                                    },
                                  )
                          ],
                        )
                      : SizedBox()
                ]))));
  }
}

class SousMenu extends StatelessWidget {
  const SousMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.grey),
              bottom: BorderSide(color: Colors.grey)),
          color: Colors.white),
      width: double.infinity,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SousMenuItem(name: 'Planning', callBack: () {}),
          SousMenuItem(name: 'Absences', callBack: () {}),
          SousMenuItem(
              name: 'Évaluations',
              callBack: () {
                Provider.of<EvaluProvider>(context, listen: false).setEvalu(
                    !Provider.of<EvaluProvider>(context, listen: false).evalu);


              }),
          SousMenuItem(name: 'Notes', callBack: () {}),
          SousMenuItem(name: 'Ressources', callBack: () {}),
          SousMenuItem(name: 'Participants', callBack: () {}),
          SousMenuItem(name: 'Discussions', callBack: () {}),
        ],
      ),
    );
  }
}

class SousMenuItem extends StatelessWidget {
  const SousMenuItem({super.key, required this.name, required this.callBack});
  final String name;
  final Function callBack;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Text(
          name,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'myfont',
            fontSize: screenWidth(context) >= 800 ? 12 : 8,
          ),
        ),
        onPressed: () {
          callBack();
        });
  }
}

class ParamQuestions extends StatelessWidget {
  const ParamQuestions(
      {super.key, required this.name, required this.paramQues});

  final String name;
  final Function paramQues;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 0.2)),
          child: TextButton(
            child: Text(name),
            onPressed: () {
              paramQues();
            },
          ),
        ),
      ],
    );
  }
}
