import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/models/Jobs.dart';
import 'package:gp_project/routes/Editmyproducts.dart';
import 'package:gp_project/routes/Home.dart';
import 'package:gp_project/models/product.dart';
import 'package:gp_project/routes/addmyproducts.dart';
import 'package:gp_project/routes/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp_project/routes/Products_screen.dart' as pro;
import 'package:gp_project/routes/Services_screen.dart' as serv;
import 'package:gp_project/routes/Jobs_screen.dart' as jo;
import 'package:gp_project/routes/product_details.dart' as de;
import 'package:gp_project/services/store.dart';

import 'Editmyjob.dart';
import 'addmyjobs.dart';


class MyJobByID extends StatelessWidget {
  static String id = 'MyJobByID';
  final store _store = store();
  final _auth = FirebaseAuth.instance;
  //final FirebaseAuth auth = FirebaseAuth.instance;
  @override
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
      //resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: mainBgColor,
      appBar: AppBar(
          elevation: 0,
          title: Text('My Jobs',
              style: TextStyle(
                fontSize: 25,
              )),
          backgroundColor: KMainColor),
          body: StreamBuilder<QuerySnapshot>(
          stream: _store.loadjobs(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text('My jobs list is empty'),
              );
            } else {
     List<job> MyJobsByID = [];
    //if(_auth.currentUser.uid==KProductUserID){
    for(var doc in snapshot.data.docs){
      var data=doc.data();
     // print('ffggg $KProductUserID');
     // print('fffffff ${data['UserID']}');
      if(_auth.currentUser.uid==data['UserID']){  
      MyJobsByID.add(job(
        jTitle: data[KJobTitle],
        jDescription: data[KJobDescription],
        jContact_Email: data[KJobcontact_Email],
        jContact_phone: data[KJobcontact_Phone],
        jImage:data[KJobImage],
      )
      );
    }
    }  

             /* List<product> products = [];
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
              */
              return ListView.builder(
                itemCount: MyJobsByID.length,
                itemBuilder: (context, index) => SingleChildScrollView(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, de.productdetails.id,
                          arguments: MyJobsByID[index]);
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
                  height: 7.0,
                 ),
                SingleChildScrollView(
                 scrollDirection: Axis.vertical,
                 child: Padding(
                 padding: EdgeInsets.all(15),
                 child: Column(
                 mainAxisAlignment: MainAxisAlignment.start, 
                 children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 14.0, horizontal: 18.0),
                                    margin: EdgeInsets.only(
                                      bottom: 20.0,
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
                                       backgroundImage: NetworkImage('${MyJobsByID[index].jImage}'),
                                              radius: 36.0,
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
                                                            '${MyJobsByID[index].jTitle}',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            '\n ${MyJobsByID[index].jDescription}',
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
                                                      Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment.spaceBetween,
                                                            children: <Widget>[
                                                              SizedBox(
                                                                height: 6.0,
                                                                width: 5.0
                                                              ),
                                                              RaisedButton(
                                                                onPressed: () {
                                                                  Navigator.pushNamed(context,Editmyjob.id,arguments: MyJobsByID[index]);
                                                                },
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                    BorderRadius.circular(80.0)),
                                                                padding: const EdgeInsets.all(0.0),
                                                                child: Ink(
                                                                  decoration: const BoxDecoration(
                                                                    gradient: purpleGradient,
                                                                    borderRadius: BorderRadius.all(
                                                                        Radius.circular(80.0)),
                                                                  ),
                                                                  child: Container(
                                                                    constraints: const BoxConstraints(
                                                                        minWidth: 88.0,
                                                                        minHeight:
                                                                        36.0), // min sizes for Material buttons
                                                                    alignment: Alignment.center,
                                                                    child: const Text(
                                                                      'Edit',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight.w300,
                                                                          fontSize: 13,
                                                                          color: Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                      // testing...................
                                                            /*  SizedBox(
                                                                height: 6.0,
                                                              ),
                                                              RaisedButton(
                                                                onPressed: () {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(

                                                                      )
                                                                  );
                                                                },
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                    BorderRadius.circular(80.0)),
                                                                padding: const EdgeInsets.all(0.0),
                                                                child: Ink(
                                                                  decoration: const BoxDecoration(
                                                                    gradient: purpleGradient,
                                                                    borderRadius: BorderRadius.all(
                                                                        Radius.circular(80.0)),
                                                                  ),
                                                                  child: Container(
                                                                    constraints: const BoxConstraints(
                                                                        minWidth: 88.0,
                                                                        minHeight:
                                                                        36.0), // min sizes for Material buttons
                                                                    alignment: Alignment.center,
                                                                    child: const Text(
                                                                      'Post',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight.w300,
                                                                          fontSize: 13,
                                                                          color: Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              //.................................................
,                                                            */
                                                              SizedBox(
                                                                height: 6.0,
                                                                  width: 5.0                                                              ),
                                                              RaisedButton(
                                                                onPressed: () {
                                                                  Scaffold.of(context)
                                                                      .showSnackBar(SnackBar(backgroundColor: KMainColor,
                                                                    content: Text(
                                                                        'Sure you want to delete this job?!'),
                                                                    action: SnackBarAction(
                                                                      label: 'Delete',
                                                                      textColor: Colors.white,
                                                                      onPressed: () {
                                                                        _store.deletejob(
                                                                            MyJobsByID[index].jId);
                                                                        // Some code to undo the change.
                                                                      },
                                                                    ),
                                                                  ));
                                                                },
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                    BorderRadius.circular(80.0)),
                                                                padding: const EdgeInsets.all(0.0),
                                                                child: Ink(
                                                                  decoration: const BoxDecoration(
                                                                    gradient: purpleGradient,
                                                                    borderRadius: BorderRadius.all(
                                                                        Radius.circular(80.0)),
                                                                  ),
                                                                  child: Container(
                                                                    constraints: const BoxConstraints(
                                                                        minWidth: 88.0,
                                                                        minHeight:
                                                                        36.0), // min sizes for Material buttons
                                                                    alignment: Alignment.center,
                                                                    child: const Text(
                                                                      'Delete',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight.w300,
                                                                          fontSize: 13,
                                                                          color: Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ]),
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
                                        ]
                                    )
                                )
                            )
                          ]
                      )
                  )
              ),);
            }
            ;
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => addmyjobs()));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        backgroundColor: KMainColor,
      ),
    );
  }
}