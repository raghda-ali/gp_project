import 'package:flutter/material.dart';
class ForgetPassword extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title:Text("Home"),
        backgroundColor: Colors.red[200],
      ),
      body: Column(children:<Widget> [
        SizedBox(height: 150,),
        Center(child: Text("Please, provide your account email to procced password restoring",
        style: TextStyle(fontSize: 20,
        color: Colors.black.withOpacity(0.6),
        fontWeight: FontWeight.bold,
        
        ),
        textAlign: TextAlign.center,
        ),
        ),
        SizedBox(height: 30,),
        Container(
          width: 320,
          child: TextField(
           obscureText: true,
           decoration: InputDecoration(
             hintText: "Type in your email",
             prefixIcon: Icon(Icons.email),
             hintStyle: TextStyle(color: Colors.grey),
             filled:true,
             fillColor: Colors.white38,
             enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.red[200],width: 2),
             ),
             focusedBorder: OutlineInputBorder(
               borderRadius: BorderRadius.all(Radius.circular(30.0)),
               borderSide: BorderSide(color: Colors.red[200],width: 2),
             ),
           ),
          ),
        ),
        Divider(
          color: Colors.red[200] ,
          height: 20,
          thickness: 2,
          indent: 50,
          endIndent:50,
          ),
          RaisedButton(
            child: Text("Reset"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
              color: Colors.red[200],
              textColor: Colors.white,
            onPressed: () => print("Send"),
          ),
        
      ],
      ),
    );
  }
}