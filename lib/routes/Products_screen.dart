import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/models/product.dart';
import 'package:gp_project/routes/HomePage.dart';
import 'package:gp_project/routes/MyProductsByID.dart'as pro;
import 'package:gp_project/routes/ProductSearch.dart';
import 'package:gp_project/routes/addmyproducts.dart';
import 'package:gp_project/routes/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp_project/routes/Products_screen.dart' as pro;
import 'package:gp_project/routes/Services_screen.dart' as serv;
import 'package:gp_project/routes/Jobs_screen.dart' as jo;
import 'package:gp_project/routes/product_details.dart' as de;
import 'package:gp_project/routes/productlist.dart';
import 'package:gp_project/routes/resultDropDown.dart';
import 'package:gp_project/services/DataController.dart';
import 'package:gp_project/services/store.dart';
import 'HomePageAfterLogin.dart';
import 'MyJobByID.dart';
import 'MyServicesByID.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Rating.dart'; 

//import 'dart:html';

class MyProducts extends StatefulWidget {
   static String id = 'MyProducts';

  @override
  _MyProductsState createState() => _MyProductsState();
}


class _MyProductsState extends State<MyProducts> {
    final _auth = FirebaseAuth.instance;

    final store _store = store();
   // double rating = 4.0;
     double _rating;
     double _rate;
    QuerySnapshot snapshotData;
    var  selectedType;
    List<DropdownMenuItem> categoryItems;
    List<int> _accountType = <int>[
    0,
    500,
    1000,
    10000,
    100000,
    1000000,
  ];
  List<String> _accountTypee = <String>[
    'special needs',
    'Rehabilitation center',
    'General',
  ];
  //var _accountType={};

  bool filter = false;
    bool filter2 = false;
   List<product> productss = [];
  
  @override
  /*void initState(){
  getNamePreference().then(updateName);
  super.initState();
}*/
  Widget build(BuildContext context) {
    
    Container _backBgCover() {
      return Container(
        //height:0.0,
        decoration: BoxDecoration(
          gradient: purpleGradient,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(88),
            bottomRight: Radius.circular(88),
          ),
        ),
      );
    }

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mainBgColor,
      appBar: AppBar(
          elevation: 0,
          title: Text('Products',
              style: TextStyle(
                fontSize: 25,
              )),
          actions: [IconButton(icon: Icon(Icons.search),iconSize:30, onPressed:(){
             Navigator.pop(context);
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new Search()));
          })],
          backgroundColor: KMainColor),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(color: KMainColor),
                child: Column(children: <Widget>[
                  Icon(
                    Icons.account_circle,
                    size: 100,
                    color: Colors.white,
                  ),
                  Text(
                    '${_auth.currentUser.email}',
                    //'User Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ])),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home page'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new MyHomePageAfterLogin()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
            ),
            /*ListTile(
              leading: Icon(Icons.attach_money_outlined),
              title: Text('My Donation'),
            ),*/
            ListTile(
              leading: Icon(Icons.support),
              title: Text('My Services'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new MyServicesByID()));
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('My Product'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new pro.MyProductsByID()));
              },
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('My Jobs'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new MyJobByID()));
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Log out'),
              onTap: () {
                _auth.signOut();
                Navigator.pushNamed(context, LoginScreen.id);
              },
            )
          ],
        ),
      ),
      
      body: Column(
         children :<Widget>[
     
                 Flexible(
                   flex: 1,
                   child: Row(
                     children: <Widget>[
                       DropdownButton(
                              items: _accountType.map((value) => DropdownMenuItem(
                                        child: Text(
                                          value.toString(),
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        value: value,
                                      )
                                      ).toList(),
                              onChanged: (selectedCategoryType) async {
                                print('$selectedCategoryType');
                                selectedType=selectedCategoryType;
                                DataController dd = DataController();
                                  await dd.filterData(selectedCategoryType).then((value)  {
                                               setState(() {
                                                
                                                 snapshotData = value;
                                                 snapshotData.docs.length != 0 ? filter = true: filter = false;
                                                  productss.clear();
                                              print('snap is : ${snapshotData.docs.length}');
                                            print('value is : ${value.docs[0].data()}');
                        for (var doc in snapshotData.docs) {

                        //var data=doc.data();
                        productss.add(product(
                            pId: doc.id,
                            pTitle: doc.data()[KProductTitle],
                            pDescription: doc.data()[KProductDescription],
                            pPrice: doc.data()[KProductPrice],
                            pContact_phone: doc.data()[KProductcontact_Phone],
                            pImage: doc.data()[KProductImage]
                            ));
                            print('loop data : ${productss[0].pTitle}');
                }
                                  
                                });
                                });                               
                              },//onchanged
                              value: selectedType,
                              isExpanded: false,
                              hint: Text(
                                'Choose Price Value',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),

                //             DropdownButton(
                //               items: _accountTypee.map((value) => DropdownMenuItem(
                //                         child: Text(
                //                           value.toString(),
                //                           style: TextStyle(color: Colors.black),
                //                         ),
                //                         value: value,
                //                       )
                //                       ).toList(),
                //               onChanged: (selectedCategoryType) async {
                //                 print('$selectedCategoryType');
                //                 selectedType=selectedCategoryType;
                //                 DataController dd = DataController();
                //                   await dd.filterData2(selectedCategoryType).then((value)  {
                //                                setState(() {
                                                
                //                                  snapshotData = value;
                //                                  //snapshotData.docs.length != 0 ? filter2 = true: filter2 = false;
                //                                   productss.clear();
                //                               print('snap is : ${snapshotData.docs.length}');
                //                             print('value is : ${value.docs[0].data()}');
                //         for (var doc in snapshotData.docs) {

                //         //var data=doc.data();
                //         productss.add(product(
                //             pId: doc.id,
                //             pTitle: doc.data()[KProductTitle],
                //             pDescription: doc.data()[KProductDescription],
                //             pPrice: doc.data()[KProductPrice],
                //             pContact_phone: doc.data()[KProductcontact_Phone],
                //             pImage: doc.data()[KProductImage]
                //             ));
                //             print('loop data : ${productss[0].pTitle}');
                // }
                                  
                //                 });
                //                 });                               
                //               },//onchanged
                //               value: selectedType,
                //               isExpanded: false,
                //               hint: Text(
                //                 'Choose Category Value',
                //                 style: TextStyle(color: Colors.black),
                //               ),
                //             ),
                     ],
                   ),
                 ),

    
                filter ?  Flexible(
                  flex: 5,
                  // childern<Widget>[   ResultDropDown(productsss: productss,)): Flexible(flex:5 ,child: ProductList()),
                   child:   ResultDropDown(productsss: productss,)): Flexible(flex:5 ,child: ProductList()),
                  //  filter2 ? Flexible(
                  // flex: 5,
                  // // childern<Widget>[   ResultDropDown(productsss: productss,)): Flexible(flex:5 ,child: ProductList()),
                  //  child:   ResultDropDown(productsss: productss,)),
            
                 

          
   
     
         ]
         ),
        floatingActionButton:  FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => addmyproducts()));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        backgroundColor: KMainColor,
      )
         );
            
     
   
  }
  @override
     initState() {
      super.initState();
       init();
    }

     void init() async{
      prefs = await SharedPreferences.getInstance();
     _rating = prefs.getDouble('_rating') ?? 0.0 ;
     setState(() {
            _rating = _rating;
          });

    }

        SharedPreferences prefs;
        void rate(value) {
          setState(() {
          _rating =value;                                                                                                            
         });
         prefs.setDouble('_rating', _rating);
        }

}

