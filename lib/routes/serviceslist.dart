import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/models/product.dart';
import 'package:gp_project/models/services.dart';
import 'package:gp_project/routes/HomePage.dart';
import 'package:gp_project/routes/MyJobByID.dart';
import 'package:gp_project/routes/MyProductsByID.dart';
import 'package:gp_project/routes/MyServicesByID.dart';
import 'package:gp_project/routes/addmyservice.dart';
import 'package:gp_project/routes/login_screen.dart';
import 'package:gp_project/routes/login_screen.dart';
import 'package:gp_project/routes/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp_project/routes/Products_screen.dart' as pro;
import 'package:gp_project/routes/Services_screen.dart' as serv;
import 'package:gp_project/routes/Jobs_screen.dart' as jo;
import 'package:gp_project/routes/service_details.dart' as sd;
import 'package:gp_project/services/store.dart';
import 'package:gp_project/models/rate.dart';
import 'HomePageAfterLogin.dart';
import 'Rating.dart';
import 'ServicesSearch.dart';

class serviceslist extends StatefulWidget {
  static String id = 'serviceslist';

  @override
  _serviceslistState createState() => _serviceslistState();
}

class _serviceslistState extends State<serviceslist> {
  final _auth = FirebaseAuth.instance;
  final store _store = store();
  int _rating;
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Container _backBgCover() {
      ////////////////
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
      //resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: mainBgColor,
      // appBar: AppBar(
      //     elevation: 0,
      //     title: Text('Services',
      //         style: TextStyle(
      //           fontSize: 25,
      //         )),
      //     actions: [
      //       IconButton(
      //           icon: Icon(Icons.search),
      //           iconSize: 30,
      //           onPressed: () {
      //             Navigator.pop(context);
      //             Navigator.push(
      //                 context,
      //                 new MaterialPageRoute(
      //                     builder: (context) => new ServicesSearch()));
      //           })
      //     ],
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
      //             //  '${_auth.currentUser.displayName}',
      //                'User Name',
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 16,
      //               ),
      //             ),
      //           ])),
      //       ListTile(
      //         leading: Icon(Icons.home),
      //         title: Text('Home page'),
      //         onTap: () {
      //           Navigator.pop(context);
      //           Navigator.push(
      //               context,
      //               new MaterialPageRoute(
      //                   builder: (context) => new MyHomePageAfterLogin()));
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.person),
      //         title: Text('Profile'),
      //          onTap: () {
      //           Navigator.pop(context);
      //           Navigator.push(
      //               context,
      //               new MaterialPageRoute(
      //                   builder: (context) => new profile()));
      //         },
      //       ),
      //       /* ListTile(
      //                       leading: Icon(Icons.attach_money_outlined),
      //                       title: Text('My Donation'),
      //                     ),*/
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
      //                   builder: (context) => new MyProductsByID()));
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
      //       /* ListTile(
      //                       leading: Icon(Icons.local_offer_sharp),
      //                       title: Text('Offers'),
      //                     ),
      //                     ListTile(
      //                       leading: Icon(Icons.chat_bubble),
      //                       title: Text('My Personal Experience'),
      //                     ),
      //                     ListTile(
      //                       leading: Icon(Icons.chat),
      //                       title: Text('Chating'),
      //                     ),*/
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
      body:  StreamBuilder<QuerySnapshot>(
          stream: _store.loadservices(),
          builder: (context, Snapshot) {
            if (!Snapshot.hasData) {
              return Center(
                child: Text('My services is empty'),
              );
            } else {
              List<service> services = [];
              for (var doc in Snapshot.data.docs) {
                //var data=doc.data();
                services.add(service(
                    servId: doc.id,
                    servtitle: doc.data()[KServiceTitle],
                    servcategory: doc.data()[KServiceCategory],
                    servdescription: doc.data()[KServiceDescription],
                    servcontact_email: doc.data()[KServicecontact_Email],
                    servcontact_phone: doc.data()[KServicecontact_Phone],
                    servImage: doc.data()[KServiceImage]));
              }
              return ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) => SingleChildScrollView(
                  child: GestureDetector(
                    onTap: () {
                       Navigator.pushNamed(context,sd.servicedetails.id,arguments: services[index]);
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
                           // height: 7.0,
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
                                      bottom: 0.0,
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
                                              backgroundImage: NetworkImage(
                                                  '${services[index].servImage}'),
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
                                                            '${services[index].servtitle}',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            '\n ${services[index].servcategory}',
                                                        style: TextStyle(
                                                          color: Colors.black45,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            '\n ${services[index].servdescription}',
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
                                                /*  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                             SizedBox(
                            height: 6.0,
                          ),
                          RaisedButton(
                            onPressed: () {
                             Navigator.pushNamed(context,Editmyservices.id,arguments: services[index]);
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
                             /* SizedBox(
                                height: 6.0,
                                width: 5.0,
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context,Editmyservices.id,arguments: services[index]);
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
                                      'View',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 13,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),*/
                          SizedBox(
                            height: 6.0,
                            width: 7.0,
                          ),
                          RaisedButton(
                            
                              onPressed: () {
                                          Scaffold.of(context)
                                              .showSnackBar(SnackBar(backgroundColor: KMainColor,
                                            content: Text(
                                                'Sure you want to delete this Service?!'),
                                            action: SnackBarAction(
                                              label: 'Delete',
                                              textColor: Colors.white,
                                              onPressed: () {
                                                _store.deleteservice(
                                                    services[index].servId);
                                                // Some code to undo the change.
                                              },
                                            ),
                                          ));
                              //_store.deleteservice(services[index].servId);
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
                          ),*/
                                                         Column(
                                                         children: [
                                                           Rating((rating){
                                                             setState(() {
                                                               _rating = rating;
                                                               /*if(_formkey.currentState.validate()){
                                                                 _formkey.currentState.save();
                                                                 _store.addrate(rates(
                                                                 myrate: _rating,
                                                                 userID: 
                                                                 ),
                                                                 
                                                                  product(
                                                                   pId: 
                                                                  
                                                                   

                                                                 ));
                                                               
                                                               }*/
                                                               });

                                                           },
                                                           5),
                                                           

                                                           

                                                          /*  SizedBox(height: 10,
                                                           child:(_rating!=null&&_rating!=0)?
                                                           Text("you selected $_rating rating",
                                                           style: TextStyle(fontSize: 10),
                                                           textAlign: TextAlign.start,)
                                                           :SizedBox.shrink())*/
                                                         ],
                                                       ),
                                       
                                              ],
                                            ),
                                          ],
                                        ),
                                       SizedBox(width: 20,),
                                        // Icon(
                                        //         Icons.favorite,
                                        //       color: lightColor,
                                        //     size: 36,
                                        //),
                                      ],
                                    ),
                                  ),
                                  //_specialistsCardInfo(),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              );
            }
          }),
    
    );
  }
}