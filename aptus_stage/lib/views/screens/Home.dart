// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:math';

import 'package:aptus_stage/responsives/desktop.dart';
import 'package:aptus_stage/responsives/mobile.dart';
import 'package:aptus_stage/responsives/resp_pages.dart';
import 'package:aptus_stage/views/screens/sidebar.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

   
   
    return  Scaffold(
    body: ResponsiveQuiz(
      
      mobileBody: Mymobile(), 
      DesktopBody: MyDesktop()
      ),
  
    );
  }
}