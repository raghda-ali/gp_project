import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/services/store.dart';
import 'package:gp_project/models/product.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';


class productdetails extends StatefulWidget {
  static String id ='product details';

  @override
  _productdetailsState createState() => _productdetailsState();
}

class _productdetailsState extends State<productdetails> {
    var selectedcurrency,selsctedtype;

  final _store = store();

    List<String> _category =<String>[
     ' Intellectual disability','Impaired mobility','Visual impairment','Impaired hearing','Others'
    ];

    @override
  Widget build(BuildContext context) {
    product pro = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(title: Text('Product details'),backgroundColor: KMainColor,),


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

                      Text(
                        'Title :  ${pro.pTitle}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Price :  ${pro.pPrice}',

                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(

                        'Description :  ${pro.pDescription}',
                        //'\$${product.pPrice}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Text(

                        'phone :  ${pro.pContact_phone}',
                        //'\$${product.pPrice}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[
                                Icon(FontAwesomeIcons.solidArrowAltCircleUp,
                                size:25.0,
                                color: Color(0xff622F74), ),
                                SizedBox(width:50.0,),
                                DropdownButton(
                                           items: _category.map((value)=> DropdownMenuItem(
                                             child: Text(
                                             //'value :  ${serv.servcategory}',
                                               value,
                                               style: TextStyle(color:Color(0xff622F74)),
                                             ),
                                             value: value, ))
                                               .toList(),
                                        onChanged : (selectCategoryType) {
                                             print('$selectCategoryType');
                                             setState(() {
                                           selsctedtype  =selectCategoryType;
                                            });
                                         },

                                           value:selsctedtype,
                                           isExpanded: false,
                                           hint:Text('Choose service type',
                                           style: TextStyle(color:Color(0xFF2A0B35)),),
                          ),

                       SizedBox(height: 40.0,),
                      StreamBuilder<QuerySnapshot>(
                      stream:Firestore.instance.collection("Products").snapshots(),
                      builder:(context,Snapshot){
                        if(!Snapshot.hasData){
                          Text("loading");
                        }
                        else{
                          // ignore: missing_return
                          List<DropdownMenuItem> currencyItems = [];
                          for(int i=0;i<Snapshot.data.documents.length;i++){
                            DocumentSnapshot snap=Snapshot.data.documents[i];
                            currencyItems.add( DropdownMenuItem(
                                child : Text(
                                  snap.documentID,
                                  style:TextStyle(color: Color(0xFF2A0B35)),

                                ),
                                value:"${snap.documentID}"
                              )
                            );
                          }

                        }
                      },
                      ),
             ],
                      ),
                    ],
                  )

              ),
            ),
            //),

          ],
        ),

      ],
    ),

      /*StreamBuilder<QuerySnapshot>(

    stream: _store.loadproducts(),
    builder: (context, Snapshot) {
    if (Snapshot.hasData){
    List<product> products = [];
    for (var doc in Snapshot.data.docs) {
    products.add(product(
    pId: doc.id,
    pTitle: doc.data()[KProductTitle],
    pDescription: doc.data()[KProductDescription],
    pPrice: doc.data()[KProductPrice],
    pContact_phone: doc.data()[KProductcontact_Phone]));
    }


    return Column(
        children: <Widget>[
   Expanded(
    child: ListView.builder(

        itemBuilder: (context, index) => Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: MediaQuery.of(context).size.height * .2,
        color: KMainColor,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Title :  ${products[index].pTitle}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Text(
                'Description :  ${products[index].pDescription}',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Price :  ${products[index].pPrice}',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Contact us by phone :  ${products[index].pContact_phone}',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    ),
     itemCount: products.length,
      ),
      ),
],
   );












    }
    }

    ),*///////////////

    );

  }}


