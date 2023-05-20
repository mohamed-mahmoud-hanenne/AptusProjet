// ignore_for_file: prefer_const_constructors, unnecessary_import, implementation_imports, unused_import

import 'package:aptus_stage/responsives/desktop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class QuizzList extends StatelessWidget {
  const QuizzList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          alignment: Alignment.center,
          width: screenWidth(context) >= 800 ? 1100 : 600,
          height: screenWidth(context) >= 800 ? 200 : 200,
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
         child: FutureBuilder(
          
          builder: builder
          ),
      ),

        Row(
          children: [
            IconsWidget(icon: Icons.create, name: 'Créer',),
            IconsWidget(icon: Icons.download_for_offline, name: 'Importer',),
          ],
        )

    ]);
  }
}

class IconsWidget extends StatelessWidget {
  const IconsWidget({super.key, required this.icon, required this.name});

  final IconData icon ;
  final String name;
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
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ]);
  }
}
