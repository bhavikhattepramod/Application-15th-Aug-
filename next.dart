import 'package:application/Calendar.dart';
import 'package:application/Login_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';
import 'Splash.dart';

// import 'Food.dart';

class Next extends StatefulWidget {
  @override
  State<Next> createState() => NextState();
}

class NextState extends State<Next> {
  var username = TextEditingController();
  var password = TextEditingController();
  var confirmpassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/primeMinds.png'),
            // Icon(
            //   Icons.phone_android,
            //   size: 100,
            // ),
            SizedBox(height: 25),
            Text(
              'SIGN_UP PAGE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 50),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          //borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Center(
                            child: TextFormField(
                              controller: username,
                              decoration: InputDecoration(labelText: 'Email'),
                              keyboardType: TextInputType.emailAddress,
                              onFieldSubmitted: (value) {
                                //Validator
                              },
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                  return 'Enter a valid Email!';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          //borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Center(
                            child: TextFormField(
                              controller: password,
                              obscureText: true,
                              decoration:
                                  InputDecoration(labelText: 'Password'),
                              keyboardType: TextInputType.visiblePassword,
                              onFieldSubmitted: (value) {
                                //Validator
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter a valid Password!';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: 30),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       border: Border.all(color: Colors.white),
                    //       //borderRadius: BorderRadius.circular(20),
                    //     ),
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(left: 20.0),
                    //       child: Center(
                    //         child: TextFormField(
                    //           controller: password,
                    //           obscureText: true,
                    //           decoration: InputDecoration(
                    //               labelText: 'Confirm Password'),
                    //           keyboardType: TextInputType.visiblePassword,
                    //           onFieldSubmitted: (value) {
                    //             //Validator
                    //           },
                    //           validator: (value) {
                    //             if (value!.isEmpty) {
                    //               return 'Please re-enter password';
                    //             }
                    //             if (value != confirmpassword.text) {
                    //               return "Password does not match";
                    //             }
                    //             return null;
                    //           },
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: InkWell(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            print("hello");

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CalendarApp()),
                            );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          alignment: Alignment.bottomRight,
                          width: 200,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            //color: Colors.green,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Already have an account",
                    ),
                    SizedBox(height: 10),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: InkWell(
                          onTap: () async {
                            // if (_formKey.currentState!.validate()) {
                            //   print("hello");

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login_Page()),
                            );
                          },
                          child: Container(
                            width: 200,
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              //color: Colors.blue,
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
