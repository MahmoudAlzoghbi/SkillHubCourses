import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skill_hub_courses_v2/models/user.dart';
import 'package:skill_hub_courses_v2/screen/home/home.dart';

import 'SplashScreen.dart';


void main (){
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int choose = 0;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Welcome(),);

    /*final user = Provider.of<User>(context);
    print (user);
    if (user == null){
      *//*return Welcome();*/
    /*}else {
      return Home();
    }*/

    /*Timer(Duration(seconds: 5),() {
      FirebaseAuth.instance.onAuthStateChanged.listen((event) {
        if (event == null) {
          print(event);
          print('Ana hena2');
          choose = 1;
        }else {
          choose = 2;
        }
      });
    });

    if (choose == 2){
      print('ana hena1');
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      );
    }else if (choose == 1){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Welcome(),
      );
    }*/
  }
}