import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/models/product.dart';
import 'package:gp_project/models/services.dart';
import 'package:gp_project/routes/Editmyproducts.dart';

class store
{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addservice(service service)
  {
    
    _firestore.collection(kServicesCollection).add({
      KServiceTitle:service.servtitle,
      KServiceCategory:service.servcategory,
      KServiceDescription:service.servdescription,
      KServicecontact_Email:service.servcontact_email,
      KServicecontact_Email:service.servcontact_phone,
    });
  }

  addproducts(product product)
  {

    _firestore.collection(kProductCollection).add({
      KProductTitle:product.pTitle,
      KProductDescription:product.pDescription,
      KProductPrice:product.pPrice,
      KProductcontact_Phone:product.pContact_phone,
    });
  }



 deleteservice(documentId) {
    _firestore.collection(kServicesCollection).doc(documentId).delete();
  }

  deleteproduct(documentId) {
    _firestore.collection(kProductCollection).doc(documentId).delete();
  }

  /*Future <List<service>>loadServices() async
  {
    var snapshot = await _firestore.collection(kServicesCollection).get();
    List<service> services = [];
    for(var doc in snapshot.docs){
      var data=doc.data();
      services.add(service(
        servtitle: data[KServiceTitle],
        servcategory: data[KServiceCategory],
        servdescription: data[KServiceDescription],
        servcontact_phone: data[KServicecontact_Phone],
        servcontact_email: data[KServicecontact_Email]
      )
      );
    }
    return services;
  }*/
  Stream<QuerySnapshot> loadservices(){
    return _firestore.collection(kServicesCollection).snapshots();
  }

  Stream<QuerySnapshot> loadproducts(){
    return _firestore.collection(kProductCollection).snapshots();
  }

  Editmyproducts(data, documentId) {
    _firestore
        .collection(kProductCollection)
        .doc(documentId)
        .update(data);
  }



}