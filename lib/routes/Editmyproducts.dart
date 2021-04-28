import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/services/store.dart';
import 'package:gp_project/models/product.dart';


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
    product pro = ModalRoute.of(context).settings.arguments;
    //String pId =ModalRoute.of(context).settings.arguments;
   // FieldPath.documentId;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('My Product'),backgroundColor: KMainColor,),
      
      body:/*  StreamBuilder<QuerySnapshot>(
        stream: _store.loadproducts(),
        builder: (context, Snapshot) {
          if (Snapshot.hasData){
            List<product> products = [];
              for (var doc in Snapshot.data.docs) {
                //var data=doc.data();
                products.add(product(
                    pId: doc.id,
                    pTitle: doc.data()[KProductTitle],
                    pDescription: doc.data()[KProductDescription],
                    pPrice: doc.data()[KProductPrice],
                    pContact_phone: doc.data()[KProductcontact_Phone]));
              }
          return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) =>*/
      Container(
              margin: EdgeInsets.all(24),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
      decoration: InputDecoration(labelText: 'Title :  ${pro.pTitle}',labelStyle: TextStyle(color:darkColor)),
     // maxLength: 10,
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
      decoration: InputDecoration(labelText: 'Description :  ${pro.pDescription}',labelStyle: TextStyle(color:darkColor)),
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
      decoration: InputDecoration(labelText:'Price :  ${pro.pPrice}',labelStyle: TextStyle(color:darkColor)),
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
    ),
    TextFormField(
      decoration: InputDecoration(labelText:'Contact us by phone :  ${pro.pContact_phone}',labelStyle: TextStyle(color:darkColor)),
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
                   // _buildTitle(),
                   // _buildDescription(),
                   // _buildPrice(),
                  //  _buildContact_Phone(),
                    SizedBox(height: 50),
                    RaisedButton(
                      onPressed: () {
                        if (_formkey.currentState.validate()) {
                                  _formkey.currentState.save();
                                  _store.Editmyproducts({
                                    KProductTitle:title,
                                    KProductDescription: description,
                                    KProductPrice: price,
                                    KProductcontact_Phone: contact_phone
                                  },pro.pId);
                                }
                        /*if(_formkey.currentState.validate()){
                          _formkey.currentState.save();
                         _store.Editmyproducts({
                        KProductTitle:title,
                        KProductPrice:price,
                        KProductDescription:description,
                        KProductcontact_Phone:contact_phone,
                      }, pro.pId);
                        }*/

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
          }

        }
      //),
        
   // );

  //}
