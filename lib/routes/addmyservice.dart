import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';

class addmyservice extends StatelessWidget {
  String title;
  String category;
  String description;
  String contact_phone;
  String contact_email;
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  Widget _buildTitle(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Title'),
      validator: (String value){
        if(value.isEmpty){
          return 'Title is required';
        }
      },
      onSaved: (String value){
        title=value;
      },
    );
  }
  Widget _buildCategory(){
    return  TextFormField(
      decoration: InputDecoration(labelText: 'Category'),
      validator: (String value){
        if(value.isEmpty){
          return 'Category is required';
        }
      },
      onSaved: (String value){
        category=value;
      },
    );;
  }
  Widget _buildDescription(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Description'),
      validator: (String value){
        if(value.isEmpty){
          return 'Description is required';
        }
      },
      onSaved: (String value){
        description=value;
      },
    );;
  }
  Widget _buildContact_Phone(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Contact us by Phone'),
      validator: (String value){
        if(value.isEmpty){
          return 'Phone is required';}
      },
      onSaved: (String value){
        contact_phone=value;
      },
    );;
  }
  Widget _buildContact_Email(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Contact us by Email'),
      validator: (String value){
        //if(value.isEmpty){
         // return 'Title is required';}
         if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
           return 'Please enter a valid email';

         }
      },
      onSaved: (String value){
        contact_email=value;
      },
    );;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Service'),backgroundColor: KMainColor,),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildTitle(),
              _buildCategory(),
              _buildDescription(),
              _buildContact_Phone(),
              _buildContact_Email(),
              SizedBox(height: 100),
              RaisedButton(
                    onPressed: () {
                      if(!_formkey.currentState.validate()){
                    return ;
                  }
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
                          'Add Service',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
              /*RaisedButton(
              child: Text('Add',
                style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 13,
                    color: Colors.white),
                    ),
                onPressed: (){
                  if(!_formkey.currentState.validate()){
                    return ;
                  }
                  _formkey.currentState.save();
                  print(title);
                }
                ),*/
            ],
            ),
            ),
      ),
    );
       
        }}
        