
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

final List<Widget> _screens = [
  
      Container(
    child: Text("Planning"),
    alignment: Alignment.center,
  
  ),


    Container(
    child: Text("Absences"),
    alignment: Alignment.center,
  
  ),

     Center(
       child: Container(
         decoration: BoxDecoration(
        border: Border.all(width: 1, color: Color.fromARGB(255, 209, 203, 203)),
        color: Colors.white
         ),
         width: 420,
         height: 420,
         
         
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
          Container(
              margin: EdgeInsets.only(top: 50),
              child:  Text("Session"),
            ),
          
           SizedBox(width: 20,),
           Container(
          padding: EdgeInsets.only(bottom: 10),
          margin: EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Color.fromARGB(255, 224, 221, 221)),
       
         ),
        width: 200,
        height: 20,
        child: DropdownButton(
       
       isExpanded: true,
        items: [
          
          DropdownMenuItem(child: Text('Normale', style: TextStyle(fontSize: 10),), value: 'Normale',),
           DropdownMenuItem(child: Text('Complementaire', style: TextStyle(fontSize: 10),), value: 'Complementaire',),
        ],
        
        onChanged: (value) {
          
        },
        
         ),
         ),
           
        
        
          ],
        )

     
         
       ),
     ),

    Container(
    child: Text("Notes"),
    alignment: Alignment.center,
   
  ),

      Container(
    child: Text("Ressources"),
    alignment: Alignment.center,
    
  ),

    Container(
    child: Text("Participants"),
    alignment: Alignment.center,
    
  ),

    Container(
    child: Text("Discussions"),
    alignment: Alignment.center,
    
  ),

];

  int _selectedIndex = 0;


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
        

        bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,

        onTap: (int index){
          setState(() {
            _selectedIndex = index;
          });
        },
        
        items: [
         BottomNavigationBarItem(
          icon: Text('Planning', style: TextStyle(fontFamily: 'myfont', fontSize: 10),),
          label: ''
         ),

                 BottomNavigationBarItem(
          icon: Text('Abseneces', style: TextStyle(fontFamily: 'myfont', fontSize: 10)),
          label: ''
         ),

                 BottomNavigationBarItem(
          icon: Text('Evaluations', style: TextStyle(fontFamily: 'myfont', fontSize: 10)),
          label: ''
         ),

                 BottomNavigationBarItem(
          icon: Text('Notes', style: TextStyle(fontFamily: 'myfont', fontSize: 10)),
          label: ''
         ),

                 BottomNavigationBarItem(
          icon: Text('Ressources', style: TextStyle(fontFamily: 'myfont', fontSize: 10)),
          label: ''
         ),

                 BottomNavigationBarItem(
          icon: Text('Participants', style: TextStyle(fontFamily: 'myfont', fontSize: 10)),
          label: ''
         ),

                   BottomNavigationBarItem(
          icon: Text('Discussions', style: TextStyle(fontFamily: 'myfont', fontSize: 10)),
          label: ''
         ),
        ],
      ),
        
        body: _screens[_selectedIndex],

     
     
    );
  }

  
}