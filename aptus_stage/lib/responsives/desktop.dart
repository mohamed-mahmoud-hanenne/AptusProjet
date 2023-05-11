// ignore_for_file: prefer_const_constructors

import 'package:aptus_stage/sidebar.dart';
import 'package:flutter/material.dart';

class MyDesktop extends StatelessWidget {
  const MyDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final currentwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Sidebar(),
      
      appBar: AppBar(
        
      backgroundColor: Colors.white,
      leading: Builder(builder: (context) => IconButton(
        onPressed: () {
        Scaffold.of(context).openDrawer();
      }, 
      icon: Icon(Icons.menu),
      color:  Color.fromARGB(255, 10, 238, 254),
      )
      ),
           elevation: 0,
           title: Row(
           
            children: [
             Image.asset(
            "assets/img/ap.png",
             width: currentwidth >= 800 ? 110 : 30,
            ),
            SizedBox(width: 20,),

            // if(MediaQuery.of(context).size.width >=900)
             Text(
              "Marketing Digital",
              style: TextStyle(
                color: Colors.grey[600],
                fontFamily: "myfont",
                fontSize: currentwidth >= 800 ? 12 : 8,
                ),
              ),

              
             ]
           ),

           actions: [
            Row(
              children: [
              IconButton(
              onPressed: () {}, 
              icon: Icon(Icons.school),
              color: Color.fromARGB(255, 17, 238, 254),
              iconSize: currentwidth >= 800 ? 15 : 10,
              ),

              Text(
                "Formation Continue",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontFamily: "myfont",
                  fontSize: currentwidth >= 800 ? 12 : 8,
                ),
                ),
                SizedBox(width: 20,),
              IconButton(
              onPressed: () {}, 
              icon: Icon(Icons.calendar_month),
              color: Color.fromARGB(255, 17, 238, 254),
              iconSize: currentwidth >= 800 ? 15 : 10,
              ),
         
              Text(
                "2022-2023",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontFamily: "myfont",
                  fontSize: currentwidth >= 800 ? 12 : 8,
                ),
                ),
                SizedBox(width: 20,),
              IconButton(
              onPressed: () {}, 
              icon: Icon(Icons.notifications),
              color: Color.fromARGB(255, 17, 238, 254),
              iconSize: currentwidth >= 800 ? 15 : 10,
              ),
              SizedBox(width: 20,),
              IconButton(
              onPressed: () {}, 
              icon: Icon(Icons.email),
              color: Color.fromARGB(255, 17, 238, 254),
              iconSize: currentwidth >= 800 ? 15 : 10,
              ),
              SizedBox(width: 20,),
              CircleAvatar(
                child: IconButton(
                  onPressed: () {}, 
                  icon: Icon(Icons.person),
                  color: Color.fromARGB(255, 17, 238, 254),
                  iconSize: currentwidth >= 800 ? 15 : 10,

                  ),
              )
              ],
            )
           ],
      ),
     
      body:  Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey), bottom: BorderSide(color: Colors.grey)),
        color: Colors.white
      ),
      width: double.infinity,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

        TextButton(
          child: Text(
            'Planning',
            style: TextStyle(
            color: Colors.grey[600],
            fontFamily: 'myfont',
            fontSize: currentwidth >= 800 ? 12 : 8,
           ),
            ),
          onPressed: () {},
          
          ),

          TextButton(
            child : Text(
          'Absences',
            style: TextStyle(
            color: Colors.grey[600],
            fontFamily: 'myfont',
            fontSize: currentwidth >= 800 ? 12 : 8,
           ),
            ),
             onPressed: () {},
          ),

            TextButton(
            child : Text(
          'Évaluations',
            style: TextStyle(
            color: Colors.grey[600],
            fontFamily: 'myfont',
            fontSize: currentwidth >= 800 ? 12 : 8,
           ),
            ),
             onPressed: () {
              Navigator.pushNamed(context, '/evalu');
             },
          ),

              TextButton(
            child : Text(
            'Notes',
            style: TextStyle(
            color: Colors.grey[600],
            fontFamily: 'myfont',
            fontSize: currentwidth >= 800 ? 12 : 8,
           ),
            ),
             onPressed: () {},
          ),

             TextButton(
            child : Text(
          'Ressources',
            style: TextStyle(
            color: Colors.grey[600],
            fontFamily: 'myfont',
            fontSize: currentwidth >= 800 ? 12 : 8,
           ),
            ),
             onPressed: () {},
          ),

      

              TextButton(
            child : Text(
          'Participans',
            style: TextStyle(
            color: Colors.grey[600],
            fontFamily: 'myfont',
            fontSize: currentwidth >= 800 ? 12 : 8,
           ),
            ),
             onPressed: () {},
          ),

                TextButton(
            child : Text(
          'Discussions',
            style: TextStyle(
            color: Colors.grey[600],
            fontFamily: 'myfont',
            fontSize: currentwidth >= 800 ? 12 : 8,
           ),
            ),
             onPressed: () {},
          ),
        ],
      ),
     ),
      
    );
  }
}