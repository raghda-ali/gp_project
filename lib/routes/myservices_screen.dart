import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/routes/Home.dart';
import 'package:gp_project/routes/addmyservice.dart';
import 'package:gp_project/routes/login_screen.dart';
//import 'package:gp_project/routes/login_screen.dart';
//import 'package:gp_project/routes/signup_screen.dart';
//import 'package:gp_project/widgets/Custom_TextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp_project/routes/myproducts_screen.dart' as pro;
import 'package:gp_project/routes/myservices_screen.dart' as serv;



class myservices extends StatelessWidget {
  static String id='Myservices';
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
       double height = MediaQuery.of(context).size.height;
        return Scaffold(
        backgroundColor: Colors.white,
         appBar: AppBar(
                    elevation: 0,
                    title:Text('My Services',
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
         /*height: MediaQuery.of(context).size.height*.4,
             child: Center(
               child: Stack(
                 alignment: Alignment.center,
               children: <Widget>[
             /*  Icon(Icons.add,
                 color: Colors.blue[700],
                   size: 210,
               ),*/
                 Positioned(
                  // bottom: 0,

                 child: Text('My Services list is Empty',
                     style: TextStyle(
                     fontSize: 30,
                      color: Colors.blueGrey)
               ),
                 )
                 ],
                 ),
             )*/
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
                backgroundImage: NetworkImage('https://hopeacademyegypt.com/wp-content/uploads/2020/05/hope-logo.png'),
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
                          text: 'Hope Academy',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: '\n Special needs children eduacation',
                          style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: '\n It creates a bridge that leads\n students into adult life',
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
   floatingActionButton: FloatingActionButton(
        onPressed: (){
Navigator.push(context,
MaterialPageRoute(builder: (context)=>addmyservice()));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        backgroundColor: KMainColor,
      ),
    );
        
  }
}