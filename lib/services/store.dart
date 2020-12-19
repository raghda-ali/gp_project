import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/models/services.dart';

class store{
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
}