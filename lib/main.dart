import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/routes/CartScreen.dart';
import 'package:gp_project/routes/Editmyjob.dart';
import 'package:gp_project/routes/Editmyproducts.dart';
import 'package:gp_project/routes/Editmyservices.dart';
import 'package:gp_project/routes/Editprofile.dart';
import 'package:gp_project/routes/HomePage.dart';
import 'package:gp_project/routes/HomePageAfterLogin.dart';
import 'package:gp_project/routes/Jobs_screen.dart';
import 'package:gp_project/routes/Products_screen.dart';
import 'package:gp_project/routes/RatingController.dart';
import 'package:gp_project/routes/Services_screen.dart';
import 'package:gp_project/routes/job_details.dart';
import 'package:gp_project/routes/product_details.dart';
import 'package:gp_project/routes/productlist.dart';
import 'package:gp_project/routes/profile.dart';
import 'package:gp_project/routes/resultDropDownServices.dart';
import 'package:gp_project/routes/service_details.dart';
import 'package:gp_project/routes/serviceslist.dart';
import 'routes/login_screen.dart';
import 'routes/signup_screen.dart';
import 'routes/ForgetPassword.dart';
import 'provider/cartItem.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';



/*void main() {
  runApp(MyApp());
   Firebase.initializeApp();
  
}*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
 /* await GetStorage.init();
  Get.put(RatingController());*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return  MultiProvider(
      providers: [
      ChangeNotifierProvider<CartItem>(
        create :(context) => CartItem(),
      ),

      ],
    
      child:MaterialApp(
      initialRoute: MyHomePage.id,
      
      routes: {
        LoginScreen.id:(context)=>LoginScreen(),
       signup_screen.id:(context)=>signup_screen(),
        MyHomePage.id:(context)=>MyHomePage(),
        MyHomePageAfterLogin.id:(context)=>MyHomePageAfterLogin(),
       // Home.id:(context)=>Home(),
        myservices.id:(context)=>myservices(),
         MyProducts.id:(context)=>MyProducts(),
        MyJobs.id:(context)=>MyJobs(),
        Editmyservices.id:(context)=>Editmyservices(),
        Editmyproducts.id:(context)=>Editmyproducts(),
        servicedetails.id:(context)=>servicedetails(),
        productdetails.id:(context)=>productdetails(),
        jobdetails.id:(context)=>jobdetails(),
        Editmyjob.id:(context)=>Editmyjob(),
        ForgotPasswordScreen.id:(context)=>ForgotPasswordScreen(),
        CartScreen.id : (context) => CartScreen(),
        Editprofile.id:(context)=>Editprofile(),
        profile.id: (context)=>profile(),
        ProductList.id:(context)=>ProductList(),
        serviceslist.id:(context)=>serviceslist(),



     /*   Test.id :(context) => Test(),*/
      },
      ),
   );
    
      /*theme: ThemeData(
        primarySwatch: Colors.purple,
      ),*/
      //home:Home(),
      //
     
    
  }
}    
