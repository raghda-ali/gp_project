import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/routes/Editmyproducts.dart';
import 'package:gp_project/routes/Home.dart';
import 'package:gp_project/models/product.dart';
import 'package:gp_project/routes/addmyproducts.dart';
import 'package:gp_project/routes/login_screen.dart';
import 'package:gp_project/routes/signup_screen.dart' ;
import 'package:gp_project/widgets/Custom_TextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp_project/routes/myproducts_screen.dart' as pro;
import 'package:gp_project/routes/myservices_screen.dart' as serv;
import 'package:gp_project/services/store.dart';
//import 'dart:html';

class MyProducts extends StatelessWidget {
  static String id='MyProducts';
  final store _store=store();
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          title:Text('My Products',
              style: TextStyle(
                fontSize: 25,
              )),
          backgroundColor: KMainColor
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                    color: KMainColor
                ),
                child: Column(
                    children : <Widget>[
                      Icon(Icons.account_circle,
                        size: 100,
                        color: Colors.white,),
                      Text(
                        'User Name',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ])),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home page'),
              onTap: ()
              {
                Navigator.pop(context);
                Navigator.push(context, new MaterialPageRoute(builder: (context)=>new Home()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.attach_money_outlined),
              title: Text('My Donation'),
            ),
            ListTile(
              leading: Icon(Icons.support),
              title: Text('My Services'),
              onTap: ()
              {
                Navigator.pop(context);
                Navigator.push(context, new MaterialPageRoute(builder: (context)=>new serv.myservices()));
              },
            ),


            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('My Product'),
              onTap: ()
              {
                Navigator.pop(context);
                Navigator.push(context, new MaterialPageRoute(builder: (context)=>new pro.MyProducts()));
              },
            ),


            ListTile(
              leading: Icon(Icons.local_offer_sharp),
              title: Text('Offers'),
            ),
            ListTile(
              leading: Icon(Icons.chat_bubble),
              title: Text('My Personal Experience'),
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text('Chating'),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Log out'),
              onTap: (){
                _auth.signOut();
                Navigator.pushNamed(context, LoginScreen.id);
              },
            )
          ],
        ),
      ),

      body: StreamBuilder<QuerySnapshot>(
          stream: _store.loadproducts(),
          builder: (context, Snapshot) {
            if(!Snapshot.hasData){
              return Center(
                child: Text('My Products is empty'),
              );
            }else{
              List<product> products =[];
              for(var doc in Snapshot.data.docs){
                //var data=doc.data();
                products.add(product(
                    pTitle:  doc.data()[KProductTitle],
                    pDescription:  doc.data()[KProductDescription],
                       pPrice :doc.data()[KProductPrice],
                    pContact_phone: doc.data()[KProductcontact_Phone]
                )
                );
              }
              return ListView.builder(itemBuilder:
                  (context,index)=> Container(

                padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
                margin: EdgeInsets.only(
                  bottom: 20.0,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1.0,
                        blurRadius: 6.0,
                      ),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor:Color(0xFFD9D9D9),
                         // backgroundImage: NetworkImage('https://hopeacademyegypt.com/wp-content/uploads/2020/05/hope-logo.png'),
                          radius: 36.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                text: 'In Cairo\n',
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '${products[index].pTitle}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  TextSpan(
                                    text: '\n ${products[index].pDescription}',
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(
                                    height: 6.0,
                                  ),
                                  RaisedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context)=>Editmyproducts()));
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(80.0)),
                                    padding: const EdgeInsets.all(0.0),
                                    child: Ink(
                                      decoration: const BoxDecoration(
                                        gradient: purpleGradient,
                                        borderRadius: BorderRadius.all(Radius.circular(80.0)),
                                      ),
                                      child: Container(
                                        constraints: const BoxConstraints(
                                            minWidth: 88.0,
                                            minHeight: 36.0), // min sizes for Material buttons
                                        alignment: Alignment.center,
                                        child:const Text(
                                          'Edit',

                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 13,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6.0,
                                  ),
                                  RaisedButton(
                                    onPressed: () {},
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(80.0)),
                                    padding: const EdgeInsets.all(0.0),
                                    child: Ink(
                                      decoration: const BoxDecoration(
                                        gradient: purpleGradient,
                                        borderRadius: BorderRadius.all(Radius.circular(80.0)),
                                      ),
                                      child: Container(
                                        constraints: const BoxConstraints(
                                            minWidth: 88.0,
                                            minHeight: 36.0), // min sizes for Material buttons
                                        alignment: Alignment.center,
                                        child:const Text(
                                          'Delete',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 13,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                            ),

                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.favorite,
                      color: lightColor,
                      size: 36,
                    ),
                  ],
                ),

              ),
              );

            };
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>addmyproducts()));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        backgroundColor: KMainColor,
      ),
    );
  }
}