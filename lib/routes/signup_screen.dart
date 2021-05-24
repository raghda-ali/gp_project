import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/widgets/Custom_TextField.dart';
import 'package:gp_project/routes/HomePage.dart';
import 'HomePageAfterLogin.dart';
import 'login_screen.dart';
import 'package:gp_project/routes/Home.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:gp_project/models/user.dart';
import 'package:gp_project/services/store.dart';


class signup_screen extends StatefulWidget {
  static String id = 'signupScreen';
  @override
  _signup_screen createState() => _signup_screen();
}

class _signup_screen extends State<signup_screen> {
  final GlobalKey<FormState> _globalkey = GlobalKey<FormState>();
  static String id = 'signupScreen';
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  user _user = user();
  String email, password, name, phone, address;
  var selectedType;
  List<String> _accountType = <String>[
    'special needs',
    'Rehabilitation center',
    'General',
  ];
  // String valuechoos='special needs';
  //List listItem = ["special needs","Rehabilitation center","Volunteer"];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
          backgroundColor: KMainColor,
          body: ModalProgressHUD (
            inAsyncCall: showSpinner,
              child: Form(
              key: _globalkey,
                        child: ListView(  
                          children:<Widget>[
                            SizedBox(
                              height: height*.05,
                            ),
                            CustomTextField(
                              hint: 'Enter your name',
                              icon: Icons.perm_identity,
                              onclick: (value) {
                                name = value;
                              },
                            ),
                            SizedBox(
                              height: height*.02,
                            ),
                            CustomTextField(
                              hint: 'Enter your phone',
                              icon: Icons.phone,
                              onclick: (value) {
                                phone = value;
                              },
                            ),
                           

                                  //  resizeToAvoidBottomPadding: false,
                                  //backgroundColor: KMainColor,
                                // body: ModalProgressHUD(
                              /*  inAsyncCall: showSpinner,
                              child: Form(
                                 key: _globalkey,
                                 child: ListView(
                                  children: <Widget>[
                                  SizedBox(
                                    height: height * .02,
                                     ),
                                     CustomTextField(
                                      hint: 'Enter your name',
                                      icon: Icons.perm_identity,
                                       onclick: (value) {
                                        name = value;
                                        },
                                       ),
                               SizedBox(
                                    height: height * .02,
                                     ),
                                   CustomTextField(
                                    hint: 'Enter your phone',
                                      icon: Icons.phone,
                                      onclick: (value) {
                                     phone = value;
                                   },
                                        ),*/
                        SizedBox(
                          height: height * .02,
                        ),
                        CustomTextField(
                          hint: 'Enter your address',
                          icon: Icons.home_outlined,
                          onclick: (value) {
                            address = value;
                          },
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        CustomTextField(
                          hint: 'Enter your email',
                          icon: Icons.email,
                          onclick: (value) {
                            email = value;
                          },
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        CustomTextField(
                          icon: Icons.lock,
                          hint: 'Enter your password',
                          onclick: (value) {
                            password = value;
                          },
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        /*Row(
                            children: <Widget>[
                              Padding(padding:const EdgeInsets.symmetric(horizontal: 30,) ),

                          Expanded(child:TextField(
                            //padding: const EdgeInsets.symmetric(horizontal: 30),
                            //keyboardType: TextInputType.number,
                          //TextField(
                            decoration: InputDecoration(
                                labelText: 'Type',
                                //hintText: '%',
                                filled: true,
                                fillColor: KSocondaryColor,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: Colors.white
                                    )
                                ),
                                focusedBorder:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: Colors.white
                                    )
                                ),
                                border:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: Colors.white
                                    )
                                )
                                >>>>>> Stashed changes

                            ),
                          //)
                              ),),
                              Expanded(child:DropdownButton<String>(
                                //DropdownButton<String>(
                                icon: Icon(Icons.keyboard_arrow_down),
                                items: listItem.map((valueItem){
                                  return DropdownMenuItem<String>(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                                onChanged: (String newValue){
                                  setState(() {valuechoos = newValue;});
                                },
                                value: valuechoos,
                              ),
                              ),

                         ] ),*/
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.account_box_sharp,
                              size: 25.0,
                              color: KSocondaryColor,
                            ),
                            SizedBox(width: 50.0),
                            new Theme(
                              data: Theme.of(context).copyWith(
                                canvasColor: KMainColor,
                              ),
                              child: DropdownButton(
                                items: _accountType
                                    .map((value) => DropdownMenuItem(
                                          child: Text(
                                            value,
                                            style: TextStyle(color: KSocondaryColor),
                                          ),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (selectedAccountType) {
                                  print('$selectedAccountType');
                                  setState(() {
                                    selectedType = selectedAccountType;
                                  });
                                },
                                value: selectedType,
                                isExpanded: false,
                                hint: Text(
                                  'Choose Account Type',
                                  style: TextStyle(color: KSocondaryColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 120, vertical: 0),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () async {
                                try {
                                  final newuser =
                                      await _auth.createUserWithEmailAndPassword(
                                          email: email, password: password);

                                  _user.uid = newuser.user.uid;
                                  _user.phone = phone;
                                  _user.address = address;
                                  _user.name = name;
                                  _user.email = newuser.user.email;
                                  _user.type = selectedType;
                                  store().create_user(_user);
                                  if (newuser != null) {
                                    Navigator.pushNamed(context, MyHomePage.id);
                                                      
                                  }
                                } catch (e) {
                                  print(e);
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
                          ),
                        
                        SizedBox(
                          height: height * .01,
                        ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Do have an account ? ",
                                      style: TextStyle(color: Colors.white, fontSize: 16),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, LoginScreen.id);
                                        
                                      },

                                    ),
    
                                   // RadioGroup(),
                                    //SizedBox(
                                    //  height: height*.03,
                                    //),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 120,vertical:0),
                                      child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        onPressed: ()async
                                        {
                                          //StepState.((){showSpinner=true;});
                                          //print(email);
                                          //print(password);
                                         /*if(_globalkey.currentState.validate())
                                         {
                                           //do something
                                         }*/
                                         try
                                         {
                                           final newuser = await _auth.createUserWithEmailAndPassword
                                           (email: email, password: password); 
                                           if (newuser !=null){
                                             Navigator.pushNamed(context,MyHomePage.id);
                                          
                                           }
                                         }catch(e){print(e);}
                                        },
                                        color: Colors.black,
                                        /*child: Text(
                                          'Sign up',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),*/

                                      child: Text(
                                        'Login',
                                        style: TextStyle(fontSize: 16),

                                      ),
                                    ),
                                    ),
                                  ],
                            ),
                               
                    
            ],
          ),
                      ),
                    ),
                  
                
              
      
      
    );
  }
}
/*class RadioGroup extends StatefulWidget {
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
}*/