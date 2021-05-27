/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Rating extends StatefulWidget{
final int mazimunRating;
final Function(int) onRatingSelected;


Rating(this.onRatingSelected, [this.mazimunRating =5]);

@override
_Rating createState()=> _Rating();
}


class _Rating extends State<Rating> {
int _currentRating =0;
/*final FirebaseAuth auth = FirebaseAuth.instance;
final store _store = store();
*/
Widget _buildRatingStar(int index){
  if(index < _currentRating){
return Icon(Icons.star, color:Colors.yellow[800]);
}else{
  return Icon(Icons.star_border_outlined);
}
}

Widget _buildBody(){
  final stars = List<Widget>.generate(this.widget.mazimunRating, (index) {
    return GestureDetector(
        child:  _buildRatingStar(index),
        onTap: (){
          setState(() {
                    _currentRating =index+1;
                  });
                  this.widget.onRatingSelected(_currentRating);
                   /*if(_favorite.currentState.validate()){
                  _favorite.currentState.save();
                  _store.addrate(rates(
                  myrate: _currentRating,
                  userID:  auth.currentUser.uid ,
                  productId: docId
                  ),
                  product(
                  pId: docId ,
                  ));
                      }*/
        
                  });
    
  });
  return SingleChildScrollView(
         child :Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
                children: stars,
              ),
            SizedBox(width: 15,),
            if(_currentRating!=null&&_currentRating!=0)
            Text("you selected $_currentRating rating",
            style: TextStyle(fontSize: 10),
            textAlign: TextAlign.start,),
            
           /* FlatButton(
              child: Text("Clear", style: TextStyle(color: KMainColor )),
              onPressed: (){
                setState(() {
                            _currentRating=0;
                          });
                          this.widget.onRatingSelected(_currentRating);
              },
            )*/
          ],
        
      ),
    );
  

}

/*void save(){
   if(_favorite.currentState.validate()){
                  _favorite.currentState.save();
                  _store.addrate(rates(
                  myrate: _currentRating,
                  userID:  auth.currentUser.uid ,
                  productId: docId
                  ),
                  product(
                  pId: docId ,
                  ));
                      }
}*/


@override
Widget build(BuildContext context){
  return _buildBody();
}
}*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/models/product.dart';
import 'package:gp_project/models/rate.dart';
import 'package:gp_project/services/store.dart';

class Rating extends StatefulWidget{
final int mazimunRating;
final Function(int) onRatingSelected;

Rating(this.onRatingSelected, [this.mazimunRating =5]);

@override
_Rating createState()=> _Rating();
}


class _Rating extends State<Rating> {
int _currentRating =0;
final FirebaseAuth auth = FirebaseAuth.instance;
final store _store = store();
final GlobalKey<FormState>_favorite = GlobalKey<FormState>(debugLabel: '_ProductListState');
String docId = FirebaseFirestore.instance.collection('product').doc().documentID;
CollectionReference rate =FirebaseFirestore.instance.collection('rates');
// ignore: deprecated_member_use
Widget _buildRatingStar(int index){
  if(index < _currentRating){
return Icon(Icons.star, color:Colors.yellow[800]);
}else{
  return Icon(Icons.star_border_outlined);
}
}



Widget _buildBody(){
  final stars = List<Widget>.generate(this.widget.mazimunRating, (index) {
    return  GestureDetector(
            child:  _buildRatingStar(index),
            onTap: (){
              setState(() {
                        _currentRating =index+1;
                        //StreamBuilder<QuerySnapshot>(
                      // stream:FirebaseFirestore.instance.collection("Rates").orderBy('Rate').snapshots(),
                        FutureBuilder(
                          future: _store.getratedata(auth.currentUser.uid),
                        builder: (_, snapshot){
                       if (snapshot.connectionState == ConnectionState.done) {
                         
                         return Text('Loading');
                         //addRates();
                        /*if(_favorite.currentState.validate()){
                         _favorite.currentState.save();
                        _store.addrate(rates(
                        myrate: _currentRating,
                        userID:  auth.currentUser.uid ,
                        productId: docId,
                        ),
                        product(
                        pId: docId ,
                        ));
                        
                        }*/
                        }else{
                          addRates();
                      ///  updateRates();
                          //return rate.doc().update({'Rate':_currentRating});
                        }
                      
                        
                         return null;
                          });
                        
              });
                    this.widget.onRatingSelected(_currentRating);
                  
            },
          
        );

  });
  return SingleChildScrollView(
    child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
              children: stars,
            ),
          SizedBox(width: 15,),
          if(_currentRating!=null&&_currentRating!=0)
          Text("you selected $_currentRating rating",
          style: TextStyle(fontSize: 10),
          textAlign: TextAlign.start,)
          

          
         /* FlatButton(
            child: Text("Clear", style: TextStyle(color: KMainColor )),
            onPressed: (){
              setState(() {
                          _currentRating=0;
                        });
                        this.widget.onRatingSelected(_currentRating);
            },
          )*/
        ],
      
    ),
  );

}
Future updateRates() async {
  /*var firestore = Firestore.instance;
  QuerySnapshot qn = await firestore.collection('Rate').get();
  return qn.docs;*/
  CollectionReference rate =FirebaseFirestore.instance.collection('rates');
  return rate.doc().update({'Rate':_currentRating});

}
 addRates() {
if(_favorite.currentState.validate()){
 _favorite.currentState.save();
_store.addrate(rates(
myrate: _currentRating,
userID:  auth.currentUser.uid ,
productId: docId,
      ),
  product(
  pId: docId ,
  ));                  
  }
}

/*@override
  void initState() {
    super.initState();
    addRates();
    updateRates();
  }*/

@override
Widget build(BuildContext context){
  return Form(
    key: _favorite,
    child: _buildBody());
}
}