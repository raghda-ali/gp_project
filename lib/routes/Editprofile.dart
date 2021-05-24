import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/models/services.dart';
import 'package:gp_project/models/user.dart';
import 'package:gp_project/routes/myservices_screen.dart';
import 'package:gp_project/routes/profile.dart';
import 'package:gp_project/widgets/Custom_TextField.dart';
import 'package:gp_project/services/store.dart';
import 'package:gp_project/models/product.dart';
import 'package:gp_project/routes/myproducts_screen.dart';


class Editprofile extends StatefulWidget {
  static String id ='Editprofile';
  @override
  _Editprofile createState() => _Editprofile();}

class _Editprofile extends State<Editprofile> {
  final _store = store();
  final GlobalKey<FormState>_globalkey = GlobalKey<FormState>();
  String name;
  String phone;
  String address;
  String email;
  //String type;
  var selectedType;
  List<String> _accountType = <String>[
    'special needs',
    'Rehabilitation center',
    'General',
  ];

  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();

  Widget _buildTitle(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 10,
      validator: (String value){
        if(value.isEmpty){
          return 'Name is required';
        }
        return null;
      },
      onSaved: (String value){
        name=value;
      },


    );
  }

  Widget _buildDescription(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone'),
      //maxLength: 10,
      validator: (String value){
        if(value.isEmpty){
          return 'phone is required';
        }
        return null;
      },
      onSaved: (String value){
        phone=value;
      },
    );
  }
  Widget _buildcategory(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Address'),
      //maxLength: 10,
      validator: (String value){
        if(value.isEmpty){
          return 'address is required';
        }
        return null;
      },
      onSaved: (String value){
        address =value;
      },
    );
  }

  /*Widget _buildContact_Phone(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Type'),
      //maxLength: 10,
      cursorColor: KMainColor,
      validator: (String value){
        if(value.isEmpty){
          return 'type is required';}
        return null;
      },
      onSaved: (String value){
        type=value;
      },
    );;
  }*/

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
        email=value;
      },
    );;
  }

  @override
  Widget build(BuildContext context) {
    user current = ModalRoute.of(context).settings.arguments;
    //String pId =ModalRoute.of(context).settings.arguments;
    // FieldPath.documentId;
    return Scaffold(
     // resizeToAvoidBottomPadding: false,
     resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('My profile'),backgroundColor: KMainColor,),

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
                decoration: InputDecoration(labelText: 'Name :  ${current.name}',
                    labelStyle: TextStyle(color:darkColor)),
                //maxLength: 10,
                validator: (String value){
                  if(value.isEmpty){
                    return 'Name is required';
                  }
                  return null;
                },
                onSaved: (String value){
                  name=value;
                },


              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone :  ${current.phone}'
                    ,labelStyle: TextStyle(color:darkColor)),
                //maxLength: 10,
                validator: (String value){
                  if(value.isEmpty){
                    return 'Phone is required';
                  }
                  return null;
                },
                onSaved: (String value){
                  phone=value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address :  ${current.address}'
                    ,labelStyle: TextStyle(color:darkColor)),
                //maxLength: 10,
                validator: (String value){
                  if(value.isEmpty){
                    return 'address is required';
                  }
                  return null;
                },
                onSaved: (String value){
                  address =value;
                },
              ),
             /* TextFormField(
                decoration: InputDecoration(labelText: 'Type :  ${current.type}'
                    ,labelStyle: TextStyle(color:darkColor)),
                //maxLength: 10,
                cursorColor: KMainColor,
                validator: (String value){
                  if(value.isEmpty){
                    return 'type is required';}
                  return null;
                },
                onSaved: (String value){
                  type=value;
                },
              ),*/
              TextFormField(
                decoration: InputDecoration(labelText: 'Email :  ${current.email}'
                    ,labelStyle: TextStyle(color:darkColor)),
                //maxLength: 10,
                cursorColor: KMainColor,
                validator: (String value){
                  if(value.isEmpty){
                    return 'Email is required';}
                  return null;
                },
                onSaved: (String value){
                  email=value;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.account_box_sharp,
                    size: 25.0,
                    color: Colors.black,
                  ),
                  SizedBox(width: 50.0),
                  DropdownButton(
                    items: _accountType
                        .map((value) => DropdownMenuItem(
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black),
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
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
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
                    _store.Editprofile({
                      Kusername:name,
                      Kuserphone:phone,
                      Kuseremail:email,
                    Kuseraddress:address,
                      Kusertype:selectedType,
                    }
                    ,current.uid);
                      /*KServiceTitle:title,
                      KServiceDescription: description,
                      KServiceCategory: category,
                      KServicecontact_Phone: contact_phone,
                      KServicecontact_Email:contact_email
                    },serv.servId);*/
                  }

                  Navigator.pushNamed(context, profile.id);
                  _formkey.currentState.save();
                  print(name);
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
                      'Submit',
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


