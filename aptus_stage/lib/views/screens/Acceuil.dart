// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, camel_case_types, implementation_imports, unnecessary_import, avoid_unnecessary_containers

import 'package:aptus_stage/views/screens/apropos.dart';
import 'package:aptus_stage/views/screens/contacts.dart';
import 'package:aptus_stage/views/screens/solutions.dart';
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
              onPressed: () {
                setState(() {
                                   Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  MyHomePage()),
                                );
                });
              },
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
              onPressed: () {
                  // setState(() {
                  //   Navigator.push(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                     builder: (context) =>  HomePage()),
                  //               );
                  // });
              },
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
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 66, 246, 240)),
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
                color: Colors.black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Pour plus d'infos",
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // FadeTransition(
                  //   opacity: ,
                  //   child: Text("data"),
                  //   ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(15)),
                    child: Image.asset(
                      "assets/img/acc-img.png",
                      width: 600,
                      height: 400,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),

                  Column(
                    children: [
                      Container(
                        
                        alignment: Alignment.center,
                        child: Text(
                          "L'enseignement est facile avec",
                          style: TextStyle(
                              fontFamily: 'myfont',
                              fontSize: 30,
                              color: Colors.black),
                        ),
                        
                      ),
                      SizedBox(height: 20,),
                      Text(
                          "aptus consulting",
                          style: TextStyle(
                              fontFamily: 'myfont',
                              fontSize: 30,
                              color: Color.fromARGB(255, 66, 246, 240)),
                        ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Image.asset(
                        "assets/img/etudiant.png",
                         width: 600,
                        height: 500,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(150, 180, 0, 0),
                      width: 400,
                      height: 400,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Découvrez APTUS",
                            style: TextStyle(fontFamily: "myfont", fontSize: 20),
                          ),
                          SizedBox(height: 30,),
                          Text(
                            "Aptus Consulting conçoit des solutions ludiques et innovantes dédiées à l’enseignement et qui permettent de relever les défis de la gestion administrative, pédagogique et de la formation Nous fournissons une expérience plus simple et puissante avec des fonctionnalités flexibles qui vous aident dans votre approche pédagogique",
                             style: TextStyle(fontFamily: "myfont"),
                            ),

                            SizedBox(height: 30,),
                                 ElevatedButton(
                              onPressed: () {},
                              child: Text("En Savoir plus"),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 20)),
                                  backgroundColor:
                                      MaterialStateProperty.all(Color.fromARGB(255, 66, 246, 240)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))))
                        ],
                      ),
                    ),
                    
                  ],
                ),
              ],
            ),

               SizedBox(
              height: 100,
            ),

            Column(
              children: [
                Row(
                  
                  children: [
                    Image.asset(
                      "assets/img/dec-aptus.png",
                        width: 600,
                        height: 500,
                    ),

                     Container(
                      margin: EdgeInsets.only(left: 150),
                       child: Column(
                         children: [
                           Text(
                                  "Avec nos solutions et nos experiences",
                                  style: TextStyle(fontFamily: "myfont", fontSize: 20),
                                ),

                                  Text(
                                  "Nous offrons des solutions efficaces",
                                  style: TextStyle(fontFamily: "myfont", fontSize: 20),
                                ),

                         ],
                       ),
                     ),
                  ],
                )
              ],
            ),
            SizedBox(height: 60,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 1370,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 600),
                        child: ListTile(
                          title: Text("2023 SFE", style: TextStyle(color: Colors.white, fontFamily: "myfont"),),
                          leading: Icon(Icons.copyright, color: Colors.white,),
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
