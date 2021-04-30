import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/routes/TestCategory.dart';
import 'package:gp_project/widgets/Custom_TextField.dart';
import 'package:gp_project/services/store.dart';
import 'package:gp_project/models/services.dart';
import 'package:gp_project/routes/myservices_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'dart:io';



class addmyservice extends StatefulWidget {
  static String id ='addservice';
  @override
  _addmyserviceState createState() => _addmyserviceState();
}
class _addmyserviceState extends State<addmyservice> {
  final _store = store();
  File _image;
  var selectedCurrency;
 final GlobalKey<FormState>_globalkey = GlobalKey<FormState>();
  String title;
  String category;
  String description;
  String contact_phone;
  String contact_email;
  String _photo;
  

Future getImageFromCam() async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });

  }

  Future getImageFromGallery() async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

Future uploadImage() async {    
  Reference storageReference = FirebaseStorage.instance.ref().child('Images/image7');        
  UploadTask uploadTask = storageReference.putFile(_image);   
   var  imageUrl= await (await uploadTask).ref.getDownloadURL();
   print(imageUrl);
   _photo = imageUrl;
   print(_photo);
 }  
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

/*  Widget _buildCategory(){
    return  TextFormField(
      decoration: InputDecoration(labelText: 'Category'),
      //maxLength: 10,
      validator: (String value){
        if(value.isEmpty){
          return 'Category is required';
        }
        return null;
      },
      onSaved: (String value){
        category=value;
      },
    );
  }*/

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
    );;
  }

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
        contact_email=value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text('My Service'),backgroundColor: KMainColor,),
      body: Container(
        margin: EdgeInsets.all(25),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(child:
          Container(
          width:MediaQuery.of(context).size.width ,
          height: 35,
          child: Center(
            child: _image == null ? Text('No selected images') :Image.file(_image),
          ),
        ),
        ),
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton(
            heroTag: null,
            backgroundColor: Colors.purple[200],
            mini: true,
            onPressed: getImageFromCam,
            child: Icon(Icons.add_a_photo),
            ),
             FloatingActionButton(
               heroTag: null,
               backgroundColor: Colors.purple[200],
               mini: true,
               onPressed: getImageFromGallery,
               child: Icon(Icons.wallpaper),
            ),
        ],
      ),
      /* SizedBox(height: 20,),
         SingleChildScrollView(
           child: Row(
             mainAxisAlignment:  MainAxisAlignment.center,
             children: <Widget>[
               Icon(FontAwesomeIcons.moneyBill,
               size: 25.0,),
               SizedBox(width: 50.0,),
               DropdownButton(
                 items: _accounttype.map((value)=> DropdownMenuItem(
                   child: Text(
                     value,
                     style: TextStyle(color: Colors.white)),
                   value: value,)).toList()
                 ),
      
             ],

           ),
         ),*/
              _buildTitle(),
              /*_buildCategory(),*/
              _buildDescription(),
              _buildContact_Phone(),
              _buildContact_Email(),
              SizedBox(height: 20),
              StreamBuilder<QuerySnapshot>(
                   stream: FirebaseFirestore.instance.collection("Products").orderBy('ProductTitle').snapshots(),
                      builder: (context, snapshot){
                        if (!snapshot.hasData)
                           Text("No Data");
                        else {
                          List<DropdownMenuItem> categoryItems = [];
                          List<String> categorydata=[];
                          for (int i = 0; i < snapshot.data.docs.length; i++) {
                            // DocumentSnapshot snap = snapshot.data.docs[i].get('ProductTitle');
                            String test = snapshot.data.docs[i].get('ProductTitle').toString();
                            print('ProductTitle test : $test');
                           // List<String> categorydata=[];
                            categorydata.add(test);
                            categoryItems.add(
                               DropdownMenuItem(
                                //  snap.get('ProductTitle')
                                  child: Text(test,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  // "${snap.get('ProductTitle')}"
                                value: test,
                                ),
                              );
                            
                            
                          }
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(FontAwesomeIcons.coins,
                                  size: 25.0, color: Colors.purple[200]),
                              SizedBox(width: 50.0),
                              DropdownButton(
                                items: categoryItems,
                                onChanged: (categoryValue) {
                                  final snackBar = SnackBar(
                                    content: Text(
                                      'Selected Category is $categoryValue',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  );
                                  Scaffold.of(context).showSnackBar(snackBar);
                                  setState(() {
                                    selectedCurrency = categoryValue;
                                  });
                                },
                                value: selectedCurrency,
                                isExpanded: false,
                                hint: new Text(
                                  "Choose Category Type",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          );
                        
                        }
                        return Text("Loading....");
                      }),

                   
                    
              RaisedButton(
                    onPressed: () {
                      if(_formkey.currentState.validate()){
                        _formkey.currentState.save();
                        _store.addservice(service(
                           servtitle: title,
                          /* servcategory: category,*/
                           servcontact_email: contact_email,
                           servcontact_phone: contact_phone,
                           servdescription: description,
                           servImage: _photo,
                           servcategory: selectedCurrency,

                        )
                        );
                      }
                     /* if(_formkey.currentState.validate()){
                        Scaffold
                          .of(context)
                          .showSnackBar(SnackBar(content: Text('Processing Data')));
                  }*/
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
               
                   RaisedButton(
               color: Colors.white60,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
              onPressed: (){
                uploadImage();
              },
              child: Text('Upload Image'),
             ),

             
               
               


          
             
                         /* RaisedButton(onPressed:(){
                          Navigator.pushNamed(context,Test.id);

                          } ,)*/
               
              /*RaisedButton(
              child: Text('Add',
                style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 13,
                    color: Colors.black),
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
        