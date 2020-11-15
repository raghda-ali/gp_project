import 'package:flutter/material.dart';

class faildata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Scaffold(
      backgroundColor: Colors.pink.shade100,
       body: SafeArea(
         child: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Icon(Icons.done_all,
               color: Colors.white,
                 size: 100.0,
               ),
               Text('البيانات غير صحيحة',
               style: TextStyle(
               fontSize: 30.0,
               color: Colors.white)
               )
             ],
           ),
         ),
       ),
      )
    );
  }
}
