// ignore_for_file: prefer_const_constructors, unnecessary_import, implementation_imports, unused_import

import 'package:aptus_stage/controllers/providers.dart';
import 'package:aptus_stage/models/models.dart';
import 'package:aptus_stage/responsives/desktop.dart';
import 'package:aptus_stage/services/api.dart';
import 'package:aptus_stage/views/components/edit_quizz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuizzList extends StatefulWidget {
  const QuizzList({super.key});

  @override
  State<QuizzList> createState() => _QuizzListState();
}

class _QuizzListState extends State<QuizzList> {
  int id = 0;
  bool creer = false;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(top: 10),
        alignment: Alignment.center,
        width: screenWidth(context) >= 800 ? 1300 : 600,
        height: screenWidth(context) >= 800 ? 200 : 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          color: Colors.white,
        ),
        child: FutureBuilder(
            future: getQuizzes(storage.getItem('token')),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                List<Quizz> quizzes = snapshot.data!;
                return ListView.builder(
                    itemCount: quizzes.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Table(
                          border: TableBorder.all(color: Colors.white),
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(
                                decoration: BoxDecoration(color: Colors.white),
                                children: [
                                  TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            quizzes[index].title,
                                            style:
                                                TextStyle(fontFamily: "myfont"),
                                          ))),

                                  TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            quizzes[index].description,
                                            style:
                                                TextStyle(fontFamily: "myfont"),
                                          ))),

                                  TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            quizzes[index].coeff.toString(),
                                            style:
                                                TextStyle(fontFamily: "myfont"),
                                          ))),

                                  // TableCell(
                                  // verticalAlignment: TableCellVerticalAlignment.middle,
                                  // child: Padding(
                                  //   padding: EdgeInsets.all(5),
                                  //   child: Text(quizzes[index].id.toString(), style: TextStyle(fontFamily: "myfont"),)
                                  //   )
                                  // ),

                                  TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Container(
                                            width: 5,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.edit,
                                                color: Color.fromARGB(
                                                    255, 33, 236, 243),
                                                size: 20,
                                              ),
                                              onPressed: () {
                                                Provider.of<EvaluProvider>(
                                                        context,
                                                        listen: false)
                                                    .setEvalu(!Provider.of<
                                                                EvaluProvider>(
                                                            context,
                                                            listen: false)
                                                        .evalu);

                                                Provider.of<EvaluProvider>(
                                                        context,
                                                        listen: false)
                                                    .setEdit(!Provider.of<
                                                                EvaluProvider>(
                                                            context,
                                                            listen: false)
                                                        .edit);

                                                idquizz = quizzes[index].id;
                                              },
                                            ),
                                          ))),

                                  TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.delete,
                                                color: Color.fromARGB(
                                                    255, 33, 236, 243),
                                                size: 20,
                                              ),
                                              onPressed: () async {
                                                await DeleteQuizz(
                                                    storage.getItem('token'),
                                                    idquizz);
                                              },
                                            ),
                                          ))),
                              
                                ])
                              
                          ],
                        ),
                      );
                    });
              } else {
                return CupertinoActivityIndicator();
              }
            }),
      ),
      Container(
        margin: EdgeInsets.only(left: 50),
        child: Row(
          children: [
            IconsWidget(
              
                icon: Icons.create,
                name: 'Créer',
                callBack: () async {
                  Provider.of<EvaluProvider>(context, listen: false).setEvalu(
                      !Provider.of<EvaluProvider>(context, listen: false)
                          .evalu);
                  Provider.of<EvaluProvider>(context, listen: false).setCreer(
                      !Provider.of<EvaluProvider>(context, listen: false)
                          .creer);

                  await createQuizze(storage.getItem('token'));
                }),
            IconsWidget(
                icon: Icons.download_for_offline,
                name: 'Importer',
                callBack: () {}),
          ],
        ),
      ),
    ]);
  }
}

class IconsWidget extends StatelessWidget {
  const IconsWidget(
      {super.key,
      required this.icon,
      required this.name,
      required this.callBack,
      
      });

  final IconData icon;
  final String name;
  final Function callBack;
  
  @override
  Widget build(BuildContext context) {
    return Row(children: [
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
              size: 20,
              
            ),
            TextButton(
              child: Text(
                name,
                style: TextStyle(
                  color: Color.fromARGB(255, 84, 211, 239),
                  fontFamily: 'myfont',
                  fontSize: screenWidth(context) >= 800 ? 15 : 8,
                ),
              ),
              onPressed: () async {
                await callBack();
              },
            ),
          ],
        ),
      ),
    ]);
  }
}
