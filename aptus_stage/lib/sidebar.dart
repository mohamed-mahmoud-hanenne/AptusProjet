// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class Sidebar extends StatelessWidget {
  const Sidebar({super.key});
   
  @override
  Widget build(BuildContext context) {
    final currentwidth = MediaQuery.of(context).size.width;
    return Drawer(
      
      width: currentwidth < 800 ? 220 : 300,
      backgroundColor: Colors.grey[600],
      child: ListView(
        children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
           children: [
            IconButton(
            icon: Icon(Icons.clear),
            color: Colors.white,
            onPressed: () {
               Navigator.pop(context);
            },
          )
           ],
          ),

        SizedBox(height: 20,),
        Divider(),

         ListTile(
          title:  Text(
            'Accueil',
            style: TextStyle(
              color: Colors.white,
              fontSize: currentwidth < 800 ? 12 : 16,
            ),
            ),
          leading: IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.home),
            iconSize: currentwidth < 800 ? 15 : 16,
            ),
           iconColor: Colors.white,
          
          
      ),

         ListTile(
          title:  Text(
            'Mes cours',
            style: TextStyle(
              color: Colors.white,
              fontSize: currentwidth < 800 ? 12 : 16,
            ),
            ),
          leading: IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.book),
            iconSize: currentwidth < 800 ? 15 : 16,
            ),
          iconColor: Colors.white,
          
      ),
         Divider(),

         ListTile(
          title:  Text(
            'Banque de ressources',
            style: TextStyle(
              color: Colors.white,
              fontSize: currentwidth < 800 ? 12 : 16,
            ),
            ),
          leading: IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.data_saver_off_outlined),
            iconSize: currentwidth < 800 ? 15 : 16,
            ),
          iconColor: Colors.white,
          
      ),
         ListTile(
          title:  Text(
            "Banque d'evaluations",
            style: TextStyle(
              color: Colors.white,
              fontSize: currentwidth < 800 ? 12 : 16,
            ),
            ),
          leading: IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.create),
            iconSize: currentwidth < 800 ? 15 : 16,
            ),
          iconColor: Colors.white,
          
      ),
         ListTile(
          title:  Text(
            "Banque de questions",
            style: TextStyle(
              color: Colors.white,
              fontSize: currentwidth < 800 ? 12 : 16,
            ),
            ),
          leading: IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.question_mark),
            iconSize: currentwidth < 800 ? 15 : 16,
            ),
          iconColor: Colors.white,
          
      ),

         Divider(),

         ListTile(
          title:  Text(
            'Agenda',
            style: TextStyle(
              color: Colors.white,
              fontSize: currentwidth < 800 ? 12 : 16,
            ),
            ),
          leading: IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.calendar_month),
            iconSize: currentwidth < 800 ? 15 : 16,
            ),
          iconColor: Colors.white,
         
      ),
         ListTile(
          title:  Text(
            'Boite de réception',
            style: TextStyle(
              color: Colors.white,
              fontSize: currentwidth < 800 ? 12 : 16,
            ),
            ),
          leading: IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.move_to_inbox),
            iconSize: currentwidth < 800 ? 15 : 16,
            ),
          iconColor: Colors.white,
         
      ),

         ListTile(
          title:  Text(
            'Alertes',
            style: TextStyle(
              color: Colors.white,
              fontSize: currentwidth < 800 ? 12 : 16,
            ),
            ),
          leading: IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.notifications),
            iconSize: currentwidth < 800 ? 15 : 16,
            ),
          iconColor: Colors.white,
          
      ),

         ListTile(
          title:  Text(
            'Aide',
            style: TextStyle(
              color: Colors.white,
              fontSize: currentwidth < 800 ? 12 : 16,
            ),
            ),
          leading: IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.help),
            iconSize: currentwidth < 800 ? 15 : 16,
            ),
          iconColor: Colors.white,
         
      ),
        ],
      ),
    );
    

  }
}