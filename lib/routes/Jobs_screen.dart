
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/models/services.dart';
import 'package:gp_project/routes/Home.dart';
import 'package:gp_project/models/Jobs.dart';
import 'package:gp_project/routes/HomePage.dart';
import 'package:gp_project/routes/MyProductsByID.dart';
import 'package:gp_project/routes/MyServicesByID.dart';
import 'package:gp_project/routes/addmyjobs.dart';
import 'package:gp_project/routes/Editmyjob.dart';
import 'package:gp_project/routes/login_screen.dart';
import 'package:gp_project/routes/signup_screen.dart';
import 'package:gp_project/widgets/Custom_TextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp_project/routes/Products_screen.dart' as pro;
import 'package:gp_project/routes/Services_screen.dart' as serv;
import 'package:gp_project/routes/Jobs_screen.dart' ;
import 'package:gp_project/routes/job_details.dart'as jo;
import 'package:gp_project/services/store.dart' ;

import 'HomePageAfterLogin.dart';
import 'JobSearch.dart';
import 'MyJobByID.dart';
import 'chating.dart';



class MyJobs extends StatelessWidget {
  static String id = 'MyJobs';
  final store _store = store();
  final _auth = FirebaseAuth.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  
  @override
  Widget build(BuildContext context) {
    var idd = auth.currentUser.uid;
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
          title: Text('Jobs',
              style: TextStyle(
                fontSize: 25,
              )),
              actions: [IconButton(icon: Icon(Icons.search),iconSize:30, onPressed:(){
             Navigator.pop(context);
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new JobSearch()));
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
                   //'UserName',
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
           /* ListTile(
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
                        builder: (context) => new MyProductsByID()));
              },
            ),
            ListTile(
                            leading: Icon(Icons.work),
                            title: Text('My Jobs'),
                            onTap: ()
                            {
                              Navigator.pop(context);
                              Navigator.push(context, new MaterialPageRoute(builder: (context)=>new MyJobByID()));
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.chat),
                            title: Text('Chating'),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => new chating()));
                            },
                          ),
            /*ListTile(
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
            ),*/
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
      body: StreamBuilder<QuerySnapshot>(
          stream: _store.loadjobs(),
          builder: (context, Snapshot) {
            if (!Snapshot.hasData) {
              return Center(
                child: Text('My Jobs is empty'),
              );
            } else {
              List<job> jobs = [];
              for (var doc in Snapshot.data.docs) {
                //var data=doc.data();
                jobs.add(job(
                    jId: doc.id,
                    jTitle: doc.data()[KJobTitle],
                    jDescription: doc.data()[KJobDescription],
                    jContact_Email: doc.data()[KJobcontact_Email],
                    jContact_phone: doc.data()[KJobcontact_Phone],
                    jImage: doc.data()[KJobImage]

                    ));

              }
              return ListView.builder(
                  itemCount: jobs.length,
                  itemBuilder: (context, index) => SingleChildScrollView(
                  child: GestureDetector(

                      onTap: () {
                        Navigator.pushNamed(context,jo.jobdetails.id,arguments: jobs[index]);
                      },
                      child:Column(
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
                                            padding:
                                            EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
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
                                                      backgroundColor: Color(0xFFD9D9D9),
                                                       backgroundImage: NetworkImage('${jobs[index].jImage}'),
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
                                                                text: '${jobs[index].jTitle}',
                                                                style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.w600,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                '\n ${jobs[index].jDescription}',
                                                                style: TextStyle(
                                                                  color: Colors.black38,
                                                                  fontWeight: FontWeight.w400,
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
                                                                  //Navigator.pushNamed(context,Editmyjob.id,arguments: jobs[index]);
                 FirebaseFirestore.instance.collection(kNotificationCollection).document('aHQ5kWyLlPsFZOi8gqi2').updateData({'UsersID' : FieldValue.arrayUnion([idd],)});
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
                                                                      'Submit',
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
                                                              // SizedBox(
                                                              //   height: 6.0,
                                                              //     width: 5.0                                                              ),
                                                              // RaisedButton(
                                                              //   onPressed: () {
                                                              //     Scaffold.of(context)
                                                              //         .showSnackBar(SnackBar(backgroundColor: KMainColor,
                                                              //       content: Text(
                                                              //           'Sure you want to delete this job?!'),
                                                              //       action: SnackBarAction(
                                                              //         label: 'Delete',
                                                              //         textColor: Colors.white,
                                                              //         onPressed: () {
                                                              //           _store.deletejob(
                                                              //               jobs[index].jId);
                                                              //           // Some code to undo the change.
                                                              //         },
                                                              //       ),
                                                              //     ));
                                                              //   },
                                                              //   shape: RoundedRectangleBorder(
                                                              //       borderRadius:
                                                              //       BorderRadius.circular(80.0)),
                                                              //   padding: const EdgeInsets.all(0.0),
                                                              //   child: Ink(
                                                              //     decoration: const BoxDecoration(
                                                              //       gradient: purpleGradient,
                                                              //       borderRadius: BorderRadius.all(
                                                              //           Radius.circular(80.0)),
                                                              //     ),
                                                              //     child: Container(
                                                              //       constraints: const BoxConstraints(
                                                              //           minWidth: 88.0,
                                                              //           minHeight:
                                                              //           36.0), // min sizes for Material buttons
                                                              //       alignment: Alignment.center,
                                                              //       child: const Text(
                                                              //         'Delete',
                                                              //         style: TextStyle(
                                                              //             fontWeight: FontWeight.w300,
                                                              //             fontSize: 13,
                                                              //             color: Colors.white),
                                                              //       ),
                                                              //     ),
                                                              //   ),
                                                              // ),
                                                            ]),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                             //   Icon(
                                               //   Icons.favorite,
                                                 // color: lightColor,
                                                 // size: 36,
                                                //),
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




//   Row(
//                                                             mainAxisAlignment:
//                                                             MainAxisAlignment.spaceBetween,
//                                                             children: <Widget>[
//                                                               SizedBox(
//                                                                 height: 6.0,
//                                                                 width: 5.0
//                                                               ),
//                                                               RaisedButton(
//                                                                 onPressed: () {
//                                                                   Navigator.pushNamed(context,Editmyjob.id,arguments: jobs[index]);
//                                                                 },
//                                                                 shape: RoundedRectangleBorder(
//                                                                     borderRadius:
//                                                                     BorderRadius.circular(80.0)),
//                                                                 padding: const EdgeInsets.all(0.0),
//                                                                 child: Ink(
//                                                                   decoration: const BoxDecoration(
//                                                                     gradient: purpleGradient,
//                                                                     borderRadius: BorderRadius.all(
//                                                                         Radius.circular(80.0)),
//                                                                   ),
//                                                                   child: Container(
//                                                                     constraints: const BoxConstraints(
//                                                                         minWidth: 88.0,
//                                                                         minHeight:
//                                                                         36.0), // min sizes for Material buttons
//                                                                     alignment: Alignment.center,
//                                                                     child: const Text(
//                                                                       'Edit',
//                                                                       style: TextStyle(
//                                                                           fontWeight: FontWeight.w300,
//                                                                           fontSize: 13,
//                                                                           color: Colors.white),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               ),

//                                                       // testing...................
//                                                             /*  SizedBox(
//                                                                 height: 6.0,
//                                                               ),
//                                                               RaisedButton(
//                                                                 onPressed: () {
//                                                                   Navigator.push(
//                                                                       context,
//                                                                       MaterialPageRoute(

//                                                                       )
//                                                                   );
//                                                                 },
//                                                                 shape: RoundedRectangleBorder(
//                                                                     borderRadius:
//                                                                     BorderRadius.circular(80.0)),
//                                                                 padding: const EdgeInsets.all(0.0),
//                                                                 child: Ink(
//                                                                   decoration: const BoxDecoration(
//                                                                     gradient: purpleGradient,
//                                                                     borderRadius: BorderRadius.all(
//                                                                         Radius.circular(80.0)),
//                                                                   ),
//                                                                   child: Container(
//                                                                     constraints: const BoxConstraints(
//                                                                         minWidth: 88.0,
//                                                                         minHeight:
//                                                                         36.0), // min sizes for Material buttons
//                                                                     alignment: Alignment.center,
//                                                                     child: const Text(
//                                                                       'Post',
//                                                                       style: TextStyle(
//                                                                           fontWeight: FontWeight.w300,
//                                                                           fontSize: 13,
//                                                                           color: Colors.white),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                               //.................................................
// ,                                                            */
//                                                               // SizedBox(
//                                                               //   height: 6.0,
//                                                               //     width: 5.0                                                              ),
//                                                               // RaisedButton(
//                                                               //   onPressed: () {
//                                                               //     Scaffold.of(context)
//                                                               //         .showSnackBar(SnackBar(backgroundColor: KMainColor,
//                                                               //       content: Text(
//                                                               //           'Sure you want to delete this job?!'),
//                                                               //       action: SnackBarAction(
//                                                               //         label: 'Delete',
//                                                               //         textColor: Colors.white,
//                                                               //         onPressed: () {
//                                                               //           _store.deletejob(
//                                                               //               jobs[index].jId);
//                                                               //           // Some code to undo the change.
//                                                               //         },
//                                                               //       ),
//                                                               //     ));
//                                                               //   },
//                                                               //   shape: RoundedRectangleBorder(
//                                                               //       borderRadius:
//                                                               //       BorderRadius.circular(80.0)),
//                                                               //   padding: const EdgeInsets.all(0.0),
//                                                               //   child: Ink(
//                                                               //     decoration: const BoxDecoration(
//                                                               //       gradient: purpleGradient,
//                                                               //       borderRadius: BorderRadius.all(
//                                                               //           Radius.circular(80.0)),
//                                                               //     ),
//                                                               //     child: Container(
//                                                               //       constraints: const BoxConstraints(
//                                                               //           minWidth: 88.0,
//                                                               //           minHeight:
//                                                               //           36.0), // min sizes for Material buttons
//                                                               //       alignment: Alignment.center,
//                                                               //       child: const Text(
//                                                               //         'Delete',
//                                                               //         style: TextStyle(
//                                                               //             fontWeight: FontWeight.w300,
//                                                               //             fontSize: 13,
//                                                               //             color: Colors.white),
//                                                               //       ),
//                                                               //     ),
//                                                               //   ),
//                                                               // ),
//                                                             ]),