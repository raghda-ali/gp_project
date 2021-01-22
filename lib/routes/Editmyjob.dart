import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/models/Jobs.dart';
import 'package:gp_project/models/services.dart';
import 'package:gp_project/routes/addmyjobs.dart';
import 'package:gp_project/routes/myservices_screen.dart';
import 'package:gp_project/widgets/Custom_TextField.dart';
import 'package:gp_project/services/store.dart';
import 'package:gp_project/models/product.dart';
import 'package:gp_project/routes/myproducts_screen.dart';

import 'myjobs_screen.dart';


class Editmyjob extends StatelessWidget {
  static String id ='Editsjob';
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
      //maxLength: 10,
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
  /*Widget _buildcategory(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Category'),
      //maxLength: 10,
      validator: (String value){
        if(value.isEmpty){
          return 'Category is required';
        }
        return null;
      },
      onSaved: (String value){
        category =value;
      },
    );
  }*/

  Widget _buildContact_Phone(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Contact us by Phone'),
      //maxLength: 10,
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

  Widget _buildContact_email(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Contact us by Email'),
      //maxLength: 10,
      cursorColor: KMainColor,
      validator: (String value){
        if(value.isEmpty){
          return 'Email is required';}
        return null;
      },
      onSaved: (String value){
        contact_Email=value;
      },
    );;
  }

  @override
  Widget build(BuildContext context) {
    job jb = ModalRoute.of(context).settings.arguments;
    //String pId =ModalRoute.of(context).settings.arguments;
    // FieldPath.documentId;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text('My jobs'),backgroundColor: KMainColor,),

      body: /* StreamBuilder<QuerySnapshot>(
        stream: _store.loadservices(),
        builder: (context, Snapshot) {
          if (Snapshot.hasData){
            List<service> services = [];
              for (var doc in Snapshot.data.docs) {
                //var data=doc.data();
                services.add(service(
                servId: doc.id,
                servtitle: doc.data()[KServiceTitle],
                servcategory: doc.data()[KServiceCategory],
                servdescription: doc.data()[KServiceDescription],
                servcontact_email: doc.data()[KServicecontact_Email],
                servcontact_phone: doc.data()[KServicecontact_Phone]
              )
              );
              }
          return ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) =>*/Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Title :  ${jb.jTitle}',
                    labelStyle: TextStyle(color:darkColor)),
                //maxLength: 10,
                validator: (String value){
                  if(value.isEmpty){
                    return 'Title is required';
                  }
                  return null;
                },
                onSaved: (String value){
                  title=value;
                },


              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description :  ${jb.jDescription}'
                    ,labelStyle: TextStyle(color:darkColor)),
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
              ),

              TextFormField(
                decoration: InputDecoration(labelText: 'Contact us by Phone :  ${jb.jContact_phone}'
                    ,labelStyle: TextStyle(color:darkColor)),
                //maxLength: 10,
                cursorColor: KMainColor,
                validator: (String value){
                  if(value.isEmpty){
                    return 'Phone is required';}
                  return null;
                },
                onSaved: (String value){
                  contact_phone=value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Contact us by Email :  ${jb.jContact_Email}'
                    ,labelStyle: TextStyle(color:darkColor)),
                //maxLength: 10,
                cursorColor: KMainColor,
                validator: (String value){
                  if(value.isEmpty){
                    return 'Email is required';}
                  return null;
                },
                onSaved: (String value){
                  contact_Email=value;
                },
              ),
              /*_buildTitle(),
                    _buildcategory(),
                    _buildDescription(),
                  _buildContact_Phone(),
                    _buildContact_email(),*/

              SizedBox(height: 50),
              RaisedButton(
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    _formkey.currentState.save();
                    _store.Editmyjobs({
                      KJobTitle:title,
                      KJobDescription: description,
                      KJobcontact_Phone: contact_phone,
                      KJobcontact_Email:contact_Email
                    },jb.jId);
                  }

                  Navigator.pushNamed(context, MyJobs.id);
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
                      'Edit job',
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
  }

}
//),

// );


