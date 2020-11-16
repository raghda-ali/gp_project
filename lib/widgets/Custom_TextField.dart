import 'package:flutter/material.dart';

import '../constance.dart';
class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  CustomTextField({@required this.icon,@required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
        
      child: TextField (
        cursorColor: KMainColor,
        decoration:InputDecoration(
          hintText: hint,
          prefixIcon: Icon(
           icon,
            color: KMainColor,
          ),
          filled: true,
          fillColor: KSocondaryColor,           
           enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white
            )
          ),
           focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white
            )
          )
          ) ,
          ),
    );
  }
}