// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Apropos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tableau des informations'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text(
                'Titre',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Coefficient',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(''),
            ),
            DataColumn(
              label: Text(''),
            ),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('Titre 1')),
              DataCell(Text('Description 1')),
              DataCell(Text('0.5')),
              DataCell(IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Action pour modifier
                },
              )),
              DataCell(IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // Action pour supprimer
                },
              )),
            ]),
            DataRow(cells: [
              DataCell(Text('Titre 2')),
              DataCell(Text('Description 2')),
              DataCell(Text('0.8')),
              DataCell(IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Action pour modifier
                },
              )),
              DataCell(IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // Action pour supprimer
                },
              )),
            ]),
            // Ajoutez ici les lignes supplémentaires avec les données correspondantes
          ],
        ),
      ),
    );
  }
}
