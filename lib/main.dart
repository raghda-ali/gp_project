import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/routes/Home.dart';
import 'package:gp_project/routes/myproducts_screen.dart';

import 'routes/login_screen.dart';
import 'routes/login_screen.dart';
import 'routes/signup_screen.dart';
//import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
  Firebase.initializeApp();
  
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id:(context)=>LoginScreen(),
        signup_screen.id:(context)=>signup_screen(),
        Home.id:(context)=>Home(),
      },
      //home:Home(),
    );
  }
}    
