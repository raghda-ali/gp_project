import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/models/Jobs.dart';
import 'package:gp_project/models/product.dart';
import 'package:gp_project/models/services.dart';
import 'package:gp_project/models/user.dart';
import 'package:gp_project/routes/Editmyproducts.dart';
import 'package:gp_project/routes/Editprofile.dart';

class store
{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  //final CollectionReference _usercollectionrefrence= _firestore.instance.collection("users");
  create_user(user user ){
    try{
      _firestore.collection("users").doc(user.uid).set({
        'name':user.name,
        'phone':user.phone,
        'address':user.address,
        'email':user.email,
        'type':user.type

      });
    }catch(e){print(e);}
  }
  addservice(service service)
  {
    
    _firestore.collection(kServicesCollection).add({
      KServiceTitle:service.servtitle,
      KServiceCategory:service.servcategory,
      KServiceDescription:service.servdescription,
      KServicecontact_Phone:service.servcontact_phone,
      KServicecontact_Email:service.servcontact_email,
      KServiceImage: service.servImage,
      KServiceUserID : auth.currentUser.uid,

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
      KProductUserID : auth.currentUser.uid,
    });
  }

  addjobs(job job)
  {

    _firestore.collection(kJobCollection).add({
      KJobTitle : job.jTitle,
      KJobDescription : job.jDescription,
      KJobcontact_Email :job.jContact_Email,
      KJobcontact_Phone : job.jContact_phone,
      KJobImage:job.jImage,
      KJobUserID : auth.currentUser.uid,
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

  /*Stream<QuerySnapshot> loaduserinfo(documentId) {
    return _firestore
        .collection("users")
        .doc(documentId).collection("userinfo").snapshots();

  }
  Stream<QuerySnapshot> loadusers(){
    return _firestore.collection("users").snapshots();
  }*/
  Stream<QuerySnapshot> loaduserdata(documentId) {
    return _firestore
        .collection("users")
        .doc(documentId).collection("usersdata").snapshots();

  }
  Stream<QuerySnapshot> loadusers(){
    return _firestore.collection("users").snapshots();
  }
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
  Editprofile(data, documentId) {
    _firestore
        .collection("users")
        .doc(documentId)
        .update(data);
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
  
Stream<QuerySnapshot> loadMyProduct()
//Future <List<product>>loadMyProduct() async
  {
  // var snapshot = _firestore.collection(kProductCollection).snapshots();
  
   //var snapshot =  _firestore.collection(kProductCollection).get();
   return  _firestore.collection(kProductCollection).snapshots();}
  /* if(auth.currentUser.uid==KProductUserID){
    List<product> MyProductByID = [];
      //for(var doc in MyProductByID){
    for(var doc in snapshot.data.docs){
      var data=doc.data();
      MyProductByID.add(product(
        pTitle: data[KProductTitle],
        pDescription: data[KProductDescription],
        pPrice: data[KProductPrice],
        pContact_phone: data[KProductcontact_Phone],
        pImage:data[KProductImage],
      )
      );
    }}
    return MyProductByID; */
  

storeOrders(data , List<product> products){
  var documentRef =_firestore.collection(kOrders).document();
  documentRef.setData(data);
  for(var pro in products){
    documentRef.collection(kOrderDetails).document().setData(
      {
        KProductTitle : pro.pTitle,
        KProductPrice : pro.pPrice,
        KProductQuantity : pro.pQuantity,
        KProductImage : pro.pImage,
      });
  }
}
   Future<user> getuser(String uid) async {
    user retval = user();
    try{
      DocumentSnapshot _docSnapshot = await _firestore.collection("users").doc(uid).get();
      retval.uid=uid;
      retval.name=_docSnapshot.data()['name'];
      retval.phone=_docSnapshot.data()["phone"];
      retval.address=_docSnapshot.data()["address"];
      retval.email=_docSnapshot.data()["email"];
      retval.type=_docSnapshot.data()["type"];

    }catch(e){
      return e;
    }
    return retval;
   }


}

