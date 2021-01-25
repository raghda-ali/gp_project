import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/services/store.dart';
import 'package:gp_project/models/product.dart';


class productdetails extends StatelessWidget {
  static String id ='product details';
  final _store = store();
  //final GlobalKey<FormState>_globalkey = GlobalKey<FormState>();
  /*String title;
  String description;
  String price;
  String contact_phone;

  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
*/
  @override
  Widget build(BuildContext context) {
    product pro = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      resizeToAvoidBottomPadding: false,

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


