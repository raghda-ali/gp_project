import 'package:gp_project/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Provider extends InheritedWidget {
  auth Auth=auth();
  final db;
  final colors;

  Provider({Key key, Widget child, this.Auth, this.db, this.colors}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static Provider of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<Provider>());
}