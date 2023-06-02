// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:aptus_stage/responsives/desktop.dart';
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

    
    final url = Uri.parse('http://192.168.O.120:8002/auth/login/');

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
      backgroundColor: Colors.grey.withOpacity(0.2),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)
            ),
            margin: EdgeInsets.all(20),
            width: 500,
            height: 600,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(15)
                      ),
                  width: 300,
                  height: 500,
                  margin: EdgeInsets.fromLTRB(100, 70, 0, 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/img/aptu.jpg",
                        width: screenWidth(context) >= 800 ? 70 : 30,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: TextField(
                          controller: _username,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.purple[50],
                            border: InputBorder.none,
                            labelText: 'Username',
                            labelStyle: TextStyle(fontFamily: 'myfont'),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey)),
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 73, 234, 215),
                                fontFamily: "myfont",
                                fontWeight: FontWeight.bold),
                            prefixIcon: Icon(
                              Icons.person,
                              size: 15,
                            ),
                            prefixIconColor: Color.fromARGB(255, 73, 234, 215),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: TextField(
                          obscureText: true,
                          controller: _password,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.purple[50],
                            border: InputBorder.none,
                            labelText: 'password',
                            labelStyle: TextStyle(fontFamily: 'myfont'),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey)),
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 73, 234, 215),
                                fontFamily: "myfont",
                                fontWeight: FontWeight.bold),
                            prefixIcon: Icon(
                              Icons.lock,
                              size: 15,
                            ),
                            prefixIconColor: Color.fromARGB(255, 73, 234, 215),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                                  MaterialPageRoute(
                                      builder: (context) => const Home()),
                                );
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          actions: [
                                            TextButton(
                                              child: const Text('Réssayer',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 33, 233, 243),
                                                      fontFamily: "myfont")),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                          icon: Icon(
                                            Icons.error,
                                            color: Colors.red,
                                          ),
                                          title: Text(
                                            "login failed",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontFamily: "myfont"),
                                          ),
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
                                    EdgeInsets.symmetric(
                                        horizontal: 105, vertical: 15)),
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 66, 246, 240)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))))),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Vous n'avez un compte aptus? ",
                              style: TextStyle(
                                  color: Colors.purple, fontFamily: 'myfont')),
                          GestureDetector(
                            child: Text(
                              " Sign Up",
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontFamily: "myfont",
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, "/sign");
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
