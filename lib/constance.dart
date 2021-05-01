import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//const KMainColor= Color(0xFFFFC12F); 
const mainBgColor = Color(0xFFf2f2f2);   
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
const kServiceDetails = 'ServiceDetails';
const KServiceImage='ServiceImage';
const KServiceUserID='UserID';

const kProductCollection = 'Products';
const KProductTitle = 'ProductTitle';
const KProductDescription = 'ProductDescription';
const KProductPrice = 'ProductPrice';
const KProductcontact_Phone = 'Productcontact_Phone';
const KProductImage = 'ProductImage';
const KProductQuantity = 'ProductQuantity';

const kJobCollection = 'jobs';
const KJobTitle = 'jobTitle';
const KJobDescription = 'jobDescription';
const KJobcontact_Email = 'jobcontact_Email';
const KJobcontact_Phone = 'jobcontact_Phone';
const KJobImage ='jobImage';
const KJobUserID='UserID';

const kOrders ='Orders';
const kOrderDetails ='OrderDetails';
const kTotallPrice = 'TotallPrice';
const kAddress ='Address';
const kProductQuantity ='Quantity';
const KProductUserID ='UserID';


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
//String USER_IMAGE='https://cdn4.iconfinder.com/data/icons/people-avatar-flat-1/64/girl_chubby_beautiful_people_woman_lady_avatar-512.png';