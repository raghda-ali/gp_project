import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';

class addmyproducts extends StatelessWidget {
  String title;
  String category;
  String description;
  String contact_phone;
  String contact_email;
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  Widget _buildTitle(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Title'),
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

  Widget _buildDescription(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Description'),
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
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Products'),backgroundColor: KMainColor,),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildTitle(),           
              _buildDescription(),
             
              _buildContact_Phone(),
            
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
                          'Add Product',
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
        