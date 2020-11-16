import 'package:flutter/material.dart';
import 'package:gp_project/routes/Home.dart';
import 'package:gp_project/routes/login_screen.dart';
import 'package:gp_project/routes/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Home(),

      initialRoute: LoginScreen.id,
      routes:{
        LoginScreen.id:(context)=>LoginScreen(),
        signup_screen.id:(context)=>signup_screen()
      } ,
    );
  }
}