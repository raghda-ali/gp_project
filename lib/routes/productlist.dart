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
import 'package:gp_project/services/store.dart';
import 'MyJobByID.dart';
import 'MyServicesByID.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Rating.dart'; 

//import 'dart:html';

class ProductList extends StatefulWidget {
  static String id = 'ProductList';

  @override
  _ProductListState createState() => _ProductListState();
}


class _ProductListState extends State<ProductList> {
    final _auth = FirebaseAuth.instance;

    final store _store = store();
   // double rating = 4.0;
     double _rating;
     double _rate;

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
      // appBar: AppBar(
      //     elevation: 0,
      //     title: Text('Products',
      //         style: TextStyle(
      //           fontSize: 25,
      //         )),
      //     actions: [IconButton(icon: Icon(Icons.search),iconSize:30, onPressed:(){
      //        Navigator.pop(context);
      //           Navigator.push(
      //               context,
      //               new MaterialPageRoute(
      //                   builder: (context) => new Search()));
      //     })],
      //     backgroundColor: KMainColor),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //           decoration: BoxDecoration(color: KMainColor),
      //           child: Column(children: <Widget>[
      //             Icon(
      //               Icons.account_circle,
      //               size: 100,
      //               color: Colors.white,
      //             ),
      //             Text(
      //              // '${_auth.currentUser.email}',
      //               'User Name',
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 24,
      //               ),
      //             ),
      //           ])),
      //       ListTile(
      //         leading: Icon(Icons.home),
      //         title: Text('Home page'),
      //         onTap: () {
      //           Navigator.pop(context);
      //           Navigator.push(context,
      //               new MaterialPageRoute(builder: (context) => new MyHomePage()));
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.person),
      //         title: Text('Profile'),
      //       ),
      //       /*ListTile(
      //         leading: Icon(Icons.attach_money_outlined),
      //         title: Text('My Donation'),
      //       ),*/
      //       ListTile(
      //         leading: Icon(Icons.support),
      //         title: Text('My Services'),
      //         onTap: () {
      //           Navigator.pop(context);
      //           Navigator.push(
      //               context,
      //               new MaterialPageRoute(
      //                   builder: (context) => new MyServicesByID()));
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.shopping_cart),
      //         title: Text('My Product'),
      //         onTap: () {
      //           Navigator.pop(context);
      //           Navigator.push(
      //               context,
      //               new MaterialPageRoute(
      //                   builder: (context) => new pro.MyProductsByID()));
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.work),
      //         title: Text('My Jobs'),
      //         onTap: () {
      //           Navigator.pop(context);
      //           Navigator.push(
      //               context,
      //               new MaterialPageRoute(
      //                   builder: (context) => new MyJobByID()));
      //         },
      //       ),
      //       /*ListTile(
      //         leading: Icon(Icons.local_offer_sharp),
      //         title: Text('Offers'),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.chat_bubble),
      //         title: Text('My Personal Experience'),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.chat),
      //         title: Text('Chating'),
      //       ),*/
      //       ListTile(
      //         leading: Icon(Icons.exit_to_app),
      //         title: Text('Log out'),
      //         onTap: () {
      //           _auth.signOut();
      //           Navigator.pushNamed(context, LoginScreen.id);
      //         },
      //       )
      //     ],
      //   ),
      // ),
      body: 
       StreamBuilder<QuerySnapshot>(
          stream: _store.loadproducts(),
          builder: (context, Snapshot) {
            if (!Snapshot.hasData) {
              return Center(
                child: Text('My products list is empty'),
              );
            } else {
              List<product> products = [];
              for (var doc in Snapshot.data.docs) {
                //var data=doc.data();
                products.add(product(
                    pId: doc.id,
                    pTitle: doc.data()[KProductTitle],
                    pDescription: doc.data()[KProductDescription],
                    pPrice: doc.data()[KProductPrice],
                    pContact_phone: doc.data()[KProductcontact_Phone],
                    pImage: doc.data()[KProductImage]
                    ));
              }
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) => SingleChildScrollView(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, de.productdetails.id,
                          arguments: products[index]);
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Stack(
                          alignment: AlignmentDirectional.topCenter,
                          overflow: Overflow.visible,
                          children: <Widget>[
                          _backBgCover(),
                              // _greetings(),
                              // _moodsHolder(),
                          ],
                          ),
                  SizedBox(
                 // height: 5.0,
                 ),
                  SingleChildScrollView(
                 scrollDirection: Axis.vertical,
                   child: Padding(
                     padding: EdgeInsets.all(12),
                     child: Column(
                     mainAxisAlignment: MainAxisAlignment.start, 
                     children: <Widget>[
                                      Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7.0, horizontal: 20.0),
                                          margin: EdgeInsets.only(
                                            bottom: 0,
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.2),
                                                  spreadRadius: 1.0,
                                                  blurRadius: 6.0,
                                                ),
                                              ]),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        Color(0xFFD9D9D9),
                                                   backgroundImage: NetworkImage('${products[index].pImage}'),
                                                    radius: 40.0,
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),

                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      RichText(
                                                        text: TextSpan(
                                                          text: 'In Cairo\n',
                                                          style: TextStyle(
                                                            color: Colors.purple,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 1.3,
                                                          ),
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                              text:
                                                                  '${products[index].pTitle}',
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight.w600,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  '\n ${products[index].pDescription}',
                                                              style: TextStyle(
                                                                color: Colors.black38,
                                                                fontWeight:
                                                                    FontWeight.w400,
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                        
                                                            TextSpan(
                                                              text:
                                                                  '\n ${products[index].pPrice} EGP',
                                                              style: TextStyle(
                                                                color: Colors.black38,
                                                                fontWeight:
                                                                    FontWeight.w400,
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      RatingBar(
                                                        initialRating: 0,
                                                        direction: Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 5,
                                                        itemSize: 22,
                                                        ratingWidget: RatingWidget(
                                                          full: Icon(Icons.star, color: Colors.orange),
                                                          half: Icon(
                                                            Icons.star_half,
                                                            color: Colors.orange,
                                                          ),
                                                          empty: Icon(
                                                            Icons.star_outline,
                                                            color: Colors.orange,
                                                          )
                                                        ),
                                                
                                                        onRatingUpdate: (value) async{
                                                          rate(value);
                                                        /*  _rating = prefs.getDouble('_rating') ?? 0 + 1;
                                                          prefs.setDouble('_rating', _rating);
                                                         setState(() {
                                                            _rating =value;
                                                                                                                      
                                                    });*/
                                                        }
                                                        
                                                        ),

                                                  
                                        
                                       
                                                          ],
                                                          ),
                                                          
                                                           
                                                  
                                                  ],
                                                     ),
                                                    SizedBox(width: 20,),
                                                  /*  SmoothStarRating(
                                                        rating: rating,
                                                        size: 45,
                                                        filledIconData: Icons.star,
                                                        halfFilledIconData: Icons.star_half,
                                                        defaultIconData: Icons.star_border,
                                                        starCount: 5,
                                                        spacing: 2.0,
                                                        onRated: (value){
                                                          setState(() {
                                                            rating =value;
                                                          });
                                                        
                                                },
                                                  ),
                                                  Text("you have selected : $rating Star",
                                                  style: TextStyle(fontSize: 15),),*/
                                                    /* Padding(
                                         padding: const EdgeInsets.fromLTRB(10, 40, 5, 5),
                                         child: Column(
                                                         children: [
                                                           Rating((rating){
                                                             setState(() {
                                                               _rating = rating;
                                                               });
                                                           },
                                                           5),
                                                           SizedBox(height: 10,
                                                           child:(_rating!=null&&_rating!=0)?
                                                           Text("you selected $_rating rating",
                                                           style: TextStyle(fontSize: 10))
                                                           :SizedBox.shrink())
                                                         ],
                                                       ),
                                       )*/
                                                ],
                                              ),
                                              
                                               ),
                                            
                                          ],
                                        )
                                     ),
                 
                 ),
                                 
                               ]
                            ),
                          ),
                        ),
                  );
                
              
            }
          }),
     
     
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
         // prefs= await SharedPreferences.getInstance();
        //  _rating = prefs.getDouble('_rating') ?? 0 ;
         // prefs.setDouble('_rating', _rating);
          setState(() {
          _rating =value;                                                                                                            
         });
         prefs.setDouble('_rating', _rating);
        }

}