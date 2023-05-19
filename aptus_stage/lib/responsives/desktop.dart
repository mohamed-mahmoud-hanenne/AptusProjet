// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:aptus_stage/controllers/providers.dart';
import 'package:aptus_stage/responsives/evalu.dart';
import 'package:aptus_stage/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:localstorage/localstorage.dart';


double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
String dropdownValue = list.first;

class MyDesktop extends StatefulWidget {
  const MyDesktop({super.key});

  @override
  State<MyDesktop> createState() => _MyDesktopState();
}

class _MyDesktopState extends State<MyDesktop> {

  bool quest = true;
  bool ajouter = false;
  bool importer = false;
  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
  bool isChecked7 = false;

  var selected = "QCM - Une seule réponse";
  var select = "Oui";

  // Future<void> getquestion() async{

  //   final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/');
  //   final response = await http.get(url);
  //   final responsebody = jsonDecode(response.body);
  //   return responsebody;
  // }

  final LocalStorage storage = new LocalStorage('todo_app.json');
  late String mytokens ;

  static const urlquiz = 'http://srv4.aptusmaroc.com:8000/courses/quizzes';
  Future<void> makeGetRequest() async {
   
    var res;
    final url = Uri.parse('$urlquiz');
    await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'token $mytokens',
    }).then((response) {
      res = jsonDecode(response.body);
      
      // print(responsebody[1]['title']) ;
    }).catchError((error) {
      print('Error: $error');
    });
    return res;
  }
  @override
  void initState(){
    super.initState();
    mytokens =  storage.getItem('token') ;
    
  }
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

            // if(MediaQuery.of(context).size.width >=900)
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
            child: Column(
              children: [
                SousMenu(),
                Provider.of<EvaluProvider>(context).evalu
                    ? Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5)),
                        margin: EdgeInsets.all(20),
                        width: screenWidth(context) >= 800 ? 1250 : 800,
                        height: screenWidth(context) >= 800 ? 900 : 700,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Colors.grey, width: 0.2)),
                                  margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                  child: TextButton(
                                    child: Text(
                                      'Questions',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'myfont',
                                        fontSize: screenWidth(context) >= 800
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
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Colors.grey, width: 0.2)),
                                  margin: EdgeInsets.only(top: 10),
                                  child: TextButton(
                                    child: Text(
                                      'Paramétrage',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'myfont',
                                        fontSize: screenWidth(context) >= 800
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
                                    decoration: BoxDecoration(
                                        // color: Colors.grey[200],
                                        ),
                                    margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                                    child: SingleChildScrollView(
                                        child: Column(children: [
                                      ajouter
                                          ? Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 0.5)),
                                              margin: EdgeInsets.all(20),
                                              width: screenWidth(context) >= 800
                                                  ? 900
                                                  : 600,
                                              height:
                                                  screenWidth(context) >= 800
                                                      ? 400
                                                      : 400,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text("Questions",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                                                            ? 40
                                                            : 20,
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 10),
                                                        margin: EdgeInsets.only(
                                                            left: 10),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color:
                                                                    Colors.grey,
                                                                width: 0.2)),
                                                        width: screenWidth(
                                                                    context) >=
                                                                800
                                                            ? 200
                                                            : 100,
                                                        height: screenWidth(
                                                                    context) >=
                                                                800
                                                            ? 25
                                                            : 20,
                                                        child: DropdownButton(
                                                          isExpanded: true,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "myfont",
                                                              fontSize: 10,
                                                              color: Colors
                                                                  .grey[700]),
                                                          value: selected,
                                                          items: [
                                                            "QCM - Une seule réponse",
                                                            "QCM - Réponses multiples autorisées",
                                                            "Réponse longue",
                                                            "Réponse courte",
                                                            "Correspondance",
                                                            "Numérique",
                                                            "Champs à remplir"
                                                          ]
                                                              .map((e) =>
                                                                  DropdownMenuItem(
                                                                    child: Text(
                                                                        '$e'),
                                                                    value: e,
                                                                  ))
                                                              .toList(),
                                                          onChanged: (val) {
                                                            setState(() {
                                                              selected = val!;
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: screenWidth(
                                                                    context) >=
                                                                800
                                                            ? 40
                                                            : 20,
                                                      ),
                                                      Text(
                                                          "Mélanger les réponses",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                                                            ? 40
                                                            : 20,
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 10),
                                                        margin: EdgeInsets.only(
                                                            left: 10),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color:
                                                                    Colors.grey,
                                                                width: 0.2)),
                                                        width: screenWidth(
                                                                    context) >=
                                                                800
                                                            ? 100
                                                            : 80,
                                                        height: screenWidth(
                                                                    context) >=
                                                                800
                                                            ? 20
                                                            : 20,
                                                        child: DropdownButton(
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "myfont",
                                                                fontSize: 10,
                                                                color: Colors
                                                                    .grey[700]),
                                                            isExpanded: true,
                                                            value: select,
                                                            items: [
                                                              "Oui",
                                                              "Non"
                                                            ]
                                                                .map((e) =>
                                                                    DropdownMenuItem(
                                                                      child: Text(
                                                                          '$e'),
                                                                      value: e,
                                                                    ))
                                                                .toList(),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                select = value!;
                                                              });
                                                            }),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                          padding:
                                                              EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          100),
                                                          alignment: Alignment
                                                              .center,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              border: Border
                                                                  .all(
                                                                      color: Colors
                                                                          .grey,
                                                                      width:
                                                                          0.5)),
                                                          margin:
                                                              EdgeInsets
                                                                  .only(
                                                                      left: 50),
                                                          width: screenWidth(
                                                                      context) >=
                                                                  800
                                                              ? 620
                                                              : 500,
                                                          height: screenWidth(
                                                                      context) >=
                                                                  800
                                                              ? 200
                                                              : 200,
                                                          child: TextField(
                                                            decoration: InputDecoration(
                                                                hintStyle: TextStyle(
                                                                    fontFamily:
                                                                        "myfont")),
                                                          ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            border: Border.all(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        84,
                                                                        211,
                                                                        239),
                                                                width: 0.5)),
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                20, 10, 0, 0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .picture_as_pdf,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      84,
                                                                      211,
                                                                      239),
                                                              size: 15,
                                                            ),
                                                            TextButton(
                                                              child: Text(
                                                                'Enregistrer la question',
                                                                style:
                                                                    TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          84,
                                                                          211,
                                                                          239),
                                                                  fontFamily:
                                                                      'myfont',
                                                                  fontSize:
                                                                      screenWidth(context) >=
                                                                              800
                                                                          ? 12
                                                                          : 8,
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                setState(() {});
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            border: Border.all(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        84,
                                                                        211,
                                                                        239),
                                                                width: 0.5)),
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                20, 10, 0, 0),
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Icon(
                                                              Icons.clear,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      84,
                                                                      211,
                                                                      239),
                                                              size: 15,
                                                            ),
                                                            TextButton(
                                                              child: Text(
                                                                'Annuler',
                                                                style:
                                                                    TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          84,
                                                                          211,
                                                                          239),
                                                                  fontFamily:
                                                                      'myfont',
                                                                  fontSize:
                                                                      screenWidth(context) >=
                                                                              800
                                                                          ? 12
                                                                          : 8,
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                setState(() {
                                                                  ajouter =
                                                                      false;
                                                                });
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Container(
                                              alignment: Alignment.center,
                                              width: screenWidth(context) >= 800
                                                  ? 1100
                                                  : 600,
                                              height:
                                                  screenWidth(context) >= 800
                                                      ? 200
                                                      : 200,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                              ),
                                              child: FutureBuilder(
                                                  future: makeGetRequest(),
                                                  builder: (BuildContext
                                                          context,
                                                      AsyncSnapshot snapshot) {
                                                    if (snapshot.hasData) {
                                                      return ListView.builder(
                                                          itemCount: 5,
                                                          itemBuilder:
                                                              (context, i) {
                                                            return Padding(
                                                              padding: EdgeInsets.all(20),
                                                              child: Table(
                                                                border: TableBorder.all(color: Colors.white),
                                                                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                                                children: [
                                                                  TableRow(
                                                                    decoration: BoxDecoration(
                                                                      color: Colors.grey
                                                                    ),
                                                                    children: [
                                                                      TableCell(
                                                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                                                        child: Padding(
                                                                          padding: EdgeInsets.all(10),
                                                                          child: Text(snapshot.data[i]['title']),
                                                                          ),
                                                                        ),

                                                                            TableCell(
                                                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                                                        child: Padding(
                                                                          padding: EdgeInsets.all(10),
                                                                          child: Text(snapshot.data[i]['description']),
                                                                          ),
                                                                        ),
                                                                            TableCell(
                                                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                                                        child: Padding(
                                                                          padding: EdgeInsets.all(10),
                                                                          child: Text(snapshot.data[i]['coeff'].toString()),
                                                                          ),
                                                                        ),

                                                                        TableCell(
                                                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                                                        child: Padding(
                                                                          padding: EdgeInsets.all(10),
                                                                          child: Text(snapshot.data[i]['publication_date'].toString()),
                                                                          ),
                                                                        ),
                                                                    ]
                                                                  ),
                                                                  
                                                                ],
                                                                
                                                              ),
                                                            );
                                                          });
                                                    } else
                                                      return CircularProgressIndicator();
                                                  })),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 84, 211, 239),
                                                    width: 0.5)),
                                            margin: EdgeInsets.fromLTRB(
                                                20, 10, 0, 0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.add,
                                                  color: Color.fromARGB(
                                                      255, 84, 211, 239),
                                                  size: 15,
                                                ),
                                                TextButton(
                                                  child: Text(
                                                    'Ajouter',
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 84, 211, 239),
                                                      fontFamily: 'myfont',
                                                      fontSize: screenWidth(
                                                                  context) >=
                                                              800
                                                          ? 12
                                                          : 8,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      ajouter = true;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 84, 211, 239),
                                                    width: 0.5)),
                                            margin: EdgeInsets.fromLTRB(
                                                20, 10, 0, 0),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Icon(
                                                  Icons.cloud_download,
                                                  color: Color.fromARGB(
                                                      255, 84, 211, 239),
                                                  size: 15,
                                                ),
                                                TextButton(
                                                  child: Text(
                                                    'Importer',
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 84, 211, 239),
                                                      fontFamily: 'myfont',
                                                      fontSize: screenWidth(
                                                                  context) >=
                                                              800
                                                          ? 12
                                                          : 8,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      importer = true;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ])))
                                : Container(
                                    margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
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
                                                      fontFamily: "myfont",
                                                      fontSize: screenWidth(
                                                                  context) >=
                                                              800
                                                          ? 15
                                                          : 10)),
                                              SizedBox(
                                                width:
                                                    screenWidth(context) >= 800
                                                        ? 115
                                                        : 80,
                                              ),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(bottom: 10),
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey,
                                                        width: 0.2)),
                                                width:
                                                    screenWidth(context) >= 800
                                                        ? 140
                                                        : 100,
                                                height:
                                                    screenWidth(context) >= 800
                                                        ? 20
                                                        : 20,
                                                child: DropdownButton(
                                                  dropdownColor: Color.fromARGB(
                                                      255, 20, 237, 226),
                                                  iconEnabledColor:
                                                      Color.fromARGB(
                                                          255, 20, 237, 226),
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
                                                  onChanged: (value) {},
                                                ),
                                              ),
                                              SizedBox(
                                                width:
                                                    screenWidth(context) >= 800
                                                        ? 65
                                                        : 25,
                                              ),
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
                                                    screenWidth(context) >= 800
                                                        ? 140
                                                        : 130,
                                              ),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(bottom: 8),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey,
                                                        width: 0.2)),
                                                width:
                                                    screenWidth(context) >= 800
                                                        ? 140
                                                        : 100,
                                                height:
                                                    screenWidth(context) >= 800
                                                        ? 20
                                                        : 20,
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                      hintStyle: TextStyle(
                                                        fontFamily: "myfont",
                                                      ),
                                                      suffixIcon: Icon(
                                                        Icons.percent,
                                                        size: 20,
                                                        color: Color.fromARGB(
                                                            255, 20, 237, 226),
                                                      ),
                                                      border: InputBorder.none),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Row(
                                            children: [
                                              Text("Date et heure de début",
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
                                                    screenWidth(context) >= 800
                                                        ? 25
                                                        : 20,
                                              ),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(bottom: 8),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey,
                                                        width: 0.2)),
                                                width:
                                                    screenWidth(context) >= 800
                                                        ? 140
                                                        : 100,
                                                height:
                                                    screenWidth(context) >= 800
                                                        ? 20
                                                        : 20,
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none),
                                                ),
                                              ),
                                              SizedBox(
                                                width:
                                                    screenWidth(context) >= 800
                                                        ? 60
                                                        : 25,
                                              ),
                                              Text("Date et heure de fin",
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
                                                    screenWidth(context) >= 800
                                                        ? 75
                                                        : 85,
                                              ),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(bottom: 8),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey,
                                                        width: 0.2)),
                                                width:
                                                    screenWidth(context) >= 800
                                                        ? 140
                                                        : 100,
                                                height:
                                                    screenWidth(context) >= 800
                                                        ? 20
                                                        : 20,
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Row(
                                            children: [
                                              Text("Temps additionnel (min)",
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
                                                    screenWidth(context) >= 800
                                                        ? 15
                                                        : 15,
                                              ),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(bottom: 8),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey,
                                                        width: 0.2)),
                                                width:
                                                    screenWidth(context) >= 800
                                                        ? 140
                                                        : 100,
                                                height:
                                                    screenWidth(context) >= 800
                                                        ? 20
                                                        : 20,
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none),
                                                ),
                                              ),
                                              SizedBox(
                                                width:
                                                    screenWidth(context) >= 800
                                                        ? 60
                                                        : 25,
                                              ),
                                              Text(
                                                  "Date et heure de publication",
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
                                                    screenWidth(context) >= 800
                                                        ? 15
                                                        : 45,
                                              ),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(bottom: 8),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey,
                                                        width: 0.2)),
                                                width:
                                                    screenWidth(context) >= 800
                                                        ? 140
                                                        : 100,
                                                height:
                                                    screenWidth(context) >= 800
                                                        ? 20
                                                        : 20,
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none),
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
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isChecked = value!;
                                                        });
                                                      }),
                                                  SizedBox(
                                                    width:
                                                        screenWidth(context) >=
                                                                800
                                                            ? 15
                                                            : 10,
                                                  ),
                                                  Text(
                                                      "Autoriser la modification aprés envoi",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: "myfont",
                                                          fontSize: screenWidth(
                                                                      context) >=
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
                                                            ? 15
                                                            : 10,
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {},
                                                    child: Text(""),
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(
                                                                    Colors.grey[
                                                                        300])),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        screenWidth(context) >=
                                                                800
                                                            ? 15
                                                            : 10,
                                                  ),
                                                  Text("questions par page",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: "myfont",
                                                          fontSize: screenWidth(
                                                                      context) >=
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
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isChecked2 = value!;
                                                        });
                                                      }),
                                                  SizedBox(
                                                    width:
                                                        screenWidth(context) >=
                                                                800
                                                            ? 15
                                                            : 10,
                                                  ),
                                                  Text("Mélanger les questions",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: "myfont",
                                                          fontSize: screenWidth(
                                                                      context) >=
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
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isChecked3 = value!;
                                                        });
                                                      }),
                                                  SizedBox(
                                                    width:
                                                        screenWidth(context) >=
                                                                800
                                                            ? 15
                                                            : 10,
                                                  ),
                                                  Text("Mélanger les reponses",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: "myfont",
                                                          fontSize: screenWidth(
                                                                      context) >=
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
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isChecked4 = value!;
                                                        });
                                                      }),
                                                  SizedBox(
                                                    width:
                                                        screenWidth(context) >=
                                                                800
                                                            ? 15
                                                            : 10,
                                                  ),
                                                  Text(
                                                      "Distrubition aléatoire des questions",
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
                                                            ? 15
                                                            : 10,
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {},
                                                    child: Text(""),
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(
                                                                    Colors.grey[
                                                                        300])),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        screenWidth(context) >=
                                                                800
                                                            ? 15
                                                            : 10,
                                                  ),
                                                  Text("questions par étudiant",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: "myfont",
                                                          fontSize: screenWidth(
                                                                      context) >=
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
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isChecked5 = value!;
                                                        });
                                                      }),
                                                  SizedBox(
                                                    width:
                                                        screenWidth(context) >=
                                                                800
                                                            ? 15
                                                            : 10,
                                                  ),
                                                  Text(
                                                      "Interdire la navigation libre",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: "myfont",
                                                          fontSize: screenWidth(
                                                                      context) >=
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
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isChecked6 = value!;
                                                        });
                                                      }),
                                                  SizedBox(
                                                    width:
                                                        screenWidth(context) >=
                                                                800
                                                            ? 15
                                                            : 10,
                                                  ),
                                                  Text(
                                                      "Désactiver la correction automatique",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: "myfont",
                                                          fontSize: screenWidth(
                                                                      context) >=
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
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isChecked7 = value!;
                                                        });
                                                      }),
                                                  SizedBox(
                                                    width:
                                                        screenWidth(context) >=
                                                                800
                                                            ? 15
                                                            : 10,
                                                  ),
                                                  Text(
                                                      "Activer la correction par systéme canadien",
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
                                                            ? 25
                                                            : 20,
                                                  ),
                                                  Text("Point négatif",
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
                                                            ? 15
                                                            : 10,
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {},
                                                    child: Text(""),
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(
                                                                    Colors.grey[
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
                    : SizedBox(),
              ],
            ),
          ),
        ));
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
