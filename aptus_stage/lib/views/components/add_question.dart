// ignore_for_file: prefer_const_literals_to_create_immutables, implementation_imports, prefer_const_constructors

import 'package:aptus_stage/models/models.dart';
import 'package:aptus_stage/responsives/desktop.dart';
import 'package:aptus_stage/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// class AddQuestions extends StatelessWidget {
//    AddQuestions({super.key, required this.quest, required this.repon});
//   final String quest ;
//   final String repon ;
//   String selected = "QCM - Une seule réponse";

//   String select = "Oui";

//   @override
//   Widget build(BuildContext context) {
   
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text(
//               quest,
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontFamily: "myfont",
//                     fontSize: screenWidth(context) >= 800 ? 15 : 10)),
//             SizedBox(
//               width: screenWidth(context) >= 800 ? 40 : 20,
//             ),
//             Container(
//               padding: EdgeInsets.only(bottom: 10),
//               margin: EdgeInsets.only(left: 10),
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey, width: 0.2)),
//               width: screenWidth(context) >= 800 ? 200 : 100,
//               height: screenWidth(context) >= 800 ? 25 : 20,
//               child: DropdownButton(
//                   style: TextStyle(
//                       fontFamily: "myfont",
//                       fontSize: 10,
//                       color: Colors.grey[700]),
                      
//                   onChanged: (v) {},
//                   items: [],
//                   ),
//             ),
//             SizedBox(
//               width: screenWidth(context) >= 800 ? 40 : 20,
//             ),
//             Text(
//               repon,
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontFamily: "myfont",
//                     fontSize: screenWidth(context) >= 800 ? 15 : 10)),
//             SizedBox(
//               width: screenWidth(context) >= 800 ? 40 : 20,
//             ),
//             Container(
//               padding: EdgeInsets.only(bottom: 10),
//               margin: EdgeInsets.only(left: 10),
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey, width: 0.2)),
//               width: screenWidth(context) >= 800 ? 100 : 80,
//               height: screenWidth(context) >= 800 ? 20 : 20,
//               child: DropdownButton(
//                   style: TextStyle(
//                       fontFamily: "myfont",
//                       fontSize: 10,
//                       color: Colors.grey[700]),
                      
//                   onChanged: (v) {},
//                   items: [],
//                   ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }


class QuesTest extends StatefulWidget {
  const QuesTest({super.key});

  @override
  State<QuesTest> createState() => _QuesTestState();
}

class _QuesTestState extends State<QuesTest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Container(
        margin: EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          width: screenWidth(context) >= 800 ? 1300 : 600,
          height: screenWidth(context) >= 800 ? 200 : 200,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
         child: FutureBuilder(
          future: gettypeques(
           storage.getItem('token')
          ),
          builder: (context,snapshot){
  if (snapshot.hasData && snapshot.data != null) {
    Questions question= snapshot.data!;
     return ListView.builder(
      itemCount: 7,
      itemBuilder:(context,index){
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Table(
            border: TableBorder.all(color: Colors.white),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color:  Colors.white
                ),
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(question.qcmsingle, style: TextStyle(fontFamily: "myfont"),)
                      )
                    ),
      
                     TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(question.qcmmultiple, style: TextStyle(fontFamily: "myfont"),)
                      )
                    ),
      
                    TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(question.longanswer, style: TextStyle(fontFamily: "myfont"),)
                      )
                    ),



              

                    

                ]
              )
            ],
          ),
      );
        
     });
  } else {
    return CupertinoActivityIndicator();
  }
          }
          ),
      ),
      ],
    );
  }
}
