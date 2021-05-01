import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';


class MyHomePageJob extends StatelessWidget{
  static String id ='MyHomePageJob';
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text(''),backgroundColor: KMainColor,),
     body: Stack(
       children: <Widget>[
         Column(
           children: <Widget>[
             Container(
               color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    //height: MediaQuery.of(context).size.height * .3,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
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
            return Center(
              child: Column(
               children: <Widget>[
                        Text(
                        'Title :  ${snapshot.data['jobTitle']}',
                          style: TextStyle(
                              color: Colors.purple,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          height: 1.3),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Description :  ${snapshot.data['jobDescription']}',
                          //'\$${product.pPrice}',
                          style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),),
                        SizedBox(
                          height: 20,
                        ),
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
                        )]),
            );}
                      }
                      ),
                        ]
             )
             )
             )
           ],
         )
       ],
     ),
   );
  }

}