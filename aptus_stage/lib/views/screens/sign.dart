// ignore_for_file: unused_field, unnecessary_new, prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously

import 'package:aptus_stage/responsives/desktop.dart';
import 'package:aptus_stage/views/screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:localstorage/localstorage.dart';

class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _SIgnState();
}

class _SIgnState extends State<Sign> {
    final LocalStorage storage = new LocalStorage('todo_app.json');

  final TextEditingController _username = TextEditingController();
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
   final TextEditingController _password = TextEditingController();
  var statu = 0;
  var token = '';

  _saveToStorage() {
    storage.setItem('token', token);
  }

  Future<void> login() async {
    final String username = _username.text;
    final String firstname = _firstname.text;
    final String lastname = _lastname.text;
    final String password = _password.text;

    final url = Uri.parse('http://192.168.1.130:8002/auth/login/');

    final response = await http.post(
      url,
      body: {
        "username": username,
        "first_name": firstname,
        "last_name": lastname,
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
        height: 700,
        margin: EdgeInsets.fromLTRB(520, 50, 0, 0),
        child: SingleChildScrollView(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/img/aptu.jpg",
                width: screenWidth(context) >= 800 ? 70 : 30,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextField(
                  controller: _username,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.purple[50],
                    border: InputBorder.none,
                    labelText: 'Username',
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey)),
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 73, 234, 215),
                        fontFamily: "myfont",
                        fontWeight: FontWeight.bold),
                   
                 
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
        
                Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextField(
                  controller: _firstname,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.purple[50],
                    border: InputBorder.none,
                    labelText: 'First name',
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey)),
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 73, 234, 215),
                        fontFamily: "myfont",
                        fontWeight: FontWeight.bold),
                   
                 
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
               Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextField(
                  controller: _lastname,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.purple[50],
                    border: InputBorder.none,
                    labelText: 'Last name',
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey)),
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 73, 234, 215),
                        fontFamily: "myfont",
                        fontWeight: FontWeight.bold),
                   
                 
                  ),
                ),
              ),
        
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextField(
                 obscureText: true,
                  controller: _password,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.purple[50],
                    border: InputBorder.none,
                    labelText: 'password',
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey)),
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 73, 234, 215),
                        fontFamily: "myfont",
                        fontWeight: FontWeight.bold),
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
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  actions: [
                                    TextButton(
                                      child: const Text(
                                        'Réssayer', 
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 33, 233, 243),
                                          fontFamily: "myfont"
                                          )
                                          ),
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
                                    "Erreur",
                                    style: TextStyle(
                                        color: Colors.red, fontFamily: "myfont"),
                                  ),
                                ));
                      }
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontFamily: "myfont",
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 105, vertical: 15)),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 66, 246, 240)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))))),
              ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Vous avez un compte aptus? ",
                              style: TextStyle(color: Colors.purple)),


                   GestureDetector(
                    child: Text(
                            " Log in ",
                            style: TextStyle(
                                color: Colors.purple[800],
                                fontFamily: "myfont",
                                fontWeight: FontWeight.bold),
                          ),
                    onTap: () {Navigator.pushNamed(context, "/login");},
                    ),
                        ],
                      )
            ],
          ),
        ),
      ),
    );
  }

}