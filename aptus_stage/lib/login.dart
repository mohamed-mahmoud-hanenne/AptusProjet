// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:aptus_stage/Home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  var statu = 0;

  Future<void> login() async {
    final String username = _username.text;
    final String password = _password.text;

    final url = Uri.parse('http://srv4.aptusmaroc.com:8000/auth/login/');

    final response = await http.post(
      url,
      body: {
        "username": username,
        "password": password,
      },
    );
    setState(() {
      statu = response.statusCode;
    });
    print(response.body);
  }

  @override
  // void initState() {
  //   super.initState();
  //   login();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.grey, width: 0.5)),
        width: 300,
        height: 200,
        margin: EdgeInsets.fromLTRB(500, 200, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.5)),
              width: 150,
              height: 25,
              child: TextField(
                controller: _username,
                decoration: InputDecoration(
                    labelText: 'Username',
                    hintStyle: TextStyle(fontFamily: "myfont")),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.5)),
              width: 150,
              height: 25,
              child: TextField(
                controller: _password,
                decoration: InputDecoration(
                    labelText: 'password',
                    hintStyle: TextStyle(fontFamily: "myfont")),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.5)),
              width: 150,
              height: 25,
              child: ElevatedButton(
                onPressed: () async {
                  await login();
                  if (statu == 200) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  } else {
                    print("login failed");
                  }
                },
                child: Text("login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
