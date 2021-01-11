import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/widgets/Custom_TextField.dart';
import 'package:gp_project/services/store.dart';
import 'package:gp_project/models/Jobs.dart';
import 'package:gp_project/routes/myjobs_screen.dart';
import 'package:gp_project/routes/myjobs_screen.dart';

class addmyjobs extends StatelessWidget {
  static String id ='add jobs';
  final _store = store();
  final GlobalKey<FormState>_globalkey = GlobalKey<FormState>();

  String title;
  String description;
  String contact_Email;
  String contact_phone;

  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  Widget _buildTitle(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Title'),
      maxLength: 10,
      validator: (String value){
        if(value.isEmpty){
          return 'Title is required';
        }
        return null;
      },
      onSaved: (String value){
        title=value;
      },


    );
  }

  Widget _buildDescription(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Description'),
      //maxLength: 10,
      validator: (String value){
        if(value.isEmpty){
          return 'Description is required';
        }
        return null;
      },
      onSaved: (String value){
        description=value;
      },
    );
  }
  Widget _buildContact_Email(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Contact us by Email'),
      //maxLength: 10,
      validator: (String value){
        //if(value.isEmpty){
        // return 'Title is required';}
        if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
          return 'Please enter a valid email';

        }
        return null;
      },
      onSaved: (String value){
        contact_Email=value;
      },
    );;
  }

  Widget _buildContact_Phone(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Contact us by Phone'),
      maxLength: 10,
      cursorColor: KMainColor,
      validator: (String value){
        if(value.isEmpty){
          return 'Phone is required';}
        return null;
      },
      onSaved: (String value){
        contact_phone=value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text('My Job'),backgroundColor: KMainColor,),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildTitle(),
              _buildDescription(),
              _buildContact_Email(),
              _buildContact_Phone(),
              SizedBox(height: 50),
              RaisedButton(
                onPressed: () {
                  if(_formkey.currentState.validate()){
                    _formkey.currentState.save();
                    _store.addjobs(job(
                      jTitle:  title,
                      jDescription:  description,
                      jContact_Email: contact_Email ,
                      jContact_phone:  contact_phone,


                    )
                    );
                  }

                  Navigator.pushNamed(context,MyJobs.id);
                  _formkey.currentState.save();
                  print(title);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                padding: const EdgeInsets.all(0.0),
                child: Ink(
                  decoration: const BoxDecoration(
                    gradient: purpleGradient,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Container(
                    constraints: const BoxConstraints(
                        minWidth: 88.0,
                        minHeight: 36.0), // min sizes for Material buttons
                    alignment: Alignment.center,
                    child:const Text(
                      'add job',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );

  }}
