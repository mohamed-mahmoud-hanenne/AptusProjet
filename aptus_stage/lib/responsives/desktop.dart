// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, unused_local_variable, unnecessary_string_interpolations

import 'package:aptus_stage/controllers/providers.dart';
import 'package:aptus_stage/views/components/home_screen_components.dart';
import 'package:aptus_stage/views/screens/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:localstorage/localstorage.dart';

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}



class MyDesktop extends StatefulWidget {
  const MyDesktop({super.key});

  @override
  State<MyDesktop> createState() => _MyDesktopState();
}

class _MyDesktopState extends State<MyDesktop> {
//     final TextEditingController _title = TextEditingController();
//     final TextEditingController _descp = TextEditingController();
//     final TextEditingController _inst = TextEditingController();

//   bool quest = true;
//   bool ajouter = false;
//   bool importer = false;
//   bool creer = false;
//   bool isChecked = false;
//   bool isChecked2 = false;
//   bool isChecked3 = false;
//   bool isChecked4 = false;
//   bool isChecked5 = false;
//   bool isChecked6 = false;
//   bool isChecked7 = false;
//   bool param = false;
//   var statucode = 0;
//   var statdetail = 0;
//   var quizzlenght = 0;

//   var selected = "QCM - Une seule réponse";
//   var select = "Oui";

  // final LocalStorage storage = new LocalStorage('todo_app.json');
  // late String mytokens;
//   late String msg;
//   var name = "créer";


  
//   //function create quizz
//   static const urlcreate = 'http://srv4.aptusmaroc.com:8000/courses/quizzes/';
//   Future<void> createQuizze() async {
//     var result;
//     final url = Uri.parse('$urlcreate');

//     await http.post(url, headers: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'token $mytokens',
//     }).then((respon) {
//       result = jsonDecode(respon.body);
//       setState(() {
//         msg = result['msg'];
//         statucode = respon.statusCode;
//       });
//     }).catchError((error) {
//       print(error);
//     });
//     return (result);
//   }

//   //function update quizz
//   static const urlupdate = 'http://srv4.aptusmaroc.com:8000/courses/quizzes/10';
//   Future<void> getUpdate() async{
//       final String titlequizz = _title.text;
//       final String descquizz = _descp.text;
//       final String instquizz = _inst.text;
//     var update;
//     final url = Uri.parse('$urlupdate');

//     await http.put(url, headers: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'token $mytokens',
      
//     },
//     body:{
//       "title": titlequizz,
//       "description" : descquizz,
//       "instructions" : instquizz
//     }
//     ).then((resp) {
//       update = jsonDecode(resp.body);
//       print(resp.statusCode);
//       print(update);
//       setState(() {
//         statdetail = resp.statusCode;
//       });
//     }).catchError((error){
//       print(error);
//     });
//      return(update);
    
//   }

// //function get deatil quizz
//  static const urldeatil = 'http://srv4.aptusmaroc.com:8000/courses/quizzes/317';
//   Future<void> getdetail() async {
//     var detail;
//     final url = Uri.parse('$urlquiz');
//     await http.get(url, headers: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'token $mytokens',
//     }).then((response) {
//       detail = jsonDecode(response.body);
//       print(response.statusCode);
//       print(detail);
//     }).catchError((error) {
//       print('Error: $error');
//     });
//     return detail;
//   }
//   @override
//   void initState() {
//     super.initState();
//     mytokens = storage.getItem('token');
//     getdetail();
//   }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        drawer: Sidebar(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Builder(
              builder: (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(Icons.menu),
                    color: Color.fromARGB(255, 10, 238, 254),
                  )),
          elevation: 0,
          title: Row(children: [
            Image.asset(
              "assets/img/ap.png",
              width: screenWidth(context) >= 800 ? 110 : 30,
            ),
            SizedBox(
              width: 20,
            ),

            Text(
              "Marketing Digital",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "myfont",
                fontSize: screenWidth(context) >= 800 ? 12 : 8,
              ),
            ),
          ]),
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
                    color: Colors.black,
                    fontFamily: "myfont",
                    fontSize: screenWidth(context) >= 800 ? 12 : 8,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.calendar_month),
                  color: Color.fromARGB(255, 17, 238, 254),
                  iconSize: screenWidth(context) >= 800 ? 15 : 10,
                ),
                Text(
                  "2022-2023",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "myfont",
                    fontSize: screenWidth(context) >= 800 ? 12 : 8,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications),
                  color: Color.fromARGB(255, 17, 238, 254),
                  iconSize: screenWidth(context) >= 800 ? 15 : 10,
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.email),
                  color: Color.fromARGB(255, 17, 238, 254),
                  iconSize: screenWidth(context) >= 800 ? 15 : 10,
                ),
                SizedBox(
                  width: 20,
                ),
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
                Provider.of<EvaluProvider>(context).evalu
                    ? QuizzList() : SizedBox()
                    
              ]
            )
          )
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
          border: Border(
              top: BorderSide(color: Colors.grey),
              bottom: BorderSide(color: Colors.grey)),
          color: Colors.white),
      width: double.infinity,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SousMenuItem(name: 'Planning', callBack: () {}),
          SousMenuItem(name: 'Absences', callBack: () {}),
          SousMenuItem(
              name: 'Évaluations',
              callBack: () {
                Provider.of<EvaluProvider>(context, listen: false).setEvalu(
                    !Provider.of<EvaluProvider>(context, listen: false).evalu);
              }),
          SousMenuItem(name: 'Notes', callBack: () {}),
          SousMenuItem(name: 'Ressources', callBack: () {}),
          SousMenuItem(name: 'Participants', callBack: () {}),
          SousMenuItem(name: 'Discussions', callBack: () {}),
        ],
      ),
    );
  }
}

class SousMenuItem extends StatelessWidget {
  const SousMenuItem({super.key, required this.name, required this.callBack});
  final String name;
  final Function callBack;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Text(
          name,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'myfont',
            fontSize: screenWidth(context) >= 800 ? 12 : 8,
          ),
        ),
        onPressed: () {
          callBack();
        });
  }
}
