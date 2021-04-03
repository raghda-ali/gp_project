import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/models/Jobs.dart';
import 'package:gp_project/models/product.dart';
import 'package:gp_project/models/services.dart';
import 'package:gp_project/routes/Editmyproducts.dart';

class store
{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  addservice(service service)
  {
    
    _firestore.collection(kServicesCollection).add({
      KServiceTitle:service.servtitle,
      KServiceCategory:service.servcategory,
      KServiceDescription:service.servdescription,
      KServicecontact_Phone:service.servcontact_phone,
      KServicecontact_Email:service.servcontact_email,
    });
  }

  addproducts(product product)
  {

    _firestore.collection(kProductCollection).add({
      KProductTitle:product.pTitle,
      KProductDescription:product.pDescription,
      KProductPrice:product.pPrice,
      KProductcontact_Phone:product.pContact_phone,
      KProductImage : product.pImage,
    //  KProductuserid: auth.currentUser.uid, 
    });
  }

  addjobs(job job)
  {

    _firestore.collection(kJobCollection).add({
      KJobTitle : job.jTitle,
      KJobDescription : job.jDescription,
      KJobcontact_Email :job.jContact_Email,
      KJobcontact_Phone : job.jContact_phone,
    });
  }



 deleteservice(documentId) {
    _firestore.collection(kServicesCollection).doc(documentId).delete();
  }

  deleteproduct(documentId) {
    _firestore.collection(kProductCollection).doc(documentId).delete();
  }

  editService(data, documentId) {
    _firestore
        .collection(kServicesCollection)
        .doc(documentId)
        .update(data);
  }
  deletejob(documentId) {
    _firestore.collection(kJobCollection).doc(documentId).delete();
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
  Stream<QuerySnapshot> loadServiceDetails(documentId) {
    return _firestore
        .collection(kServicesCollection)
        .doc(documentId).collection(kServiceDetails).snapshots();
        
  }
  Stream<QuerySnapshot> loadservices(){
    return _firestore.collection(kServicesCollection).snapshots();
  }

  Stream<QuerySnapshot> loadproducts(){
    return _firestore.collection(kProductCollection).snapshots();
  }

  Stream<QuerySnapshot> loadjobs(){
    return _firestore.collection(kJobCollection).snapshots();
  }

  Editmyproducts(data, documentId) {
          _firestore
        .collection(kProductCollection)
        .doc(documentId)
        .update(data);
  }
  Editmyjobs(data, documentId) {
    _firestore
        .collection(kJobCollection)
        .doc(documentId)
        .update(data);
  }




}