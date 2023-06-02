// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, camel_case_types, implementation_imports, unnecessary_import, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:footer/footer.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _accueilState();
}

class _accueilState extends State<Accueil> {
  bool solu = false;
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
                setState(() {
                  solu = false;
                });
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
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Solutions()),
                  );
                });
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
              height: 30,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    width: 600,
                    height: 400,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      "assets/img/learn.jpg",
                      width: 600,
                      height: 400,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: 600,
                    height: 400,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "L'enseignement est plus facile avec aptus",
                            style: TextStyle(
                                fontFamily: 'myfont',
                                fontSize: 40,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Avec nos solutions informatique nous vous facilitons votre travail",
                            style: TextStyle(
                                fontFamily: 'myfont',
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "conçoit des solutions ludiques et innovantes dédiées à l’enseignement et qui permettent de relever les défis de la gestion administrative pédagogique et de la formation Nous fournissons une expérience plus simple et puissante avec des fonctionnalités flexibles qui vous aident dans votre approche pédagogique",
                            style: TextStyle(
                                fontFamily: 'myfont',
                                fontSize: 15,
                                color: Colors.grey[700]),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              child: Text("En Savoir plus"),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 20)),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))))
                        ]),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            //  Footer(
            //   alignment: Alignment.center,
            //   backgroundColor: Color.fromARGB(255, 0, 0, 0),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       Container(
            //         height: 200,
            //         child: Row(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [

            //            Image.asset(
            //             "assets/img/aptu.jpg",
            //             width: 100,
            //             height: 50,
            //             ),

            //             Text("Aptus consulting"),

            //           ],
            //         ),
            //       ),
            //      Container(
            //       child: Divider(color: Colors.white,),
            //       margin: EdgeInsets.only(bottom: 150),
            //       )
            //     ],
            //   )

            //   )
          ],
        ),
      ),

      // bottomNavigationBar: Footer(),
    );
  }
}

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
      body: Column(
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
                child: Text(
                  "Educat",
                  style: TextStyle(fontFamily: 'myfont'),
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
                child: Text(
                  "E-learn",
                  style: TextStyle(fontFamily: 'myfont'),
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
                child: Text(
                  "Jeux d'entrprise",
                  style: TextStyle(fontFamily: 'myfont'),
                  ),
                alignment: Alignment.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      color: Colors.grey[900],
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Aptus Consulting',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.facebook,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Add functionality here
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Add functionality here
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Add functionality here
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
