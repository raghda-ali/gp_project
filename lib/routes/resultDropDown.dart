import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/models/product.dart';
import 'package:gp_project/routes/product_details.dart' as de;

class ResultDropDown extends StatefulWidget {
   static String id = 'ResultDropDown';

ResultDropDown({@required this.productsss});


 final List<product> productsss  ;

  @override
  _ResultDropDownState createState() => _ResultDropDownState();
}

class _ResultDropDownState extends State<ResultDropDown> {
 // final List<product> productss = [];
  @override
  Widget build(BuildContext context) {
    return ListView.builder( 
    
    itemCount :widget.productsss.length,
         itemBuilder: (BuildContext context, int index) {
    //  widget.productsss==null ?  Text('error', style: TextStyle(fontSize: 60.0 , color: Colors.white)): null;
      final fProduct =widget.productsss[index];
         //  print('tesst : ${snapshotData.docs[index].data()} ');
     print('ffff $fProduct');
        if(widget.productsss == null) return  CircularProgressIndicator() ;
         // if(snapshotData.docs == null) return CircularProgressIndicator();
        return  GestureDetector(
    onTap: (){
     // print('on tap: ${productss[index].pDescription}');
      Navigator.pushNamed(context, de.productdetails.id  ,                
           arguments:widget.productsss[index]);
     },
      child: ListTile(
     leading: CircleAvatar(
       backgroundImage:NetworkImage(
         //snapshotData.docs[index].data()['ProductImage']),
         fProduct.pImage),
         //  productss[index].pImage),
      ),
     title: Text(
     //  snapshotData.docs[index].data()['ProductTitle'],
     //productss[index].pTitle,
     fProduct.pTitle,
       style: TextStyle(
           color: Colors.purple,
           fontWeight: FontWeight.bold,
           fontSize: 22.0),
     ),
     subtitle: Text(
         //  snapshotData.docs[index].data()['ProductDescription'],
         // productss[index].pDescription,
         fProduct.pPrice.toString(),
       style: TextStyle(
           color: Colors.black,
            fontWeight: FontWeight.bold,
           fontSize: 16.0),
     ),
     trailing: Text(
       fProduct.pDescription,
       style: TextStyle(
           color: Colors.black,
            fontWeight: FontWeight.bold,
           fontSize: 16.0),
     ),
    

         ),
            );
        }
        );
 
  }
}