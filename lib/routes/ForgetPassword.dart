import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordScreen extends StatelessWidget {
  TextEditingController editController = TextEditingController();
  @override
  static String id='ForgetPassword';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot password"),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: editController,
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter Email",
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  resetPassword(context);
                },
                child: Text(
                  "Reset password",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void resetPassword(BuildContext context) async {
    if (editController.text.length == 0 || !editController.text.contains("@")) {
      Fluttertoast.showToast(msg: "Enter valid email");
      return;
    }

    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: editController.text);
    Fluttertoast.showToast(
        msg:
            "Reset password link has sent your mail please use it to change the password.");
    Navigator.pop(context);
  }
}

/*import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class ForgetPassword extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _ForgetPassword();
  }
}
class _ForgetPassword extends State<ForgetPassword>{
  //String email="";
  //var _formKey =GlobalKey<FormState>();
  TextEditingController editController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child :Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: editController,
              decoration: InputDecoration(
                hintText: "Enter Email",
                border: OutlineInputBorder()),
            ),
          ],
        )
      )
  }

      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text("Forgetten Password",style: TextStyle(color: Colors.blue),),backgroundColor: Colors.black54,),
      body: Center(
        child:Padding(padding : EdgeInsets.only(top:50 , right:20 , left :20),
        child: Form(
          key: _formKey,
          child:Column(
          children: <Widget>[
            Text("Please, provide your account email to procced password restoring",
            style: TextStyle(color :Colors.blue ,fontSize: 20),
            ),

            Theme(
              data: ThemeData(
                hintColor: Colors.blue
                ),
                child : Padding(padding: EdgeInsets.only(top :30),
                child: TextFormField(
                  validator:(value){
                    if(value.isEmpty){
                      return " Please enter your email";
                    }else{
                      email=value;
                    }
                    return null;
                  } ,
                  style: TextStyle(color : Colors.white),
                  decoration: InputDecoration(
                    labelText:"Email",
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color:Colors.blue,width: 1),
                      ), 
                      disabledBorder: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue)
                         ),
                    ),
                  ),
                ),
            ),
            Padding(
              padding:EdgeInsets.only(top :20 ,left:30, right:30) ,
              child: RaisedButton(
                onPressed: (){
                  if(_formKey.currentState.validate()){
                   FirebaseAuth.instance.sendPasswordResetEmail(email : email).then((value) => print("Check your email"));
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                   ),
                   color: Colors.blue,
                   child: Text("Send Email",style: TextStyle(color: Colors.blue,
                    fontWeight: FontWeight.bold,fontSize: 20),
                   ),
                   padding: EdgeInsets.all(10),
              ),
              )
          ],

    
        ),
        ),
        ),
      ),
    );'*/
