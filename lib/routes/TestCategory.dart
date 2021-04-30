/*import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gp_project/constance.dart';


class Test extends StatefulWidget {
    static String id ='test';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Test> {
  var selectedCurrency, selectedType;
  final GlobalKey<FormState> _globalKey = new GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                FontAwesomeIcons.bars,
                color: Colors.white,
              ),
              onPressed: () {}),
          title: Container(
            alignment: Alignment.center,
            child: Text("Account Details",
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.coins,
                size: 20.0,
                color: Colors.white,
              ),
              onPressed: null,
            ),
          ],
        ),
        body: Form(
            autovalidate: true,
            key: _globalKey,
            child: new ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              children: <Widget>[ 
               SizedBox(height: 20.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(
                      FontAwesomeIcons.phone,
                      color: Color(0xff11b719),
                    ),
                    hintText: 'Enter your Phone Details',
                    labelText: 'Phone',
                  ),
                  keyboardType: TextInputType.number
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(
                      FontAwesomeIcons.userCircle,
                      color: Color(0xff11b719),
                    ),
                    hintText: 'Enter your Name',
                    labelText: 'Name',
                  ),
                ),
                
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(
                      FontAwesomeIcons.envelope,
                      color: Color(0xff11b719),
                    ),
                    hintText: 'Enter your Email Address',
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.moneyBill,
                      size: 25.0,
                      color: Color(0xff11b719),
                    ),
                  
                    SizedBox(width: 50.0),
                   
                  
                StreamBuilder<QuerySnapshot>(
                   stream: FirebaseFirestore.instance.collection("Products").orderBy('ProductTitle').snapshots(),
                      builder: (context, snapshot){
                        if (!snapshot.hasData)
                           Text("No Data");
                        else {
                          List<DropdownMenuItem> categoryItems = [];
                          List<String> categorydata=[];
                          for (int i = 0; i < snapshot.data.docs.length; i++) {
                            // DocumentSnapshot snap = snapshot.data.docs[i].get('ProductTitle');
                            String test = snapshot.data.docs[i].get('ProductTitle').toString();
                            print('ProductTitle test : $test');
                           // List<String> categorydata=[];
                            categorydata.add(test);
                            categoryItems.add(
                               DropdownMenuItem(
                                //  snap.get('ProductTitle')
                                  child: Text(test,
                                    style: TextStyle(color: Color(0xff11b719)),
                                  ),
                                  // "${snap.get('ProductTitle')}"
                                value: test,
                                ),
                              );
                            
                            
                          }
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(FontAwesomeIcons.coins,
                                  size: 25.0, color: Color(0xff11b719)),
                              SizedBox(width: 50.0),
                              DropdownButton(
                                items: categoryItems,
                                onChanged: (categoryValue) {
                                  final snackBar = SnackBar(
                                    content: Text(
                                      'Selected Currency value is $categoryValue',
                                      style: TextStyle(color: Color(0xff11b719)),
                                    ),
                                  );
                                  Scaffold.of(context).showSnackBar(snackBar);
                                  setState(() {
                                    selectedCurrency = categoryValue;
                                  });
                                },
                                value: selectedCurrency,
                                isExpanded: false,
                                hint: new Text(
                                  "Choose Category Type",
                                  style: TextStyle(color: Color(0xff11b719)),
                                ),
                              ),
                            ],
                          );
                        
                        }
                        return Text("Loading....");
                      }),
               
               
/*new StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('categories').snapshots(),
    builder: (context, snapshot){
      if (!snapshot.hasData) 
      return Text("Loading");
      var length = snapshot.data.documents.length;
      DocumentSnapshot ds = snapshot.data.documents[length - 1];
      _queryCat = snapshot.data.documents;
      return new Container(
        padding: EdgeInsets.only(bottom: 16.0),
        width: 1000,
        child: new Row(
          children: <Widget>[
            new Expanded(
                flex: 2,
                child: new Container(
                  padding: EdgeInsets.fromLTRB(12.0,10.0,10.0,10.0),
                  child: new Text("Category",),
                )
            ),
            new Expanded(
              flex: 4,
              child:new InputDecorator(
                decoration: const InputDecoration(
                  //labelText: 'Activity',
                  hintText: 'Choose an category',
                  hintStyle: TextStyle(
                    color: KMainColor,
                    fontSize: 16.0,
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.normal,
                  ),
                ),
                isEmpty: _category == null,
                child: new DropdownButton(
                  value: _category,
                  isDense: true,
                  onChanged: (String newValue) {
                    setState(() {
                      _category = newValue;
                      dropDown = false;
                      print(_category);
                    });
                  },
                  items: snapshot.data.documents.map((DocumentSnapshot document) {
                    return new DropdownMenuItem<String>(
                        value: document.data['title'],
                        child: new Container(
                          decoration: new BoxDecoration(
                              color: primaryColor,
                              borderRadius: new BorderRadius.circular(5.0)
                          ),
                          height: 100.0,
                          padding: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0.0),
                          //color: primaryColor,
                          child: new Text(document.data['title'],style: textStyle),
                        )
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      );
    }
);*/
          
                  
    SizedBox(height: 20,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    RaisedButton(
                        color: Color(0xff11b719),
                        textColor: Colors.white,
                        child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text("Submit", style: TextStyle(fontSize: 24.0)),
                              ],
                            )),
                        onPressed: () {},
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))),
                  ],
                ),
              ],
            ),
          ),
        );
  }
}*/