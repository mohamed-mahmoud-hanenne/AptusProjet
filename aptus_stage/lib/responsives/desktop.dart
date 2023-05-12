// ignore_for_file: prefer_const_constructors

import 'package:aptus_stage/controllers/providers.dart';
import 'package:aptus_stage/responsives/evalu.dart';
import 'package:aptus_stage/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

 double screenWidth(BuildContext context){
  return  MediaQuery.of(context).size.width;
 }
class MyDesktop extends StatefulWidget {
  const MyDesktop({super.key});

  @override
  State<MyDesktop> createState() => _MyDesktopState();
}

class _MyDesktopState extends State<MyDesktop> {
  @override
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
           title: Row(
           
            children: [
             Image.asset(
            "assets/img/ap.png",
             width: screenWidth(context) >= 800 ? 110 : 30,
            ),
            SizedBox(width: 20,),

            // if(MediaQuery.of(context).size.width >=900)
             Text(
              "Marketing Digital",
              style: TextStyle(
                color: Colors.grey[600],
                fontFamily: "myfont",
                fontSize: screenWidth(context) >= 800 ? 12 : 8,
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
              iconSize: screenWidth(context) >= 800 ? 15 : 10,
              ),

              Text(
                "Formation Continue",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontFamily: "myfont",
                  fontSize: screenWidth(context) >= 800 ? 12 : 8,
                ),
                ),
                SizedBox(width: 20,),
              IconButton(
              onPressed: () {}, 
              icon: Icon(Icons.calendar_month),
              color: Color.fromARGB(255, 17, 238, 254),
              iconSize: screenWidth(context) >= 800 ? 15 : 10,
              ),
         
              Text(
                "2022-2023",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontFamily: "myfont",
                  fontSize: screenWidth(context) >= 800 ? 12 : 8,
                ),
                ),
                SizedBox(width: 20,),
              IconButton(
              onPressed: () {}, 
              icon: Icon(Icons.notifications),
              color: Color.fromARGB(255, 17, 238, 254),
              iconSize: screenWidth(context) >= 800 ? 15 : 10,
              ),
              SizedBox(width: 20,),
              IconButton(
              onPressed: () {}, 
              icon: Icon(Icons.email),
              color: Color.fromARGB(255, 17, 238, 254),
              iconSize: screenWidth(context) >= 800 ? 15 : 10,
              ),
              SizedBox(width: 20,),
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
              
              Provider.of<EvaluProvider>(context).evalu ? 
                  Container(
                      margin: EdgeInsets.all(20),
                      color: Colors.amber,
                      width: screenWidth(context)  >= 800 ? 1250 : 800,
                      height: screenWidth(context)>= 800 ? 500 : 450,
                        child: Row(
                          children: [
                            
                          ],
                        ),
                      )
              : SizedBox()
             
            ],
          ),
        ),
        )
    
      
      
    );
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
      border: Border(top: BorderSide(color: Colors.grey), bottom: BorderSide(color: Colors.grey)),
      color: Colors.white
    ),
    width: double.infinity,
    height: 40,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [


        SousMenuItem(name:  'Planning' , callBack:() {}),
        SousMenuItem(name: 'Absences' , callBack:() {}),

        SousMenuItem(name: 'Évaluations' , callBack:() {
        
          Provider.of<EvaluProvider>(context, listen: false).setEvalu( ! Provider.of<EvaluProvider>(context, listen: false).evalu);
        }),
        SousMenuItem(name: 'Notes' , callBack:() {}),
        SousMenuItem(name: 'Ressources' , callBack:() {}),
        SousMenuItem(name: 'Participants' , callBack:() {}),
        SousMenuItem(name: 'Discussions' , callBack:() {})

,
       
      ],
    ),
     );
  }
}


class SousMenuItem extends StatelessWidget {
  const SousMenuItem({super.key, required this.name, required this.callBack});
  final String name ;
  final Function callBack ;
  @override
  Widget build(BuildContext context) {
    return 
           TextButton(
          child : Text(
          name,
          style: TextStyle(
          color: Colors.grey[600],
          fontFamily: 'myfont',
          fontSize:screenWidth(context) >= 800 ? 12 : 8,
         ),
          ),
           onPressed: () {
            callBack();
           } 
        );
  }
}