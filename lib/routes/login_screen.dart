import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/routes/signup_screen.dart';
import 'package:gp_project/widgets/Custom_TextField.dart';



class LoginScreen extends StatelessWidget {
  static String id='LoginScreen';
  @override
  Widget build(BuildContext context) {
       double height = MediaQuery.of(context).size.height;
        return Scaffold(
        backgroundColor: KMainColor,
          body: ListView(
            children:<Widget>[
            SizedBox(
               height: height*.2,
             ),
             CustomTextField(
                hint: 'Enter your email',
                icon: Icons.email,
              ),
             SizedBox(
               height: height*.02,
             ), 
              CustomTextField(
                 icon: Icons.lock,
                 hint: 'Enter your password',
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
                   onPressed: () {  },
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
                   )
                 ],
               )
        ],
      ),
    );
  }
}
