// ignore_for_file: prefer_const_constructors

import 'package:aptus_stage/responsives/desktop.dart';
import 'package:flutter/material.dart';


class Sidebar extends StatelessWidget {
  const Sidebar({super.key});
   
  @override
  Widget build(BuildContext context) {
    final currentwidth = MediaQuery.of(context).size.width;
    return Drawer(
      
      // width: currentwidth < 800 ? 220 : 300,
      width : screenWidth(context) <= 800 ? 220 : 300,
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
          title:  TextButton(
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Accueil',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'myfont',
                fontSize: screenWidth(context) >= 800 ? 15 : 11.5,
              ),
            ),
          ],
        ),
          onPressed: () {},
          ),
     
          leading: IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.home),
            iconSize: screenWidth(context) >= 800 ? 15 : 16,
            ),
           iconColor: Colors.white,
          
          
      ),

         ListTile(
          title:  TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Mes cours',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'myfont',
                fontSize: screenWidth(context) >= 800 ? 15 : 11.5,
              ),
            ),
          ],
        ),
          onPressed: () {},
          ),
          leading: IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.book),
            iconSize: screenWidth(context) >= 800 ? 15 : 16,
            ),
          iconColor: Colors.white,
          
      ),
         Divider(),

         ListTile(
          title:  TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Banque de ressources',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'myfont',
                fontSize: screenWidth(context) >= 800 ? 15 : 11.5,
              ),
            ),
          ],
        ),
          onPressed: () {},
          ),
          leading: IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.data_saver_off_outlined),
            iconSize: screenWidth(context) >= 800 ? 15 : 16,
            
            ),
          iconColor: Colors.white,
          
      ),
         ListTile(
          title:  TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Banque d'evaluations",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'myfont',
                fontSize: screenWidth(context) >= 800 ? 15 : 11.5,
              ),
            ),
          ],
        ),
          onPressed: () {},
          ),
          leading: IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.create),
            iconSize: screenWidth(context) >= 800 ? 15 : 16,
            ),
          iconColor: Colors.white,
          
      ),
         ListTile(
           title:  TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Banque de questions',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'myfont',
                fontSize: screenWidth(context) >= 800 ? 15 : 11.5,
              ),
            ),
          ],
        ),
          onPressed: () {},
          ),
          leading: IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.question_mark),
            iconSize: screenWidth(context) >= 800 ? 15 : 16,
            ),
          iconColor: Colors.white,
          
      ),

         Divider(),

         ListTile(
          title:  TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Agenda',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'myfont',
                fontSize: screenWidth(context) >= 800 ? 15 : 11.5,
              ),
            ),
          ],
        ),
          onPressed: () {},
          ),
          leading: IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.calendar_month),
            iconSize: screenWidth(context) >= 800 ? 15 : 16,
            ),
          iconColor: Colors.white,
         
      ),
         ListTile(
          title:  TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Boite de réception',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'myfont',
                fontSize: screenWidth(context) >= 800 ? 15 : 11.5,
              ),
            ),
          ],
        ),
          onPressed: () {},
          ),
          leading: IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.move_to_inbox),
            iconSize: screenWidth(context) >= 800 ? 15 : 16,
            ),
          iconColor: Colors.white,
         
      ),

         ListTile(
          title:  TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Alertes',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'myfont',
                fontSize: screenWidth(context) >= 800 ? 15 : 11.5,
              ),
            ),
          ],
        ),
          onPressed: () {},
          ),
          leading: IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.notifications),
            iconSize: screenWidth(context) >= 800 ? 15 : 16,
            ),
          iconColor: Colors.white,
          
      ),

         ListTile(
          title:  TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Aide',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'myfont',
                fontSize: screenWidth(context) >= 800 ? 15 : 11.5,
              ),
            ),
          ],
        ),
          onPressed: () {},
          ),
          leading: IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.help),
            iconSize: screenWidth(context) >= 800 ? 15 : 16,
            ),
          iconColor: Colors.white,
         
      ),
        ],
      ),
    );
    

  }
}