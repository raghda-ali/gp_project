import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:gp_project/models/product.dart';
import 'package:gp_project/models/services.dart';
import 'package:gp_project/routes/product_details.dart';
import 'package:gp_project/services/DataController.dart';
import 'package:gp_project/routes/product_details.dart' as de;
import 'package:gp_project/routes/service_details.dart';

import '../constance.dart';

class ServicesSearch extends StatefulWidget {
  static String id = 'ServicesSearch';
  @override
  _ServicesSearchState createState() => _ServicesSearchState();
}

class _ServicesSearchState extends State<ServicesSearch> {
  final TextEditingController searchcontroller = TextEditingController();
  QuerySnapshot snapshotData;
  bool isExecuted = false;
  String searchText;
  final DataController _sstore = DataController();
  @override
  Widget build(BuildContext context) {
   // product pro = ModalRoute.of(context).settings.arguments;
    Widget searchedData() {

       List<service> services = [];
              for (var doc in snapshotData.docs) {
                //var data=doc.data();
                services.add(service(
                servId: doc.id,
                servtitle: doc.data()[KServiceTitle],
                servcategory: doc.data()[KServiceCategory],
                servdescription: doc.data()[KServiceDescription],
                servcontact_email: doc.data()[KServicecontact_Email],
                servcontact_phone: doc.data()[KServicecontact_Phone],
                servImage: doc.data()[KServiceImage]
                    ));
              }
              
      return ListView.builder(
            itemCount: snapshotData.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return  GestureDetector(
                 onTap: (){
                   Navigator.pushNamed(context, servicedetails.id,
                          arguments: services[index]);
                  // print('{$snapshotData[index].docs}');
                // Get.to(productdetails(),
                // transition: Transition.downToUp,
                // arguments:snapshotData.docs[index]);
                  },
                   child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        snapshotData.docs[index].data()['ServiceImage']),
                  ),
                  title: Text(
                    snapshotData.docs[index].data()['ServiceTitle'],
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0),
                  ),
                  subtitle: Text(
                    snapshotData.docs[index].data()['ServiceDescription'],
                    style: TextStyle(
                        color: Colors.black,
                        //  fontWeight: FontWeight,
                        fontSize: 16.0),
                  ),
                ),
              );
            });
    
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.clear),
          onPressed: () {
            setState(() {
              isExecuted = false ;
              snapshotData.docs.clear();
            });
          },
          backgroundColor: KMainColor),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: KMainColor,
        elevation: 0,
        actions: [
          GetBuilder<DataController>(
              init: DataController(),
              builder: (val) {
                return IconButton(
                    icon: Icon(Icons.search,size: 27,),
                    onPressed: () {
                      val.queryServicesData(searchText).then((value) {
                        snapshotData = value;
                        setState(() {
                          isExecuted = true;
                        });
                      });
                    });
              })
        ],
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search here ',
            hintStyle: TextStyle(color: Colors.white),
          ),
          controller: searchcontroller,
          onChanged: (Value){
            searchText = Value;
          },
        ),
      ),
      body: isExecuted
          ? searchedData()
          : Container(
              child: Center(
              child: Text('Search any products',
                  style: TextStyle(color: Colors.black, fontSize: 25.0)),
            )),
    );
    
    }
    }