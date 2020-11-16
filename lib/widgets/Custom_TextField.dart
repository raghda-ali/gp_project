import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constance.dart';
class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  String _errorMassage(String str)
  {
    switch(hint)
    {
      case 'Enter your name' : return'Name is empty !';
      case'Enter your phone': return'Phone is empty !';
      case'Enter your address': return'Address is empty !';
      case'Enter your email': return'Email is empty !';
      case'Enter your password': return'Password is empty !';
    }
  }
  CustomTextField({@required this.icon,@required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
        
      child: TextFormField (
        validator: (value)
        {
          if(value.isEmpty)
          {
            return _errorMassage(hint);
          // ignore: missing_return
          }
        },
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
          ),
           border:  OutlineInputBorder(
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