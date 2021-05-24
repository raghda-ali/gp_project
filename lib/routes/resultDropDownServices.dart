import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/models/product.dart';
import 'package:gp_project/models/services.dart';
import 'package:gp_project/routes/product_details.dart' as de;
import 'package:gp_project/routes/service_details.dart' as sd;

class ResultDropDownServices extends StatefulWidget {
   static String id = 'ResultDropDownServices';

ResultDropDownServices({@required this.servicesss});


 final List<service> servicesss;

  @override
  _ResultDropDownServicesState createState() => _ResultDropDownServicesState();
}

class _ResultDropDownServicesState extends State<ResultDropDownServices> {
 // final List<product> productss = [];
  @override
  Widget build(BuildContext context) {
    return ListView.builder( 
    
    itemCount :widget.servicesss.length,
         itemBuilder: (BuildContext context, int index) {
    //  widget.productsss==null ?  Text('error', style: TextStyle(fontSize: 60.0 , color: Colors.white)): null;
      final fservices =widget.servicesss[index];
         //  print('tesst : ${snapshotData.docs[index].data()} ');
     print('ffff $fservices');
        if(widget.servicesss == null) return  CircularProgressIndicator() ;
         // if(snapshotData.docs == null) return CircularProgressIndicator();
        return  GestureDetector(
    onTap: (){
     // print('on tap: ${productss[index].pDescription}');
      Navigator.pushNamed(context, sd.servicedetails.id  ,                
           arguments:widget.servicesss[index]);
     },
      child: ListTile(
     leading: CircleAvatar(
       backgroundImage:NetworkImage(
         //snapshotData.docs[index].data()['ProductImage']),
         fservices.servImage),
         //  productss[index].pImage),
      ),
     title: Text(
     //  snapshotData.docs[index].data()['ProductTitle'],
     //productss[index].pTitle,
     fservices.servtitle,
       style: TextStyle(
           color: Colors.purple,
           fontWeight: FontWeight.bold,
           fontSize: 22.0),
     ),
     subtitle: Text(
         //  snapshotData.docs[index].data()['ProductDescription'],
         // productss[index].pDescription,
         fservices.servcategory,
       style: TextStyle(
           color: Colors.black,
            fontWeight: FontWeight.bold,
           fontSize: 16.0),
     ),
     trailing: Text(
       fservices.servdescription,
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