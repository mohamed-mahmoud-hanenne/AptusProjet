// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, sort_child_properties_last

import 'package:aptus_stage/views/screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:localstorage/localstorage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LocalStorage storage = new LocalStorage('todo_app.json');

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  var statu = 0;
  var token = '';

  _saveToStorage() {
    storage.setItem('token', token);
  }

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
    final responsebody = jsonDecode(response.body);
    setState(() {
      statu = response.statusCode;
      if (statu == 200) {
        setState(() {
          token = responsebody['token'];
        });
      }
      _saveToStorage();
    });
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
        height: 400,
        margin: EdgeInsets.fromLTRB(500, 100, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              
              decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(10)),
              width: 250,
              height: 40,
              child: TextField(
                controller: _username,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Username',
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 73, 234, 215),
                      fontFamily: "myfont",
                      fontWeight: FontWeight.bold),
                  prefixIcon: Icon(Icons.person),
                  prefixIconColor: Color.fromARGB(255, 73, 234, 215),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              
              decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(10)),
              width: 250,
              height: 40,
              child: TextField(
                controller: _password,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'password',
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 73, 234, 215),
                      fontFamily: "myfont",
                      fontWeight: FontWeight.bold),
                  prefixIcon: Icon(Icons.lock),
                  prefixIconColor: Color.fromARGB(255, 73, 234, 215),
                ),
              ),
            ),
            SizedBox(
              height: 120,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(10)),
              width: 250,
              height: 40,
              child: ElevatedButton(
                  onPressed: () async {
                    await login();
                    if (statu == 200) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text("login failed"),
                              ));
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontFamily: "myfont",
                        fontWeight: FontWeight.bold,
                       
                        fontSize: 15),
                  ),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 105, vertical: 15)),
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 66, 246, 240)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))))),
            ),
          ],
        ),
      ),
    );
  }
}
