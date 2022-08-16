import 'package:application/Login_Page.dart';
import 'package:dob_input_field/dob_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';
import 'next.dart';
import 'Splash.dart';

// import 'Food.dart';

class Sign_up extends StatefulWidget {
  @override
  State<Sign_up> createState() => Sign_upState();
}

class Sign_upState extends State<Sign_up> {
  var username = TextEditingController();
  var password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? gender = "male";
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image.network(
            //     'https://media-exp1.licdn.com/dms/image/C510BAQHxdCJkU8agzA/company-logo_200_200/0/1533294459678?e=1668643200&v=beta&t=kDGHkiWzmPJz2gCy-LM_tu2uozmJ5S9uWEB1eGJyVkI',
            //     height: 400,
            //     width: 250),
            Image.asset('assets/primeMinds.png'),
            // Icon(
            //   Icons.phone_android,
            //   size: 100,
            // ),
            SizedBox(height: 30),
            Text(
              'SIGN_UP PAGE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 10),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        //width: 500,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          //borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextFormField(
                            decoration:
                                InputDecoration(labelText: 'First Name'),
                          ),
                        ),
                      ),
                    ),
                    //),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        //width: 500,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          //borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          //child: Center(

                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Last Name'),
                          ),
                        ),
                      ),
                    ),
                    //),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        //width: 500,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          // borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Center(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.length != 10) {
                                  return 'Phone number should be 10 digits';
                                }
                                return null;
                              },
                              decoration:
                                  InputDecoration(labelText: 'Phonenumber'),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,

                                //to accept number only
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        //width: 500,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          //borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Center(
                            child: DOBInputField(
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                              showLabel: true,
                              showCursor: true,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              fieldLabelText: "DOB",
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(children: [
                        //print("hello");
                        Text(
                          " Gender?",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 20),
                        ),
                        Divider(),
                        // RadioListTile(
                        //   title: Text("Male"),
                        //   value: "male",
                        //   groupValue: gender,
                        //   onChanged: (value) {
                        //     setState(() {
                        //       gender = value.toString();
                        //     });
                        //   },
                        // ),
                        //children: <Widget>[
                        Column(
                          children: [
                            RadioListTile(
                              title: Text("Male"),
                              value: "male",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value.toString();
                                  print(gender);
                                });
                              },
                            ),
                            // ListTile(
                            //   title: const Text('Male'),
                            //   leading: Radio(
                            //       value: "Male",
                            //       groupValue: gender,
                            //       onChanged: (value) {
                            //         setState(() {
                            //           gender = value.toString();
                            //         });
                            //       }),
                            // ),
                            RadioListTile(
                              title: Text("Female"),
                              value: "female",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value.toString();
                                  print(gender);
                                });
                              },
                            ),
                            RadioListTile(
                              title: Text("Other"),
                              value: "other",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value.toString();
                                  print(gender);
                                });
                              },
                            ),
                          ],
                        ),
                      ]),
                    ),
                    SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: InkWell(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            print("hello");

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Next()),
                            );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          alignment: Alignment.bottomRight,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            //color: Colors.green,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              'Next',
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
                    SizedBox(
                      height: 10,
                    ),

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
                          alignment: Alignment.bottomRight,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            //color: Colors.blue,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              'login',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
