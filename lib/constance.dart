import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//const KMainColor= Color(0xFFFFC12F);    
const KMainColor= Color(0xff622F74);                          
const KSocondaryColor= Color(0xFFFFE6AC);
const darkColor = Color(0xFF2A0B35);
const midColor = Color(0xFF522349);
const lightColor = Color(0xFFAB47BC);
const darkRedColor = Color(0xFFFA695C);
const lightRedColor = Color(0xFFFD685A);
const kServicesCollection = 'Services';
const KServiceTitle = 'ServiceTitle';
const KServiceDescription = 'ServiceDescription';
const KServiceCategory = 'ServiceCategory';
const KServicecontact_Phone = 'Servicecontact_Phone';
const KServicecontact_Email = 'Servicecontact_Email';


const redGradient = LinearGradient(
  colors: <Color>[darkRedColor, lightRedColor],
  stops: [0.0, 1.0],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);


const purpleGradient = LinearGradient(
  colors: <Color>[darkColor, midColor, lightColor],
  stops: [0.0, 0.5, 1.0],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
