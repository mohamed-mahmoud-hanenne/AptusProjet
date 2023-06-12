// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Solutions extends StatefulWidget {
  const Solutions({super.key});

  @override
  State<Solutions> createState() => _SolutionsState();
}

class _SolutionsState extends State<Solutions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/img/APTUS-Software.png',
          width: 150,
          height: 80,
        ),
        actions: [
          TextButton(
              onPressed: () {
                setState(() {});
              },
              child: Text(
                "Accueil",
                style: TextStyle(
                    fontFamily: 'myfont',
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold),
              )),
          SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: () {
                setState(() {});
              },
              child: Text(
                "Solutions",
                style: TextStyle(
                    fontFamily: 'myfont',
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold),
              )),
          SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "À propos",
                style: TextStyle(
                    fontFamily: 'myfont',
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold),
              )),
          SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "Contact",
                style: TextStyle(
                    fontFamily: 'myfont',
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold),
              )),
          SizedBox(
            width: 520,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/login");
              },
              child: Text(
                "Login",
                style: TextStyle(
                    fontFamily: 'myfont',
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold),
              )),
          SizedBox(
            width: 50,
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/sign");
                },
                child: Text(
                  "Sign in",
                  style: TextStyle(
                      fontFamily: 'myfont',
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))))),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 1380,
              height: 80,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 66, 246, 240),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Pour plusieus informations",
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'myfont')),
                  SizedBox(
                    width: 20,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Cliquer ici",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'myfont',
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Educat",
                          style: TextStyle(fontFamily: 'myfont'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: Text(
                            "Une plateforme de gestion administrative et pédagogique avancée pour les établissements dédiés à l'enseignement primaire, secondaire et supérieur.",
                            style: TextStyle(
                                fontFamily: 'myfont', color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  alignment: Alignment.center,
                ),
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "E-learn",
                          style: TextStyle(fontFamily: 'myfont'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: Text(
                            "Une solution e-learning à la pointe de technologie : Créez et gérez du contenu, dispensez des formations et mesurez l’impact sur votre établissement ou entreprise.",
                            style: TextStyle(
                                fontFamily: 'myfont', color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  alignment: Alignment.center,
                ),
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Jeux d'entreprise",
                          style: TextStyle(fontFamily: 'myfont'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: Text(
                            "Un outil pédagogique efficace et innovant basé sur des cas concrets d'entreprises et qui vous aide à améliorer le savoir faire et être de votre équipe.",
                            style: TextStyle(
                                fontFamily: 'myfont', color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  alignment: Alignment.center,
                ),
              ],
            ),
            SizedBox(height: 80),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 1370,
                    height: 100,
                    decoration: BoxDecoration(color: Colors.black),
                    child: Container(
                      margin: EdgeInsets.only(left: 600),
                      child: ListTile(
                        title: Text(
                          "2023 SFE",
                          style: TextStyle(
                              color: Colors.white, fontFamily: "myfont"),
                        ),
                        leading: Icon(
                          Icons.copyright,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
