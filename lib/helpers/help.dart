import 'package:flutter/material.dart';

class QuickHelp {

  static goToNavigationScreen(Widget widget, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }



}