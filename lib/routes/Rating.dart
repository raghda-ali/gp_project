import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/models/product.dart';
import 'package:gp_project/models/rate.dart';
import 'package:gp_project/services/store.dart';
import 'package:path/path.dart';

class Rating extends StatefulWidget{
final int mazimunRating;
final Function(int) onRatingSelected;
 final product rateprod;

Rating(this.onRatingSelected,  this.rateprod , [this.mazimunRating =5] );

@override
_Rating createState()=> _Rating();
}


class _Rating extends State<Rating> {
  List<DocumentSnapshot> test;
List<product> products = [];
int sum=0;
int _currentRating =0; // product
int counter =0;
int khrate;
double averagee; 
final FirebaseAuth auth = FirebaseAuth.instance;
final store _store = store();
final GlobalKey<FormState>_favorite = GlobalKey<FormState>(debugLabel: '_ProductListState');
String docId = FirebaseFirestore.instance.collection('product').doc().id;
CollectionReference rate =FirebaseFirestore.instance.collection('rates');
var documeentID;
// ignore: deprecated_member_use
Widget _buildRatingStar(int index){
  if(index < _currentRating){
return Icon(Icons.star, color:Colors.yellow[800]);
}else{
  return Icon(Icons.star_border_outlined);
}
}

// @override
//   void initState() {
//     super.initState();
//     loadData();
//     // addRates();
//     // updateRates();
//   }
int personCounter;
double avGRate;
int lastRating;
String productName;
@override
  void initState() {
    setState((){
      loadData();
      // personCounter=widget.rateprod.personnom;
      // avGRate=widget.rateprod.average;
      // lastRating=widget.rateprod.currentRate;
      // print('LastAverage ${avGRate}');
      // print('NUm of people ${personCounter}');
      // print('MylastRate ${lastRating}');
    });
    super.initState();
  }

@override
Widget build(BuildContext context){
  return Form(
    key: _favorite,
    child: _buildBody());
}


Widget _buildBody(){
  final stars = List<Widget>.generate(this.widget.mazimunRating, (index) {
    return  GestureDetector(
            child:  _buildRatingStar(index),
            onTap: (){
              setState(() {
                        loadData();
                        khrate=_currentRating;
                        _currentRating =index+1;
                        if(_currentRating!=khrate){
                          personCounter++;
                        }
                        //sum +=_currentRating;
                        sum = lastRating+_currentRating;
                        // averagee= sum/counter;
                        averagee= avGRate +(sum/personCounter);

                        print('sumrate ${sum}');
                       // print('counterrr ${personCounter}');
                        print('avg${ averagee}');
                        
                        //print('LastAverage ${products[0].average}');

            

                        if(_favorite.currentState.validate()){
                         _favorite.currentState.save();
                          // personCounter=widget.rateprod.personnom;
                          //  avGRate=widget.rateprod.average;
                          //   lastRating=widget.rateprod.currentRate;
                         print('IDDDDDDD  ${widget.rateprod.prodID}');
                         updateRates();
                      
                      
                           }
                
               this.widget.onRatingSelected(_currentRating);
               
                  
  
                  // }//else
                  // }); 
              });//setState
            
            }
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
          

          
        
        ],
      
    ),
  );

}
Future updateRates() async {
  FirebaseFirestore.instance.collection(kProductCollection).where('ProductID' ,isEqualTo: widget.rateprod.prodID)
.get()
.then((querySnapshot) { 
  querySnapshot.docs.forEach((element) {
     FirebaseFirestore.instance
     .collection(kProductCollection)
     .doc(element.id)
     .update({
       'ProductRate':_currentRating,
       'AverageRate':averagee,
       'PersonNum':personCounter
        });
  });
});

}

  void loadData()async{
   // FirebaseFirestore.instance.collection(kProductCollection).get();
    CollectionReference collectionReference =FirebaseFirestore.instance.collection(kProductCollection);
    await collectionReference.where('ProductID' ,isEqualTo: widget.rateprod.prodID).get().then((value) {
      test = value.docs;
    });
    setState(() {
     personCounter =  test[0].data()['PersonNum'];
     avGRate = test[0].data()['AverageRate'];
     lastRating = test[0].data()['ProductRate'];
     productName = test[0].data()[''];
    });
    // print('test values step= : $returnSteps');
    // print('test values we = : $returnWeight');
    // print('test values bmi = : $returnBmi');
    // print('test len = : ${test.length}');

      print('LastAverage ${avGRate}');
      print('NUm of people ${personCounter}');
      print('MylastRate ${lastRating}');
      print('product Name ${productName}');  
  }



}