import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/routes/Home.dart';
import 'package:gp_project/routes/addmyproducts.dart';
import 'package:gp_project/routes/login_screen.dart';
import 'package:gp_project/routes/signup_screen.dart' ;
import 'package:gp_project/widgets/Custom_TextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp_project/routes/myproducts_screen.dart' as pro;
import 'package:gp_project/routes/myservices_screen.dart' as serv;


class MyProducts extends StatelessWidget {
  static String id='MyProducts';
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

            body: Container(
         //height: MediaQuery.of(context).size.height*.4,
             child: Center(
               child: Stack(
               //  alignment: Alignment.center,
               children: <Widget>[
             /*  Icon(Icons.add,
                 color: Colors.blue[700],
                   size: 210,
               ),*/
                 Positioned(
                  // bottom: 0,

                 child: Text('My Products list is Empty',
                     style: TextStyle(
                     fontSize: 30,
                      color: Colors.blueGrey)
               ),
                 )
                 ],
                 ),
             )
             
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