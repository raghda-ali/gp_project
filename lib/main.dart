
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/routes/Editmyjob.dart';
import 'package:gp_project/routes/Editmyproducts.dart';
import 'package:gp_project/routes/Home.dart';
import 'package:gp_project/routes/HomePage.dart';
import 'package:gp_project/routes/MyJobByID.dart';
import 'package:gp_project/routes/MyProductsByID.dart';
import 'package:gp_project/routes/MyServicesByID.dart';
import 'package:gp_project/routes/job_details.dart';
import 'package:gp_project/routes/Products_screen.dart';
import 'package:gp_project/routes/Editmyservices.dart';
import 'package:gp_project/routes/Services_screen.dart';
import 'package:gp_project/routes/Jobs_screen.dart';
import 'package:gp_project/routes/product_details.dart';
import 'package:gp_project/routes/service_details.dart';
import 'package:gp_project/routes/MyProductsByID.dart';
import 'package:path/path.dart';
import 'routes/login_screen.dart';
import 'routes/signup_screen.dart';
import 'routes/ForgetPassword.dart';

/*void main() {
  runApp(MyApp());
   Firebase.initializeApp();
  
}*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      initialRoute: MyHomePage.id,
      routes: {
        LoginScreen.id:(context)=>LoginScreen(),
        signup_screen.id:(context)=>signup_screen(),
        MyHomePage.id:(context)=>MyHomePage(),
        Home.id:(context)=>Home(),
        myservices.id:(context)=>myservices(),
        MyProducts.id:(context)=>MyProducts(),
        MyJobs.id:(context)=>MyJobs(),
        Editmyservices.id:(context)=>Editmyservices(),
        Editmyproducts.id:(context)=>Editmyproducts(),
       /* servicedetails.id:(context)=>servicedetails(),*/
        productdetails.id:(context)=>productdetails(),
        jobdetails.id:(context)=>jobdetails(),
        Editmyjob.id:(context)=>Editmyjob(),
        ForgotPasswordScreen.id:(context)=>ForgotPasswordScreen(),
        MyProductsByID.id:(context)=>MyProductsByID(),
        MyServicesByID.id:(context)=>MyServicesByID(),
        MyJobByID.id:(context)=>MyJobByID(),
      },
      /*theme: ThemeData(
        primarySwatch: Colors.purple,
      ),*/
      //home:Home(),
    );
  }
}    
