// ignore_for_file: prefer_const_constructors, unnecessary_import, implementation_imports, unused_import

import 'package:aptus_stage/controllers/providers.dart';
import 'package:aptus_stage/models/models.dart';
import 'package:aptus_stage/responsives/desktop.dart';
import 'package:aptus_stage/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class QuizzList extends StatefulWidget {
  const QuizzList({super.key});

  @override
  State<QuizzList> createState() => _QuizzListState();
}

class _QuizzListState extends State<QuizzList> {
  bool creer = false;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          width: screenWidth(context) >= 800 ? 1100 : 600,
          height: screenWidth(context) >= 800 ? 200 : 200,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
         child: FutureBuilder(
          future: getQuizzes(
         
           storage.getItem('token')
          ),
          builder: (context,snapshot){
  if (snapshot.hasData && snapshot.data !=null) {
    List<Quizz> quizzes = snapshot.data!;
     return ListView.builder(
      itemCount: quizzes.length,
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
                      child: Text(quizzes[index].title, style: TextStyle(fontFamily: "myfont"),)
                      )
                    ),
      
                     TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(quizzes[index].description, style: TextStyle(fontFamily: "myfont"),)
                      )
                    ),
      
                    TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(quizzes[index].coeff.toString(), style: TextStyle(fontFamily: "myfont"),)
                      )
                    ),

                    TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: IconButton(
                        icon: Icon(
                          Icons.edit, 
                          color: Color.fromARGB(255, 33, 236, 243),
                          size: 15,
                          ), 
                          onPressed: (){},)
                      )
                    ),

                    TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: IconButton(
                        icon: Icon(
                          Icons.delete, color: Color.fromARGB(255, 33, 236, 243),
                          size: 15,
                          ),
                           onPressed: (){},)
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

        Container(
          margin: EdgeInsets.only(left: 50),
          child: Row(
            children: [
              IconsWidget(icon: Icons.create, name: 'Créer', callBack: () async{
                Provider.of<EvaluProvider>(context,listen: false).setEvalu(
                  !Provider.of<EvaluProvider>(context,listen: false).evalu
                );
                 Provider.of<EvaluProvider>(context,listen: false).setCreer(
                  !Provider.of<EvaluProvider>(context,listen: false).creer
                );
        
                // await createQuizze(
                //   storage.getItem('token')
                // );
               
              }),
              IconsWidget(icon: Icons.download_for_offline, name: 'Importer', callBack: () {
        
              }),
            ],
          ),
        ),

   

    ]);
  }
}

class IconsWidget extends StatelessWidget {
  const IconsWidget({super.key, required this.icon, required this.name, required this.callBack});

  final IconData icon ;
  final String name;
  final Function callBack;
  @override
  Widget build(BuildContext context) {
    return  Row(children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: Color.fromARGB(255, 84, 211, 239), width: 0.5)),
              margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    icon,
                    color: Color.fromARGB(255, 84, 211, 239),
                    size: 15,
                  ),
                  TextButton(
                    child: Text(
                      name,
                      style: TextStyle(
                        color: Color.fromARGB(255, 84, 211, 239),
                        fontFamily: 'myfont',
                        fontSize: screenWidth(context) >= 800 ? 12 : 8,
                      ),
                    ),
                    onPressed: () async{
                     await callBack();
                    },
                  ),
                ],
              ),
            ),
          ]);
  }
}
