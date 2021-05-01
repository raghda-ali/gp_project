import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp_project/routes/login_screen.dart';
<<<<<<< Updated upstream
import 'package:gp_project/routes/Products_screen.dart' as pro;
import 'package:gp_project/routes/Services_screen.dart' as serv;
import 'package:gp_project/routes/Jobs_screen.dart' as jo;
=======
import 'package:gp_project/routes/myproducts_screen.dart' as pro;
import 'package:gp_project/routes/profile.dart' ;
import 'package:gp_project/routes/myservices_screen.dart' as serv;
import 'package:gp_project/routes/myjobs_screen.dart' as jo;
>>>>>>> Stashed changes
import 'package:firebase_auth/firebase_auth.dart';
import '../constance.dart';
import 'package:gp_project/routes/profile.dart';
final _auth=FirebaseAuth.instance;
class Home extends StatefulWidget{
          // int _currentIndex = 0,
          static String id='Home';
          
          User loggedinuser = FirebaseAuth.instance.currentUser;
          //FirebaseUser loggedinuser;

          
          void getcurrentUser() async
          {
            try{
              final user=await _auth.currentUser;
            if(user != null){
              loggedinuser=user;
              print(loggedinuser.email);
            }
            }catch(e){print(e); }
            
          }
  @override
  _HomeState createState() =>_HomeState();
   // getcurrentUser();

} 
class _HomeState extends State<Home>{
  Widget build(BuildContext context){
        var _currentIndex = 0;
        double _volume = 0.0;
                return MaterialApp(
                  home :Scaffold(
                    backgroundColor: KMainColor,
                  appBar: AppBar(
                    elevation: 0,
                    title:Text('Home',
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
                            onTap: ()
                            {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, profile.id);
                              //Navigator.push(context, new MaterialPageRoute(builder: (context)=>new profile()));
                              //Navigator.pushNamed(context,profile.id,arguments: _auth.currentUser.uid);
                            },
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
                            leading: Icon(Icons.work),
                            title: Text('My Jobs'),
                            onTap: ()
                            {
                              Navigator.pop(context);
                              Navigator.push(context, new MaterialPageRoute(builder: (context)=>new jo.MyJobs()));
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
                   // backgroundColor: Colors.red[200],
                    body: Column (
                      children:[ Container(
                        height: 200,
                        
                        child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                          ),
                            Card( 
                           color : Colors.white, 
                           elevation: 0,
                           margin: EdgeInsets.all(0.0),
                           
                          // margin: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(15.0),
                           ),
                           child :Container(
                             width: 160,
                             height: 160,
                             child: Column(
                             mainAxisSize: MainAxisSize.min,
                             children: <Widget>[
                          SizedBox(
                             height:50,
                             width:50,
                                 ),
                           Icon(Icons.group,
                                 color: Colors.teal,
                                 size: 30,),
                           Text('Users',
                                 style: TextStyle(
                                   fontSize: 20.0,
                                   color: Colors.teal.shade900
                                 ),
                                 ),
                             ]
                            )
                             )
                           ),
                         Card( 
                           color : Colors.white, 
                           elevation: 0,
                           margin: EdgeInsets.all(7.0),
                         // margin: EdgeInsets.symmetric(horizontal: 0,vertical: 20),
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(15.0),
                           ),
                           child :Container(
                             width: 160,
                             height: 160,
                             child: Column(
                               mainAxisSize: MainAxisSize.min,
                             children: <Widget>[
                           SizedBox(
                             height:50,
                             width:50,
                                  ),
                           Icon(Icons.assistant,
                                 color: Colors.teal,
                                 size: 30.0,),
                           Text('Services sections',
                                 style: TextStyle(
                                   fontSize: 20.0,
                                   color: Colors.teal.shade900
                                 ),
                                 ),
                             ]
                           )
                           )
                           ),
            
                        ]
                      ),
                    ),
            
                    Container(
                      height: 200,

                        child: Row(
                        children: <Widget>[
              
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                          ),
                            Card( 
                           color : Colors.white, 
                           elevation: 0,
                           margin: EdgeInsets.all(0.0),
                           //margin: EdgeInsets.all(20.0),
                           //margin: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(15.0),
                           ),
                           child :Container(
                             width: 160,
                             height: 160,
                             child: Column(
                               mainAxisSize: MainAxisSize.min,
                             children: <Widget>[
                           SizedBox(
                             height:50,
                             width:50,
                                  ),
                           Icon(Icons.work,
                                 color: Colors.teal,
                                 size: 30,),
                           Text('Jobs',
                                 style: TextStyle(
                                   fontSize: 20.0,
                                   color: Colors.teal.shade900
                                 ),
                                 ),
                             ]
                               )
                               )
                           ),
                            Card( 
                              color : Colors.white, 
                           elevation: 0,
                           margin: EdgeInsets.all(7.0),
                          // color : Colors.white, 
                          // margin: EdgeInsets.all(4),
                         // margin: EdgeInsets.symmetric(horizontal: 0,vertical: 20),
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(15.0),
                           ),
                           child :Container(
                             width: 160,
                             height: 160,
                             child: Column(
                               mainAxisSize: MainAxisSize.min,
                             children: <Widget>[
                           SizedBox(
                             height:50,
                             width:50,
                                  ),
                           Icon(Icons.shopping_cart_sharp,
                                 color: Colors.teal,
                                 size: 30,),
                           Text('Products',
                                 style: TextStyle(
                                   fontSize: 20.0,
                                   color: Colors.teal.shade900
                                 ),
                                 ),
                             ]
                           )
                           )
                           ),
                        ]
                    )
                    ),
            ]
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    currentIndex: _currentIndex = 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: KMainColor,
            iconSize: 30,
            items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                ),
                 BottomNavigationBarItem(
                  icon: Icon(Icons.medical_services_outlined),
                  title: Text('Services'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  title: Text('Products'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.work),
                  title: Text('Jobs'),
                ),
                 /*BottomNavigationBarItem(
                  icon: Icon(Icons.local_offer),
                  title: Text('Offer'),
                ),
                 BottomNavigationBarItem(
                  icon: Icon(Icons.forum),
                  title: Text('Personal Experience'),
                )*/
            ],
            onTap: (index){
              setState((){
                _currentIndex = index;
              });
            },
          ),
    )
    );
    
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}