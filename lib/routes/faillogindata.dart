import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Faildata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Scaffold(
      backgroundColor: Colors.pink.shade100,
       body: Container(
         //height: MediaQuery.of(context).size.height*.4,
             child: Center(
               child: Stack(
               //  alignment: Alignment.center,
               children: <Widget>[
               Icon(Icons.done_all,
                 color: Colors.white,
                   size: 210,
               ),
                 Positioned(
                   bottom: 0,
                 child: Text('Incorrect Input Data',
                     style: TextStyle(
                     fontSize: 24,
                      color: Colors.white)
               ),
                 )
                 ],
                 ),
             )
    ),
             )

       );

  }
}
