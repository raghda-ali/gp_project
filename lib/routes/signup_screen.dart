import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/widgets/Custom_TextField.dart';

import 'login_screen.dart';


class signup_screen extends StatelessWidget {
  final GlobalKey<FormState>_globalkey = GlobalKey<FormState>();
  static String id='signupScreen';
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: KMainColor,
      body: Form(
        key: _globalkey,
        child: ListView(
          children:<Widget>[
            SizedBox(
              height: height*.02,
            ),
            CustomTextField(
              hint: 'Enter your name',
              icon: Icons.perm_identity,
            ),
            SizedBox(
              height: height*.02,
            ),
            CustomTextField(
              hint: 'Enter your phone',
              icon: Icons.phone,
            ),
            SizedBox(
              height: height*.02,
            ),
            CustomTextField(
              hint: 'Enter your address',
              icon: Icons.home_outlined,
            ),
            SizedBox(
              height: height*.02,
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

            RadioGroup(),
            SizedBox(
              height: height*.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120,vertical:0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                onPressed: ()
                {
                 if(_globalkey.currentState.validate())
                 {
                   //do something
                 }
                },
                color: Colors.black,
                child: Text(
                  'Sign up',
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
                Text("Do have an account ? ",
                  style: TextStyle(
                      color:Colors.white,
                      fontSize: 16
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, LoginScreen.id);

                  },
                  child: Text('Login',
                    style: TextStyle(
                        fontSize: 16
                    ) ,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
class RadioGroup extends StatefulWidget {
  @override
  RadioGroupWidget createState() => RadioGroupWidget();
}

class RadioGroupWidget extends State {

  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'ONE';

  // Group Value for Radio Button.
  int id = 1;

  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
    Padding(
    padding: EdgeInsets.all(10.0),
              child: Text('Account Type',
                  style: (TextStyle(fontSize: 21)
                  )
                  )//style
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio(
              value: 1,
              activeColor: KSocondaryColor,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'User';
                  id = 1;
                });
              },
            ),
            Text(
              'User',
              style: new TextStyle(fontSize: 17.0),
            ),

            Radio(
              value: 2,
              activeColor: KSocondaryColor,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'Company';
                  id = 2;
                });
              },
            ),
            Text(
              'Company',
              style: new TextStyle(
                fontSize: 17.0,
              ),
            ),
          ],
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Radio(
              value: 3,
              activeColor: KSocondaryColor,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'Rehabilitation_center';
                  id = 3;
                });
              },
            ),
            Text(
              'Rehabilitation_center',
              style: new TextStyle(fontSize: 17.0),
            ),
            ],
            ),
        Row(
               mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio(
                   value: 4,
               activeColor: KSocondaryColor,
                groupValue: id,
               onChanged: (val) {
                setState(() {
                  radioButtonItem = 'Charitable_organization';
                  id = 4;
                });
              },
            ),
            Text(
              'Charitable_organization',
              style: new TextStyle(fontSize: 17.0),
            ),
            ],
            ),
      ],
    );
  }
}