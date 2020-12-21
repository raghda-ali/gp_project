import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/widgets/Custom_TextField.dart';
import 'package:gp_project/services/store.dart';
import 'package:gp_project/models/product.dart';
import 'package:gp_project/routes/myproducts_screen.dart';


class Editmyproducts extends StatelessWidget {
  static String id ='Editproduct';
  final _store = store();
  final GlobalKey<FormState>_globalkey = GlobalKey<FormState>();
  String title;
  String description;
  String price;
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
  Widget _buildPrice(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Price'),
      //maxLength: 10,
      validator: (String value){
        if(value.isEmpty){
          return 'Price is required';
        }
        return null;
      },
      onSaved: (String value){
        price =value;
      },
    );
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
    );;
  }

  @override
  Widget build(BuildContext context) {
   // FieldPath.documentId;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text('My Product'),backgroundColor: KMainColor,),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildTitle(),
              _buildDescription(),
              _buildPrice(),
              _buildContact_Phone(),
              SizedBox(height: 50),
              RaisedButton(
                onPressed: () {
                  if(_formkey.currentState.validate()){
                    _formkey.currentState.save();
                   _store.Editmyproducts(title
                       , product().pId);
                  }

                  Navigator.pushNamed(context, Editmyproducts.id);
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
                      'Edit product',
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
