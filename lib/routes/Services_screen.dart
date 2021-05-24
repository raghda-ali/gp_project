import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
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
import 'package:gp_project/routes/resultDropDownServices.dart';
import 'package:gp_project/routes/service_details.dart' as sd;
import 'package:gp_project/routes/serviceslist.dart';
import 'package:gp_project/services/DataController.dart';
import 'package:gp_project/services/store.dart';

import 'HomePageAfterLogin.dart';
import 'Rating.dart';
import 'ServicesSearch.dart';

class myservices extends StatefulWidget {
  static String id = 'Myservices';

  @override
  _myservicesState createState() => _myservicesState();
}

class _myservicesState extends State<myservices> {
  final _auth = FirebaseAuth.instance;

  final store _store = store();

  int _rating;
  List<String> _accountType = <String>[
   'special needs',
    'Rehabilitation center',
    'General',
  ];
  bool filter = false;
  QuerySnapshot snapshotData;
  var  selectedType;
  List<service> servicess = [];
  

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
      resizeToAvoidBottomPadding: false,
      backgroundColor: mainBgColor,
      appBar: AppBar(
          elevation: 0,
          title: Text('Services',
              style: TextStyle(
                fontSize: 25,
              )),
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                iconSize: 30,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new ServicesSearch()));
                })
          ],
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
                  //  '${_auth.currentUser.displayName}',
                     'User Name',
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
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new MyHomePageAfterLogin()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
               onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new profile()));
              },
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
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new MyJobByID()));
              },
            ),
            /* ListTile(
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
      body:Column(
         children :<Widget>[
     
                 Flexible(
                   flex: 1,
                   child: Row(
                     children: <Widget>[
                       DropdownButton(
                              items: _accountType.map((value) => DropdownMenuItem(
                                        child: Text(value.toString(),
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        value: value,
                                      )
                                      ).toList(),
                              onChanged: (selectedCategoryType) async {
                                print('$selectedCategoryType');
                                selectedType = selectedCategoryType;
                                DataController dd = DataController();
                                  await dd.filterServiceData(selectedCategoryType).then((value)  {
                                               setState(() {
                                                
                                                 snapshotData = value;
                                                 snapshotData.docs.length != 0 ? filter = true: filter = false;
                                                  servicess.clear();
                                              print('snap is : ${snapshotData.docs.length}');
                                            print('value is : ${value.docs[0].data()}');
                        for (var doc in snapshotData.docs) {

                        //var data=doc.data();
                        servicess.add(service(
                           servId: doc.id,
                    servtitle: doc.data()[KServiceTitle],
                    servcategory: doc.data()[KServiceCategory],
                    servdescription: doc.data()[KServiceDescription],
                    servcontact_email: doc.data()[KServicecontact_Email],
                    servcontact_phone: doc.data()[KServicecontact_Phone],
                    servImage: doc.data()[KServiceImage]));
                    print('loop data : ${servicess[0].servtitle}');
                }
                                  
                                });
                                              

                                              });
                               


                               
                              },//onchanged
                              value: selectedType,
                              isExpanded: false,
                              hint: Text(
                                'Choose Category Type',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                     ],
                   ),
                 ),

    
                filter ?  Flexible(
                  flex: 5,
                   child:   ResultDropDownServices(servicesss: servicess,)): Flexible(flex:5 ,child: serviceslist()),
            // Flexible(child: ResultDropDown(productsss:productss,))
                   
                 //),
                 

          
   
     
         ]
         ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => addmyservice()));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        backgroundColor: KMainColor,
      ),
    );
  }
}
