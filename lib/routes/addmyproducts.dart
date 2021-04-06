import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/widgets/Custom_TextField.dart';
import 'package:gp_project/services/store.dart';
import 'package:gp_project/models/product.dart';
import 'package:gp_project/routes/Products_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'dart:io';

class addmyproducts extends StatefulWidget {
  static String id ='addproduct';

  @override
  _addmyproductsState createState() => _addmyproductsState();
}
class _addmyproductsState extends State<addmyproducts> {
  final _store = store();
  File _image;
  final GlobalKey<FormState>_globalkey = GlobalKey<FormState>();
  String title;
  String description;
  String price;
  String contact_phone;
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
  Reference storageReference = FirebaseStorage.instance.ref().child('Images/image2');        
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
              Flexible(child:
          Container(
          width:MediaQuery.of(context).size.width ,
          height: 100,
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
            backgroundColor: Colors.red[300],
            mini: true,
            onPressed: getImageFromCam,
            child: Icon(Icons.add_a_photo),
            ),
             FloatingActionButton(
               heroTag: null,
               backgroundColor: Colors.red[300],
               mini: true,
               onPressed: getImageFromGallery,
               child: Icon(Icons.wallpaper),
            ),
        ],
      ),
              _buildTitle(),
              _buildDescription(),
              _buildPrice(),
              _buildContact_Phone(),
              SizedBox(height: 50),
              RaisedButton(
                onPressed: () {
                  if(_formkey.currentState.validate()){
                    _formkey.currentState.save();
                    _store.addproducts(product(
                      pTitle:  title,
                      pDescription:  description,
                      pPrice:  price,
                      pContact_phone:  contact_phone,
                      pImage: _photo,
                    )
                    );
                  }

                  Navigator.pushNamed(context, MyProducts.id);
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
                      'add product',
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

            ],
          ),
        ),
      ),
    );

  }}

/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/services/store.dart';
import 'package:gp_project/models/product.dart';
import 'package:gp_project/routes/myproducts_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'dart:io';



class addmyproducts extends StatefulWidget {
  static String id ='addproduct';

  @override
  _addmyproductsState createState() => _addmyproductsState();
}

class _addmyproductsState extends State<addmyproducts> {
  final _store = store();
  File _image;
  final GlobalKey<FormState>_globalkey = GlobalKey<FormState>();
  String title;
  String description;
  String price;
  String contact_phone;
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
  Reference storageReference = FirebaseStorage.instance.ref().child('Images/image3');        
  UploadTask uploadTask = storageReference.putFile(_image);   
   var  imageUrl= await (await uploadTask).ref.getDownloadURL();
   print(imageUrl);
   _photo = imageUrl;
   print(_photo);
 }  

  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();

  Widget _buildTitle(){
    return 
    TextFormField(
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
    body: Form(
     child:Padding(padding : EdgeInsets.only(top:50 , right:20 , left :20),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(child:
          Container(
          width:MediaQuery.of(context).size.width ,
          height: 100,
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
                backgroundColor: Colors.red[300],
                mini: true,
                onPressed: getImageFromCam,
                child: Icon(Icons.add_a_photo),
                ),
                 FloatingActionButton(
                   heroTag: null,
                   backgroundColor: Colors.red[300],
                   mini: true,
                   onPressed: getImageFromGallery,
                   child: Icon(Icons.wallpaper),
                ),
            ],
          ),
          Container(
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
                        _store.addproducts(product(
                          pTitle:  title,
                          pDescription:  description,
                          pPrice:  price,
                          pContact_phone:  contact_phone,
                        )
                        );
                      }
    
                      Navigator.pushNamed(context, MyProducts.id);
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
                          'add product',
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
  }*/

