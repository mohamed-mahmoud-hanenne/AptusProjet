
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _accueilState();
}

class _accueilState extends State<Accueil> {
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
            onPressed: (){
             
            }, 
            child: Text(
              "Accueil",
              style: TextStyle(fontFamily: 'myfont', color: Colors.grey[800],  fontWeight: FontWeight.bold),

              )
            ),
             SizedBox(width: 30,),
            TextButton(
            onPressed: (){}, 
            child: Text(
              "Solutions",
              style: TextStyle(fontFamily: 'myfont', color: Colors.grey[800], fontWeight: FontWeight.bold),
              )
            ),
             SizedBox(width: 30,),
            TextButton(
            onPressed: (){}, 
            child: Text(
              "À propos",
              style: TextStyle(fontFamily: 'myfont', color: Colors.grey[800], fontWeight: FontWeight.bold),
              )
            ),
             SizedBox(width: 30,),
            TextButton(
            onPressed: (){}, 
            child: Text(
              "Contact",
              style: TextStyle(fontFamily: 'myfont', color: Colors.grey[800], fontWeight: FontWeight.bold),
              )
            ),
           SizedBox(width: 520,),
            TextButton(
            onPressed: (){
              Navigator.pushNamed(context, "/login");
            }, 
            child: Text(
              "Login",
              style: TextStyle(fontFamily: 'myfont', color: Colors.grey[800], fontWeight: FontWeight.bold),
              )
            ),
             SizedBox(width: 50,),
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/sign");
                }, 
                child: Text(
                  "Sign in",
                  style: TextStyle(fontFamily: 'myfont', color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                   style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 10)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 66, 246, 240)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))))
                ),
            )

        ],
      ),

      body: Column(
        children: [

          Container(
            width: 1380,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(width: 5)
            ),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("Pour plusieus informations",
            style: TextStyle(color: Colors.white, fontFamily: 'myfont')),
            SizedBox(width: 20,),
            TextButton(onPressed: (){},
           child: Text(
            "Cliquer ici",
              style: TextStyle(color: Colors.white, fontFamily: 'myfont', fontWeight: FontWeight.bold),
            )
           )
            ],
            ),
          ),
         SizedBox(height: 30,),
          Container(

            child: Row(
             mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                    width: 600,
                    height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Image.asset(
                    "assets/img/learn.jpg",
                    width: 600,
                    height: 400,
                    
                    ),
                ),
                SizedBox(width: 30,),
                Container(
                    width: 600,
                    height: 400,
                    child: Text(
                      "Aptus et l'enseignement",
                      style: TextStyle(fontFamily: 'myfont', fontSize: 20),
                      ),
                    alignment: Alignment.topLeft,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}