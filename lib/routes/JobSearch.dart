import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/models/Jobs.dart';
import 'package:gp_project/models/product.dart';
import 'package:gp_project/routes/job_details.dart';
import 'package:gp_project/routes/product_details.dart';
import 'package:gp_project/services/DataController.dart';
import 'package:gp_project/routes/product_details.dart' as de;

import '../constance.dart';

class JobSearch extends StatefulWidget {
  static String id = 'JobSearch';
  @override
  _JobSearchState createState() => _JobSearchState();
}

class _JobSearchState extends State<JobSearch> {
  final TextEditingController searchcontroller = TextEditingController();
  QuerySnapshot snapshotData;
  bool isExecuted = false;
  String searchText;
  final DataController _sstore = DataController();
  @override
  Widget build(BuildContext context) {
   // product pro = ModalRoute.of(context).settings.arguments;
    Widget searchedData() {

        List<job> jobs = [];
              for (var doc in snapshotData.docs) {
                //var data=doc.data();
                jobs.add(job(
                    jId: doc.id,
                    jTitle: doc.data()[KJobTitle],
                    jDescription: doc.data()[KJobDescription],
                    jContact_Email: doc.data()[KJobcontact_Email],
                    jContact_phone: doc.data()[KJobcontact_Phone],
                    jImage: doc.data()[KJobImage]

                    ));

              }
              
      return ListView.builder(
            itemCount: snapshotData.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return  GestureDetector(
                 onTap: (){
                   Navigator.pushNamed(context, jobdetails.id,
                          arguments: jobs[index]);
                  // print('{$snapshotData[index].docs}');
                // Get.to(productdetails(),
                // transition: Transition.downToUp,
                // arguments:snapshotData.docs[index]);
                  },
                   child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        snapshotData.docs[index].data()['jobImage']),
                  ),
                  title: Text(
                    snapshotData.docs[index].data()['jobTitle'],
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0),
                  ),
                  subtitle: Text(
                    snapshotData.docs[index].data()['jobDescription'],
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
                      val.queryJobData(searchText).then((value) {
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