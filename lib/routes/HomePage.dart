// ignore: avoid_web_libraries_in_flutter
//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/routes/MyHomePageJob.dart';
import 'package:gp_project/services/store.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp_project/routes/login_screen.dart';
import 'package:gp_project/routes/Products_screen.dart';
import 'package:gp_project/routes/Services_screen.dart';
import 'package:gp_project/routes/Jobs_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constance.dart';
import 'Jobs_screen.dart';
import 'Products_screen.dart';
final _auth=FirebaseAuth.instance;

//void main() => runApp(MyApp());

/*class MyApp extends StatelessWidget {
  static String id='HomePage';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
*/
class MyHomePage extends StatefulWidget {

  static String id='MyHomePage';
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
 
  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final _store = store();

  void onTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.topCenter,
              // ignore: deprecated_member_use
              overflow: Overflow.visible,
              children: <Widget>[
                _backBgCover(),
                _greetings(),
                _moodsHolder(),
              ],
            ),
            SizedBox(
              height: 25.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                  //  _notificationCard(),
                  // _specialistsServiceText(),
                   _specialistsServiceJobCard(),
                 //  _getproductdata(),
                   // _appoinmentCard(),
                  //  _specialistsJobText(),
                   // _specialistsJobCardInfo(),
                  //  _specialistsCardInfo(),
                   // _specialistsProductText(),
                   // _specialistsProductCardInfo(),
                   // _appoinmentCard(),
                    //_specialistsCardInfo(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
     /* bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                LineAwesomeIcons.home,
                size: 30.0,
              ),
              title: Text('1')),
          BottomNavigationBarItem(
              icon: Icon(
                LineAwesomeIcons.search,
                size: 30.0,
              ),
              title: Text('2')),
          BottomNavigationBarItem(
              icon: Icon(
                LineAwesomeIcons.gratipay,
                size: 30.0,
              ),
              title: Text('3')),
        ],
        onTap: onTapped,
      ),*/
    );
  }

   Positioned _moodsHolder() {
    return Positioned(
      bottom: -45,
      child: Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width - 40,
        padding: EdgeInsets.all(11.5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(28)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 5.5,
                blurRadius: 5.5,
              )
            ]),
        child:Center(
          child: Text('Helping people with special needs',
            style: TextStyle(
              //color: Colors.purple.shade800,
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),),
        ),
      ),
    );
  }

  

  Container _backBgCover() {
    return Container(
      height: 260.0,
      decoration: BoxDecoration(
        gradient: purpleGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
    );
  }

  Positioned _greetings() {
    return Positioned(
      left: 20,
      bottom: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
           // 'Welcome ${_auth.currentUser.email}',
           'Welcome',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
           // color:Color(0xFFA52C4D),
            child: Text('LogIn'),
            onPressed:(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return LoginScreen();
              }));
            })
         /* Text(
            'How are you feeling today ?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),*/
        ],
      ),
    );
  }

  Widget _specialistsServiceText() {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Our Latest Services',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          FlatButton(
            onPressed: (){
               final user = _auth.signInWithEmailAndPassword;
                   //    (email: email, password: password);
              if(user !=null){
                        Navigator.pushNamed(context, myservices.id);
                      }
            },
            child:Text(
            'See All',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: midColor,
           ), ), 
          ),
        ],
      ),
    );
  }
/*
  Container _appoinmentCard() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.0, 

horizontal: 18.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Color(0xFFD9D9D9),
                backgroundImage: NetworkImage(USER_IMAGE),
                radius: 36.0,
              ),
              RichText(
                text: TextSpan(
                  text: 'Dr Dan MlayahFX',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\nSunday,May 5th at 8:00 PM',
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    TextSpan(
                      text: '\n570 Kyemmer Stores \nNairobi Kenya C -54 Drive',
                      style: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Divider(
            color: Colors.grey[200],
            height: 3,
            thickness: 1,
          ),
          SizedBox(
            height: 8.0,
          ),
           RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(80.0)),
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
                        child: const Text(
                          'Book Visit',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
        /*  Row(
            mainAxisAlignment: 

MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _iconBuilder(LineAwesomeIcons.check_circle, 

'Check-in'),
              _iconBuilder(LineAwesomeIcons.times_circle, 

'Cancel'),
              _iconBuilder

(LineAwesomeIcons.calendar_times_o, 'Calender'),
              _iconBuilder(LineAwesomeIcons.compass, 

'Directions'),
            ],
          )*/
        ],
      ),
    );
  }
*/
  Column _iconBuilder(icon, title) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 28,
          color: Colors.black,
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  /*Container _notificationCard() {
    return Container(
      width: 700,
      height: 100,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xFFBF4954),
        // gradient: redGradient,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          LineAwesomeIcons.calendar_check_o,
          color: Colors.white,
          size: 32,
        ),
        title: Text(
          'Our vision for the future is that we can help people with special needs that they can communicate with each other and with the appropriate means and services to help them and to easily promote their jobs and talents.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        /*trailing: OutlineButton(
          onPressed: () {},
          color: Colors.transparent,
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          child: Text(
            'Review & Add Notes',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ),*/
      ),
    );
  }
  
*/
  Widget _specialistsJobText() {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Our Latest Jobs',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
         FlatButton(
            onPressed: (){
               final user = _auth.signInWithEmailAndPassword;
                   //    (email: email, password: password);
              if(user !=null){
                        Navigator.pushNamed(context, MyJobs.id);
                      }
            },
            child:Text(
            'See All',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: midColor,
           ), ), 
          ),
        ],
      ),
    );
  }

   Widget _specialistsProductText() {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Our Latest Product',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          FlatButton(
            onPressed: (){
               final user = _auth.signInWithEmailAndPassword;
                   //    (email: email, password: password);
              if(user !=null){
                        Navigator.pushNamed(context, MyProducts.id);
                      }
            },
            child:Text(
            'See All',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: midColor,
           ), ), 
          ),
        ],
      ),
    );
  }

 Widget _specialistsProductCardInfo()  {
        return 
        Container(
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
                    backgroundColor: Color(0xFFD9D9D9),
                    backgroundImage: AssetImage('images/producticon.png'),
                    //backgroundImage: NetworkImage(USER_IMAGE),
                    radius: 36.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      StreamBuilder<DocumentSnapshot>(
                 stream: FirebaseFirestore.instance
                .collection(kProductCollection)
                .doc('0MpZB5bEDKlDjW4ZMBtL')
                .snapshots(),
                builder: (context,AsyncSnapshot<DocumentSnapshot>snapshot){
                if(!snapshot.hasData)
                {
        
                 return Center(child: Text('Loading...'),);
                }
                else{ 
                   /*   StreamBuilder<DocumentSnapshot>(stream: _store.getproductdatabyid(),
                      builder:(BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
                           if(!snapshot.hasData){
            return Center(
              child: Text('My products is empty'),
            );
          }else{
           // var data = DocumentSnapshot.data;
            var data = snapshot.data;
            */
           return Column(
             children:<Widget>[
                      Text(
                     //   'Title :  ${doc.data.get(['ProductTitle'])}',
                      'Title :  ${snapshot.data['ProductTitle']}',
                        style: TextStyle(
                            color: Colors.purple,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        height: 1.3),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                       // 'Price :  ${DocumentSnapshot.data.get(['ProductPrice'])}',
                        'Price :  ${snapshot.data['ProductPrice']}',
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Description :  ${snapshot.data['ProductDescription']}',
                        //'\$${product.pPrice}',
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),),
                      SizedBox(
                        height: 20,
                      ),
                      Text('phone :  ${snapshot.data['Productcontact_Phone']}',
                        //'\$${product.pPrice}',
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                      // ignore: missing_return
                      )]);}
                      }
                      ),
                    
                
                  SizedBox(
                    height: 6.0,
                  ),
                  RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(80.0)),
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
                        child: const Text(
                          'Visit',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            LineAwesomeIcons.heart,
            color: lightColor,
            size: 36,
          ),
        ],
      ),
    );
  }

  Widget _specialistsServiceJobCard()  {
        return Column(
        /* Container(
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
              ]), */
         // child: Row(
         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
         //   crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 200,
               // width: 500,
             child: Row(
               children: <Widget>[
                          //Padding(
                         //   padding: const EdgeInsets.all(0.0),
                         // ),
                            Card( 
                           color : Colors.white, 
                           elevation: 0,
                           margin: EdgeInsets.all(20.0),
                           
                          // margin: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(15.0),
                           ),
                           child :Container(
                             width: 150,
                             height: 160,
                             child: Column(
                             mainAxisSize: MainAxisSize.min,
                             children: <Widget>[
                          SizedBox(
                             height:15,
                            // width:30,
                                 ),
                        FlatButton(onPressed:(){
                            final user = _auth.signInWithEmailAndPassword;
                   //    (email: email, password: password);
                        if(user !=null){
                        Navigator.pushNamed(context, myservices.id);
                      }
                        },
                        child:CircleAvatar(
                        backgroundColor: Color(0xFFD9D9D9),
                        backgroundImage: AssetImage('images/serviceicon.png'),
                             //backgroundImage: NetworkImage(USER_IMAGE),
                         radius: 55.0,
                         ),),
                         
                         /*  Icon(Icons.group,
                                 color: Colors.teal,
                                 size: 30,),*/
                                 SizedBox(
                                   height: 5,
                                 ),
                           Text('Our Services',
                                 style: TextStyle(
                                   fontSize: 20.0,
                                  // color: Colors.black,
                                   color: Colors.purple.shade800,
                                   //fontWeight: FontWeight.w500
                                 ),
                                 ),
                            ],
                            ) 
                             ) 
                           ), 
                      Card( 
                           color : Colors.white, 
                           elevation: 0,
                           margin: EdgeInsets.all(10.0),
                         // margin: EdgeInsets.symmetric(horizontal: 0,vertical: 20),
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(15.0),
                           ),
                           child :Container(
                             width: 150,
                             height: 160,
                             child: Column(
                               mainAxisSize: MainAxisSize.min,
                             children: <Widget>[
                           SizedBox(
                             height:15,
                            // width:50,
                                  ),
                          FlatButton(onPressed:(){
                            final user = _auth.signInWithEmailAndPassword;
                   //    (email: email, password: password);
                        if(user !=null){
                        Navigator.pushNamed(context, MyJobs.id);
                      }
                        },
                         child:CircleAvatar(
                         backgroundColor: Color(0xFFD9D9D9),
                         backgroundImage: AssetImage('images/jobicon.png'),
                         radius: 55.0,
                          )),
                          SizedBox(
                            height: 5,
                          ),
                           Text('Our Jobs',
                                 style: TextStyle(
                                   fontSize: 20.0,
                                   color: Colors.purple.shade800,
                                  // fontWeight: FontWeight.w500
                                 ),
                                 ),
                                  ]
                           )
                           )
                           ),
               // mainAxisAlignment: MainAxisAlignment.start,
               // crossAxisAlignment: CrossAxisAlignment.start,
               /*      children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Color(0xFFD9D9D9),
                    backgroundImage: AssetImage('images/serviceicon.png'),
                    //backgroundImage: NetworkImage(USER_IMAGE),
                    radius: 36.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      StreamBuilder<DocumentSnapshot>(
                 // ignore: deprecated_member_use
                 stream: Firestore.instance
                .collection(kServicesCollection)
                .doc('BSwR2VsjnYf2obVotH0V')
                .snapshots(),
                builder: (BuildContext context,AsyncSnapshot<DocumentSnapshot>snapshot){
                if(!snapshot.hasData)
                 {
        
                return Center(child: Text('Loading...'),);
                 }
                else{ 
            return Column(
               children: <Widget>[
                      Text(
                     //   'Title :  ${doc.data.get(['ProductTitle'])}',
                      'Service Category :  ${snapshot.data['ServiceCategory']}',
                        style: TextStyle(
                            color: Colors.purple,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        height: 1.3),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                       // 'Price :  ${DocumentSnapshot.data.get(['ProductPrice'])}',
                        'Title :  ${snapshot.data['ServiceTitle']}',
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Description :  ${snapshot.data['ServiceDescription']}',
                        //'\$${product.pPrice}',
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),),
                      SizedBox(
                        height: 20,
                      ),
                      Text('E-mail :  ${snapshot.data['Servicecontact_Email']}',
                        //'\$${product.pPrice}',
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),),
                      SizedBox(
                        height: 20,
                      ),
                      Text('phone :  ${snapshot.data['Servicecontact_Phone']}',
                        //'\$${product.pPrice}',
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                      // ignore: missing_return
                      )]);}
                      }
                      ),    */
                    
                
                  SizedBox(
                    height: 6.0,
                  ),
                  /*RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(80.0)),
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
                        child: const Text(
                          'Visit',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),*/
                ],
              ),
          ),
          Container(
             height: 160,

                        child: Row(
                        children: <Widget>[
              
                          Padding(
                            padding: const EdgeInsets.all(50.0),
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
                             width: 150,
                             height: 160,
                             child: Column(
                               mainAxisSize: MainAxisSize.min,
                             children: <Widget>[
                           SizedBox(
                             height:15,
                            // width:50,
                                  ),
                          FlatButton(onPressed:(){
                            final user = _auth.signInWithEmailAndPassword;
                   //    (email: email, password: password);
                        if(user !=null){
                        Navigator.pushNamed(context, MyProducts.id);
                      }
                          },
                          child:CircleAvatar(
                           backgroundColor: Color(0xFFD9D9D9),
                           backgroundImage: AssetImage('images/producticon.png'),
                           //backgroundImage: NetworkImage(USER_IMAGE),
                            radius: 55.0,
                          )),
                          SizedBox(height: 5,),
                           Text('Our Products',
                                 style: TextStyle(
                                   fontSize: 20.0,
                                   color: Colors.purple.shade800,
                                 ),
                                 ),
                             ]
                               )
                               )
                           ),
                        ])
                        ),
         
        ],
      );
  }
  Widget _specialistsJobCardInfo()  {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 14.0, 
    
    horizontal: 18.0),
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
                    backgroundImage: AssetImage('images/jobicon.png'),
                    //backgroundImage: NetworkImage(USER_IMAGE),
                    radius: 36.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      StreamBuilder<DocumentSnapshot>(
                 stream: FirebaseFirestore.instance
                .collection(kJobCollection)
                .doc('7j0Q5oUsKUvLCwIEG7QM')
                .snapshots(),
                builder: (BuildContext context,AsyncSnapshot<DocumentSnapshot>snapshot){
                if(!snapshot.hasData)
                 {
        
                return Center(child: Text('Loading...'),);
                 }
                else{ 
                   
            return Column(
             children: <Widget>[
               SizedBox(height: 10.0),
                    Text(
                     //   'Title :  ${doc.data.get(['ProductTitle'])}',
                      'Title :  ${snapshot.data['jobTitle']}',
                        style: TextStyle(
                            color: Colors.purple,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        height: 1.3),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      Text('Description : ${snapshot.data['jobDescription']}',
                      
                        //'\$${product.pPrice}',
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                          softWrap: true
                          ),
                      SizedBox(
                        height: 30,
                      ),
                      /*
                      Text(
                       // 'Price :  ${DocumentSnapshot.data.get(['ProductPrice'])}',
                        'E-mail :  ${snapshot.data['jobcontact_Email']}',
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),),
                      SizedBox(
                        height: 20,
                      ),
                      Text('phone :  ${snapshot.data['jobcontact_Phone']}',
                        //'\$${product.pPrice}',
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                      // ignore: missing_return
                      )*/
                      ]);}
                      }
                      ),
                    
                /*  RichText(
                    text: TextSpan(
                      text: 'Wellness\n',
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Dr Ayor Kruger',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: '\nPoplar Pharma Limited',
                          style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: '\nDermatologist \nSAn Franscisco CA | 5 min',
                          style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  */
                  SizedBox(
                    height: 6.0,
                  ),
                  RaisedButton(
                    onPressed: () {
                      final user = _auth.signInWithEmailAndPassword;
                   //    (email: email, password: password);
                    if(user !=null){
                        Navigator.pushNamed(context, MyHomePageJob.id);
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(80.0)),
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
                        child: const Text(
                          'Visit',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            LineAwesomeIcons.heart,
            color: lightColor,
            size: 36,
          ),
        ],
      ),
    );
  }
}