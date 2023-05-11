
// ignore_for_file: unused_import

import 'package:aptus_stage/sidebar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:aptus_stage/responsives/resp_pages.dart';


class Mymobile extends StatefulWidget {
  const Mymobile({super.key});

  @override
  State<Mymobile> createState() => _MymobileState();
}

class _MymobileState extends State<Mymobile> {




  Widget build(BuildContext context) {
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
           
           actions: [
            
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
              
              children: [
              
              IconButton(
              onPressed: () {}, 
              icon: Icon(Icons.school),
              color: Color.fromARGB(255, 17, 238, 254),
              iconSize: 15
              ),

              Text(
                "Formation",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontFamily: "myfont",
                  fontSize: 10
                ),
                ),

    

               
              IconButton(
              onPressed: () {}, 
              icon: Icon(Icons.calendar_month),
              color: Color.fromARGB(255, 17, 238, 254),
              iconSize: 15
              ),
         
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
              iconSize: 15
              ),
             
              IconButton(
              onPressed: () {}, 
              icon: Icon(Icons.email),
              color: Color.fromARGB(255, 17, 238, 254),
              iconSize: 15
              ),
              
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: IconButton(
                  onPressed: () {}, 
                  icon: Icon(Icons.person),
                  color: Color.fromARGB(255, 17, 238, 254),
                  iconSize: 15

                  ),
              ),
              
              ],
            ),
            ),

           ],
      ),
        
        body: Container(
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
            fontSize: 8,
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
           fontSize: 8,
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
            fontSize: 8,
           ),
            ),
             onPressed: () {
              
             },
          ),

              TextButton(
            child : Text(
            'Notes',
            style: TextStyle(
            color: Colors.grey[600],
            fontFamily: 'myfont',
            fontSize: 8,
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
           fontSize: 8,
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
            fontSize: 8,
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
            fontSize: 8,
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