/*

import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/models/services.dart';
import 'package:gp_project/services/store.dart';
import 'package:gp_project/routes/myservices_screen.dart';
class Editmyservices extends StatelessWidget{
  static String id="Editmyservices";
  final _store = store();
  String title;
  String category;
  String description;
  String contact_phone;
  String contact_email;
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    //String documentId = ModalRoute.of(context).settings.arguments;
    //service service = odalRoute.of(context).settings.arguments;
    // TODO: implement build
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _store.loadservices(),
        builder: (context,Snapshot){
          if(!Snapshot.hasData){
            return Center(
              child: Text('My services is empty'),
            );
          }else{
           List<service> services =[];
            for(var doc in Snapshot.data.docs){
              //var data=doc.data();
              services.add(service(
                servtitle: doc.data()[KServiceTitle],
                servcategory: doc.data()[KServiceCategory],
                servdescription: doc.data()[KServiceDescription],
                servcontact_email: doc.data()[KServicecontact_Email],
                servcontact_phone: doc.data()[KServicecontact_Phone]
              )
              );
            }
            return ListView.builder(itemBuilder:
            (context,index)=>Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildTitle(services[index].servtitle),
              _buildCategory(services[index].servcategory),
              _buildDescription(services[index].servdescription),
              _buildContact_Phone(services[index].servcontact_phone),
              _buildContact_Email(services[index].servcontact_email),
              SizedBox(height: 50),
              RaisedButton(
                    onPressed: () {
                      if(_formkey.currentState.validate()){
                        _formkey.currentState.save();
                        _store.addservice(service(
                           servtitle: title,
                           servcategory: category,
                           servcontact_email: contact_email,
                           servcontact_phone: contact_phone,
                           servdescription: description,
                        )
                        );
                      }
                  Navigator.pushNamed(context, myservices.id);
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
          }
        },
      ),
    );
  }//build
  Widget _buildTitle(String title){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Title :$title'),
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
  Widget _buildCategory(String cat){
    return  TextFormField(
      decoration: InputDecoration(labelText: 'Category :$cat'),
      maxLength: 10,
      validator: (String value){
        if(value.isEmpty){
          return 'Category is required';
        }
        return null;
      },
      onSaved: (String value){
        category=value;
      },
    );;
  }
  Widget _buildDescription(String desc){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Description :$desc'),
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
    );;
  }
  Widget _buildContact_Phone(String phone){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Contact us by Phone :$phone'),
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
    );;
  }
  Widget _buildContact_Email(String email){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Contact us by Email :$email'),
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
        contact_email=value;
      },
    );
  }
  }*/