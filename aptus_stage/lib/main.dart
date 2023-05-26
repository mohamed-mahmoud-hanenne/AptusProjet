// ignore_for_file: prefer_const_constructors

import 'package:aptus_stage/views/screens/Acceuil.dart';
import 'package:aptus_stage/views/screens/Home.dart';
import 'package:aptus_stage/views/screens/login.dart';
import 'package:aptus_stage/responsives/mobile.dart';
import 'package:aptus_stage/views/screens/sign.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
// 
void main() {

  // runApp(DevicePreview(builder:(context)=> const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
 
      debugShowCheckedModeBanner: false,
      // builder: DevicePreview.appBuilder,
  initialRoute: '/',
  routes: {
    '/': (context) => const Accueil(),
    '/sign': (context) => const Sign(),
    '/login': (context) => const Login(),
    
  },
     
    );

  }
}