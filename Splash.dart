import 'dart:async';

import 'package:application/Login_Page.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login_Page())));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Text('hi'),
              // //Icon(Icons.abc),
              // Image.asset(
              //   'img.jpg',
              //   height: 100,
              //   width: 100,
              //   color: Colors.red,
              // ),
              Image.network(
                  'https://media-exp1.licdn.com/dms/image/C510BAQHxdCJkU8agzA/company-logo_200_200/0/1533294459678?e=1668643200&v=beta&t=kDGHkiWzmPJz2gCy-LM_tu2uozmJ5S9uWEB1eGJyVkI',
                  height: 400,
                  width: 250),
              Text(
                "Application",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              )
              // Image.network(
              //     'https://www.facebook.com/PrimeMinds/photos/a.100639061705674/117589043344009'),
            ],
          ),
        ),
      ),
    );
  }
}
