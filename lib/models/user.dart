class user{

  String name;
  String phone;
  String address;
  String email;
  String uid;
  String type;

  user({this.uid,this.name,this.phone,this.address,this.email,this.type});


  /* user.fromData(Map<String,dynamic>data)
      :uid=data['uid'],
      email=data['email'],
      name= data['name'],
      phone= data['phone'],
      address= data['address'],
      type= data['type'];*/

  Map<String,dynamic> toJson(){
    return{
      'uid':uid,
      'name':name,
      'phone':phone,
      'address':address,
      'email':email,
      'type':type
    };
  }



}