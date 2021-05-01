
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/constance.dart';
import 'package:gp_project/models/services.dart';
import 'package:gp_project/services/store.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class servicedetails extends StatefulWidget {
  static String id ='service details';

  @override
  _servicedetailsState createState() => _servicedetailsState();
}

class _servicedetailsState extends State<servicedetails> {
  final _store = store();
  var value;
  @override
  Widget build(BuildContext context) {
   // String documentId = ModalRoute.of(context).settings.arguments;
     service serv= ModalRoute.of(context).settings.arguments;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,

      appBar: AppBar(title: Text('service details'),backgroundColor: KMainColor,),


      body:Stack(
        children: <Widget>[
             Column(
              children: <Widget>[
                   Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .3,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Text(
                            'Title :  ${serv.servtitle}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                         /* Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(FontAwesomeIcons.service,
                                size:25.0,
                                color: Color(0xff622F74),
                                
                                ),
                                SizedBox(width:50.0,),
                                DropdownButton(
                                           items: category.map((value))=>DropdownMenueItem(
                                             child: Text(
                                             //'value :  ${serv.servcategory}',
                                               value,
                                               style: TextStyle(color:Color(0xff622F74)),
                                             ),
                                             value: value,
                                           )).toList().
                                           onChanged:(selectCategoryType){
                                            setState((){
                                                selectedType=selectCategoryType;
                                            });
                                           },
                                           value:selectedType,
                                           isExpanded: false,
                                           hint:Text('Choose service type',
                                           style: TextStyle(color:Color(0xFF2A0B35)),),
                          ),
                              ]
                          )
                          Text(
                              'Category :  ${serv.servcategory}',

                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                           DropdownButton(
                            hint:  Text("Select Category: "),
                            dropdownColor : Colors.grey,
                            icon: Icon(Icons.arrow_drop_down),
                            style: TextStyle(
                                color : Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                                ),
                          ),
                            value : valueChoose,
                            onChanged :(newValue) {
                            items: category.map((value)=>DropdownMenueItem(
                              child: Text(
                                value,
                                style: TextStyle(color :Color(0xff622F74)),
                              ),
                              value: value,

                            )).toList(),

                            onChanged:(SelectCategory){
                              print('$SelectCategory');
                              setState((){
                                selsctedtype =SelectCategory;
                              });
                            },
                            value: selsctedtype,
                            isExpanded:false,
                            hint:  Text('Choose service type',
                            style:TextStyle(color: Color(0xFF2A0B35)),
                            ),

                            ),
                            */

                          SizedBox(
                            height: 20,
                          ),
                          Text(

                            'Description :  ${serv.servdescription}',
                            //'\$${product.pPrice}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          Text(

                            'phone :  ${serv.servcontact_phone}',
                            //'\$${product.pPrice}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                              'Email :  ${serv.servcontact_email}',
                            //'\$${product.pPrice}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ) ,

                        ],

                              
                      ),
                    ),
                   ),
              ],
             ),
      
        ],
      )
    );
      


      /*  StreamBuilder<QuerySnapshot>(

          stream: _store.loadServiceDetails(documentId),
          builder: (context, Snapshot) {
            if (Snapshot.hasData){
              List<service> services = [];
              for (var doc in Snapshot.data.docs) {
                services.add(service(
                   // servId: doc.id,
                    servtitle: doc.data()[KServiceTitle],
                    servcategory: doc.data()[KServiceCategory],
                    servdescription: doc.data()[KServiceDescription],
                    servcontact_email: doc.data()[KServicecontact_Email],
                    servcontact_phone: doc.data()[KServicecontact_Phone]));
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
                                  Text('Title :  ${services[index].servtitle}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Description :  ${services[index].servdescription}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Category :  ${services[index].servcategory}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Contact us by Phone :  ${services[index].servcontact_phone}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Contact us by Email :  ${services[index].servcontact_email}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        itemCount: services.length,
                      ),
                    ),
                  ],

              );












            }
          }

      ),*/
    
                            }
  }