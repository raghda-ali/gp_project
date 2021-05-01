import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/routes/ForgetPassword.dart';
import 'package:gp_project/routes/signup_screen.dart';
import 'package:gp_project/widgets/Custom_TextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp_project/routes/Home.dart';

import 'HomePage.dart';

class LoginScreen extends StatelessWidget {
  static String id='LoginScreen';
  final _auth=FirebaseAuth.instance;
  String email,password;
  @override
  Widget build(BuildContext context) {
       double height = MediaQuery.of(context).size.height;
        return Scaffold(
          resizeToAvoidBottomInset: false,
        backgroundColor: KMainColor,
          body: ListView(
            children:<Widget>[
            SizedBox(
               height: height*.2,
             ),
             CustomTextField(
                hint: 'Enter your email',
                icon: Icons.email,
               onclick: (value){
                 email=value;
               },
              ),
             SizedBox(
               height: height*.02,
             ), 
              CustomTextField(
                 icon: Icons.lock,
                 hint: 'Enter your password',
                onclick: (value){
                  password=value;
                },
                 ),
                SizedBox(
               height: height*.05,
             ),  
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120,vertical:30),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                    ),
                   onPressed: () async{
                    try{
                      //FirebaseUser user = (await FirebaseAuth.instance.
                      //signInWithEmailAndPassword(email: email, password: password))
                          //.user;
                      final user = await _auth.signInWithEmailAndPassword
                       (email: email, password: password);
                      if(user !=null){
                        Navigator.pushNamed(context, MyHomePage.id );
                      }
                    }catch(e){print(e);}
                    },
                  color: Colors.black,
                   child: Text(
                     'Login',
                     style: TextStyle(
                       color: Colors.white,
                     ),
                     ),
                   ),
              ) ,
              
              SizedBox(
               height: height*.01,
             ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text("Don't have an account ? ",
                   style: TextStyle(
                     color:Colors.white,
                     fontSize: 16
                     ),
                   ),
                   GestureDetector(
                     onTap: (){
                       Navigator.pushNamed(context, signup_screen.id);
                     },
                     child: Text('Sign up',
                     style: TextStyle(
                       fontSize: 16
                     ) ,
                     ),
                   ), 
                 ],
               ),
               SizedBox(
               height: height*.01,
             ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   GestureDetector(
                     onTap: (){
                       Navigator.pushNamed(context, ForgotPasswordScreen.id);
                     },
                     child: Text('Forgot Your Password ?            ',
                     style: TextStyle(
                       fontSize: 16,
                       color: Colors.white
                     ) ,
                     ),
                   ), 
                 ]
              ),
             
        ],
      ),
    );
  }
}
