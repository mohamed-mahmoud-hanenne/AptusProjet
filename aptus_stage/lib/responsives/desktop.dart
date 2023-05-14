// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:aptus_stage/controllers/providers.dart';
import 'package:aptus_stage/responsives/evalu.dart';
import 'package:aptus_stage/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  bool isChecked = false;

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
                        height: screenWidth(context) >= 800 ? 400 : 500,
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
                                    child: Text(
                                      "Questions",
                                      style: TextStyle(color: Colors.amber),
                                    ),
                                  )
                                : Container(
                                    margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
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
                                                    fontSize:
                                                        screenWidth(context) >=
                                                                800
                                                            ? 15
                                                            : 10)),
                                            SizedBox(
                                              width: screenWidth(context) >= 800
                                                  ? 115
                                                  : 80,
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 10),
                                              margin: EdgeInsets.only(left: 10),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 0.2)),
                                              width: screenWidth(context) >= 800
                                                  ? 140
                                                  : 100,
                                              height:
                                                  screenWidth(context) >= 800
                                                      ? 20
                                                      : 20,
                                              child: DropdownButton(
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
                                              width: screenWidth(context) >= 800
                                                  ? 65
                                                  : 25,
                                            ),
                                            Text("Coeficient",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "myfont",
                                                    fontSize:
                                                        screenWidth(context) >=
                                                                800
                                                            ? 15
                                                            : 10)),
                                            SizedBox(
                                              width: screenWidth(context) >= 800
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
                                              width: screenWidth(context) >= 800
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
                                                    fontSize:
                                                        screenWidth(context) >=
                                                                800
                                                            ? 15
                                                            : 10)),
                                            SizedBox(
                                              width: screenWidth(context) >= 800
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
                                              width: screenWidth(context) >= 800
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
                                              width: screenWidth(context) >= 800
                                                  ? 60
                                                  : 25,
                                            ),
                                            Text("Date et heure de fin",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "myfont",
                                                    fontSize:
                                                        screenWidth(context) >=
                                                                800
                                                            ? 15
                                                            : 10)),
                                            SizedBox(
                                              width: screenWidth(context) >= 800
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
                                              width: screenWidth(context) >= 800
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
                                                    fontSize:
                                                        screenWidth(context) >=
                                                                800
                                                            ? 15
                                                            : 10)),

                                              SizedBox(
                                              width: screenWidth(context) >= 800
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
                                              width: screenWidth(context) >= 800
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
                                              width: screenWidth(context) >= 800
                                                  ? 60
                                                  : 25,
                                            ),

                                            Text("Date et heure de publication",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "myfont",
                                                    fontSize:
                                                        screenWidth(context) >=
                                                                800
                                                            ? 15
                                                            : 10)),

                                              SizedBox(
                                              width: screenWidth(context) >= 800
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
                                              width: screenWidth(context) >= 800
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

                                        Column(
                                          children: [
                                            Checkbox(
                                               value: isChecked,
                                                onChanged: (bool? value) {
                                                setState(() {
                                              isChecked = value!;
                                           });
                                                }
                                            )
                                          ],
                                        )
                                      ],
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

class Questions extends StatelessWidget {
  const Questions({super.key, required this.name, required this.ReturnEvalu});
  final String name;
  final Function ReturnEvalu;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: TextButton(
          child: Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'myfont',
              fontSize: screenWidth(context) >= 800 ? 12 : 8,
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
