import 'package:application/Calendar.dart';
import 'package:application/Login_Page.dart';
import 'package:application/next.dart';
import 'package:flutter/material.dart';

import 'Sign_up.dart';
import 'Splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //theme: ThemeData(),
      home: Splash(),
    );
  }
}
