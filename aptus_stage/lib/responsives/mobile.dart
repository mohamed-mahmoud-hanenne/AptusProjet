// ignore_for_file: unused_import, prefer_const_constructors

import 'package:aptus_stage/controllers/providers.dart';
import 'package:aptus_stage/responsives/desktop.dart';
import 'package:aptus_stage/views/screens/sidebar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:aptus_stage/responsives/resp_pages.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/material/dropdown.dart';
import 'dart:core';
import 'package:flutter/src/widgets/framework.dart';



class Mymobile extends StatefulWidget {
  const Mymobile({super.key});

  @override
  State<Mymobile> createState() => _MymobileState();
}

class _MymobileState extends State<Mymobile> {
  bool quest = true;
  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
  bool isChecked7 = false;



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
          actions: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.school),
                      color: Color.fromARGB(255, 17, 238, 254),
                      iconSize: 15),
                  Text(
                    "Formation",
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontFamily: "myfont",
                        fontSize: 10),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.calendar_month),
                      color: Color.fromARGB(255, 17, 238, 254),
                      iconSize: 15),
                  Text(
                    "2022-2023",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontFamily: "myfont",
                      fontSize: 10,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications),
                      color: Color.fromARGB(255, 17, 238, 254),
                      iconSize: 15),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.email),
                      color: Color.fromARGB(255, 17, 238, 254),
                      iconSize: 15),
                  CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.person),
                        color: Color.fromARGB(255, 17, 238, 254),
                        iconSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: ChangeNotifierProvider(
            create: (context) => EvaluProvider(),
            builder: (context, child) => SingleChildScrollView(
                  child: Column(
                    children: [
                      SousMenu(),
                      Provider.of<EvaluProvider>(context).evalu
                          ? Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey, width: 0.5)),
                              margin: EdgeInsets.all(20),
                              width: screenWidth(context) >= 800 ? 1250 : 800,
                              height: screenWidth(context) >= 800 ? 900 : 1200,
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Colors.grey,
                                                width: 0.2)),
                                        margin:
                                            EdgeInsets.fromLTRB(20, 10, 0, 0),
                                        child: TextButton(
                                          child: Text(
                                            'Questions',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'myfont',
                                              fontSize:
                                                  screenWidth(context) >= 800
                                                      ? 12
                                                      : 8,
                                            ),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              quest = true;
                                            });
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Colors.grey,
                                                width: 0.2)),
                                        margin: EdgeInsets.only(top: 10),
                                        child: TextButton(
                                          child: Text(
                                            'Paramétrage',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'myfont',
                                              fontSize:
                                                  screenWidth(context) >= 800
                                                      ? 12
                                                      : 8,
                                            ),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              quest = false;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  quest
                                      ? Container(
                                          child: Text(
                                            "Questions",
                                            style:
                                                TextStyle(color: Colors.amber),
                                          ),
                                        )
                                      : Container(
                                          margin:
                                              EdgeInsets.fromLTRB(20, 20, 0, 0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text("Session",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "myfont",
                                                            fontSize: screenWidth(
                                                                        context) >=
                                                                    800
                                                                ? 15
                                                                : 10)),
                                                    SizedBox(
                                                      width: screenWidth(
                                                                  context) >=
                                                              800
                                                          ? 115
                                                          : 95,
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          bottom: 10),
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors.grey,
                                                            width: 0.2,
                                                          ),
                                                          color:
                                                              Colors.grey[400]),
                                                      width: screenWidth(
                                                                  context) >=
                                                              800
                                                          ? 140
                                                          : 100,
                                                      height: screenWidth(
                                                                  context) >=
                                                              800
                                                          ? 20
                                                          : 40,
                                                      child: DropdownButton(
                                                        dropdownColor:
                                                            Color.fromARGB(255,
                                                                20, 237, 226),
                                                        iconEnabledColor:
                                                            Color.fromARGB(255,
                                                                20, 237, 226),
                                                        isExpanded: true,
                                                        items: [
                                                           DropdownMenuItem(
                                                      child: Text(
                                                        'Normale',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color: Colors.black,
                                                            fontFamily: "myfont",
                                                            ),
                                                      ),
                                                      value: 'Normale',
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text(
                                                        'Complementaire',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color: Colors.black,
                                                            fontFamily: "myfont",
                                                            ),
                                                      ),
                                                      value: 'Complementaire',
                                                    ),
                                                        ],
                                                        onChanged: (value) {}
                                                       
                                                        
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Row(children: [
                                                  Text("Coeficient",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: "myfont",
                                                          fontSize: screenWidth(
                                                                      context) >=
                                                                  800
                                                              ? 15
                                                              : 10)),
                                                  SizedBox(
                                                    width:
                                                        screenWidth(context) >=
                                                                800
                                                            ? 115
                                                            : 95,
                                                  ),
                                                  Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey,
                                                              width: 0.2)),
                                                      width: screenWidth(
                                                                  context) >=
                                                              800
                                                          ? 140
                                                          : 100,
                                                      height: screenWidth(
                                                                  context) >=
                                                              800
                                                          ? 20
                                                          : 40,
                                                      child: TextField(
                                                        decoration:
                                                            InputDecoration(
                                                                hintStyle:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "myfont",
                                                                ),
                                                                suffixIcon:
                                                                    Icon(
                                                                  Icons.percent,
                                                                  size: 20,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          20,
                                                                          237,
                                                                          226),
                                                                ),
                                                                border:
                                                                    InputBorder
                                                                        .none),
                                                      ))
                                                ]),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                        "Date et heure de début",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "myfont",
                                                            fontSize: screenWidth(
                                                                        context) >=
                                                                    800
                                                                ? 15
                                                                : 10)),
                                                    SizedBox(
                                                      width: screenWidth(
                                                                  context) >=
                                                              800
                                                          ? 25
                                                          : 35,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey,
                                                              width: 0.2)),
                                                      width: screenWidth(
                                                                  context) >=
                                                              800
                                                          ? 140
                                                          : 100,
                                                      height: screenWidth(
                                                                  context) >=
                                                              800
                                                          ? 20
                                                          : 40,
                                                      child: TextField(
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Row(
                                                  children: [
                                                    Text("Date et heure de fin",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "myfont",
                                                            fontSize: screenWidth(
                                                                        context) >=
                                                                    800
                                                                ? 15
                                                                : 10)),
                                                    SizedBox(
                                                      width: screenWidth(
                                                                  context) >=
                                                              800
                                                          ? 75
                                                          : 50,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey,
                                                              width: 0.2)),
                                                      width: screenWidth(
                                                                  context) >=
                                                              800
                                                          ? 140
                                                          : 100,
                                                      height: screenWidth(
                                                                  context) >=
                                                              800
                                                          ? 20
                                                          : 40,
                                                      child: TextField(
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                        "Temps additionnel (min)",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "myfont",
                                                            fontSize: screenWidth(
                                                                        context) >=
                                                                    800
                                                                ? 15
                                                                : 10)),
                                                    SizedBox(
                                                      width: screenWidth(
                                                                  context) >=
                                                              800
                                                          ? 15
                                                          : 28,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey,
                                                              width: 0.2)),
                                                      width: screenWidth(
                                                                  context) >=
                                                              800
                                                          ? 140
                                                          : 100,
                                                      height: screenWidth(
                                                                  context) >=
                                                              800
                                                          ? 20
                                                          : 40,
                                                      child: TextField(
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: screenWidth(
                                                                  context) >=
                                                              800
                                                          ? 60
                                                          : 25,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                        "Date et heure de publication",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "myfont",
                                                            fontSize: screenWidth(
                                                                        context) >=
                                                                    800
                                                                ? 15
                                                                : 10)),
                                                    SizedBox(
                                                      width: screenWidth(
                                                                  context) >=
                                                              800
                                                          ? 15
                                                          : 10,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey,
                                                              width: 0.2)),
                                                      width: screenWidth(
                                                                  context) >=
                                                              800
                                                          ? 140
                                                          : 100,
                                                      height: screenWidth(
                                                                  context) >=
                                                              800
                                                          ? 20
                                                          : 40,
                                                      child: TextField(
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Checkbox(
                                                            value: isChecked,
                                                            onChanged:
                                                                (bool? value) {
                                                              setState(() {
                                                                isChecked =
                                                                    value!;
                                                              });
                                                            }),
                                                        SizedBox(
                                                          width: screenWidth(
                                                                      context) >=
                                                                  800
                                                              ? 15
                                                              : 10,
                                                        ),
                                                        Text(
                                                            "Autoriser la modification aprés envoi",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontFamily:
                                                                    "myfont",
                                                                fontSize:
                                                                    screenWidth(context) >=
                                                                            800
                                                                        ? 15
                                                                        : 10)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("Afficher",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontFamily:
                                                                    "myfont",
                                                                fontSize:
                                                                    screenWidth(context) >=
                                                                            800
                                                                        ? 15
                                                                        : 10)),
                                                        SizedBox(
                                                          width: screenWidth(
                                                                      context) >=
                                                                  800
                                                              ? 15
                                                              : 10,
                                                        ),
                                                        ElevatedButton(
                                                          onPressed: () {},
                                                          child: Text(""),
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all(Colors
                                                                              .grey[
                                                                          300])),
                                                        ),
                                                        SizedBox(
                                                          width: screenWidth(
                                                                      context) >=
                                                                  800
                                                              ? 15
                                                              : 10,
                                                        ),
                                                        Text(
                                                            "questions par page",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontFamily:
                                                                    "myfont",
                                                                fontSize:
                                                                    screenWidth(context) >=
                                                                            800
                                                                        ? 15
                                                                        : 10))
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Checkbox(
                                                            value: isChecked2,
                                                            onChanged:
                                                                (bool? value) {
                                                              setState(() {
                                                                isChecked2 =
                                                                    value!;
                                                              });
                                                            }),
                                                        SizedBox(
                                                          width: screenWidth(
                                                                      context) >=
                                                                  800
                                                              ? 15
                                                              : 10,
                                                        ),
                                                        Text(
                                                            "Mélanger les questions",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontFamily:
                                                                    "myfont",
                                                                fontSize:
                                                                    screenWidth(context) >=
                                                                            800
                                                                        ? 15
                                                                        : 10)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Checkbox(
                                                            value: isChecked3,
                                                            onChanged:
                                                                (bool? value) {
                                                              setState(() {
                                                                isChecked3 =
                                                                    value!;
                                                              });
                                                            }),
                                                        SizedBox(
                                                          width: screenWidth(
                                                                      context) >=
                                                                  800
                                                              ? 15
                                                              : 10,
                                                        ),
                                                        Text(
                                                            "Mélanger les reponses",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontFamily:
                                                                    "myfont",
                                                                fontSize:
                                                                    screenWidth(context) >=
                                                                            800
                                                                        ? 15
                                                                        : 10)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Checkbox(
                                                            value: isChecked4,
                                                            onChanged:
                                                                (bool? value) {
                                                              setState(() {
                                                                isChecked4 =
                                                                    value!;
                                                              });
                                                            }),
                                                        SizedBox(
                                                          width: screenWidth(
                                                                      context) >=
                                                                  800
                                                              ? 15
                                                              : 10,
                                                        ),
                                                        Text(
                                                            "Distrubition aléatoire des questions",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontFamily:
                                                                    "myfont",
                                                                fontSize:
                                                                    screenWidth(context) >=
                                                                            800
                                                                        ? 15
                                                                        : 10)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        ElevatedButton(
                                                          onPressed: () {},
                                                          child: Text(""),
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all(Colors
                                                                              .grey[
                                                                          300])),
                                                        ),
                                                        SizedBox(
                                                          width: screenWidth(
                                                                      context) >=
                                                                  800
                                                              ? 15
                                                              : 10,
                                                        ),
                                                        Text(
                                                            "questions par étudiant",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontFamily:
                                                                    "myfont",
                                                                fontSize:
                                                                    screenWidth(context) >=
                                                                            800
                                                                        ? 15
                                                                        : 10)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Checkbox(
                                                            value: isChecked5,
                                                            onChanged:
                                                                (bool? value) {
                                                              setState(() {
                                                                isChecked5 =
                                                                    value!;
                                                              });
                                                            }),
                                                        SizedBox(
                                                          width: screenWidth(
                                                                      context) >=
                                                                  800
                                                              ? 15
                                                              : 10,
                                                        ),
                                                        Text(
                                                            "Interdire la navigation libre",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontFamily:
                                                                    "myfont",
                                                                fontSize:
                                                                    screenWidth(context) >=
                                                                            800
                                                                        ? 15
                                                                        : 10)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Checkbox(
                                                            value: isChecked6,
                                                            onChanged:
                                                                (bool? value) {
                                                              setState(() {
                                                                isChecked6 =
                                                                    value!;
                                                              });
                                                            }),
                                                        SizedBox(
                                                          width: screenWidth(
                                                                      context) >=
                                                                  800
                                                              ? 15
                                                              : 10,
                                                        ),
                                                        Text(
                                                            "Désactiver la correction automatique",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontFamily:
                                                                    "myfont",
                                                                fontSize:
                                                                    screenWidth(context) >=
                                                                            800
                                                                        ? 15
                                                                        : 10)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Checkbox(
                                                            value: isChecked7,
                                                            onChanged:
                                                                (bool? value) {
                                                              setState(() {
                                                                isChecked7 =
                                                                    value!;
                                                              });
                                                            }),
                                                        SizedBox(
                                                          width: screenWidth(
                                                                      context) >=
                                                                  800
                                                              ? 15
                                                              : 10,
                                                        ),
                                                        Text(
                                                            "Activer la correction par systéme canadien",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontFamily:
                                                                    "myfont",
                                                                fontSize:
                                                                    screenWidth(context) >=
                                                                            800
                                                                        ? 15
                                                                        : 10)),
                                                        SizedBox(
                                                          width: screenWidth(
                                                                      context) >=
                                                                  800
                                                              ? 25
                                                              : 20,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text("Point négatif",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontFamily:
                                                                    "myfont",
                                                                fontSize:
                                                                    screenWidth(context) >=
                                                                            800
                                                                        ? 15
                                                                        : 10)),
                                                        SizedBox(
                                                          width: screenWidth(
                                                                      context) >=
                                                                  800
                                                              ? 15
                                                              : 10,
                                                        ),
                                                        ElevatedButton(
                                                          onPressed: () {},
                                                          child: Text(""),
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all(Colors
                                                                              .grey[
                                                                          300])),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ))
                                ],
                              ),
                            )
                          : SizedBox()
                    ],
                  ),
                )));
  }
}

class SousMenu extends StatelessWidget {
  const SousMenu({super.key});

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
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SousMenuItem(name: 'Planning', callBack: () {}),
            SousMenuItem(name: 'Absences', callBack: () {}),
            SousMenuItem(
                name: 'Évaluations',
                callBack: () {
                  Provider.of<EvaluProvider>(context, listen: false).setEvalu(
                      !Provider.of<EvaluProvider>(context, listen: false)
                          .evalu);
                }),
            SousMenuItem(name: 'Notes', callBack: () {}),
            SousMenuItem(name: 'Ressources', callBack: () {}),
            SousMenuItem(name: 'Participants', callBack: () {}),
            SousMenuItem(name: 'Discussions', callBack: () {}),
          ],
        ),
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
