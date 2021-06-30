import 'package:flutter/material.dart';

import '../constance.dart';

import 'package:gp_project/routes/chatpage.dart';



class chating extends StatelessWidget {
  static String id='chating';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mainBgColor,

      body: ChatPage(),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: KMainColor,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text("Chats"),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text("Profile"),
          ),
        ],
      ),
    );
  }
}