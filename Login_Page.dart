import 'package:application/Calendar.dart';
import 'package:application/Sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'dart:convert';

import 'Splash.dart';

// import 'Food.dart';

class Login_Page extends StatefulWidget {
  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  var username = TextEditingController();
  var password = TextEditingController();
  String _username = '';
  String _password = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _ScaffoldKey = GlobalKey<ScaffoldState>();

  //final _formKey = GlobalKey<FormState>();
  final _storage = const FlutterSecureStorage();
  final TextEditingController _usernameController =
      TextEditingController(text: "");

  final TextEditingController _passwordController =
      TextEditingController(text: "");

  bool passwordHidden = true;
  bool _savepassword = true;

  Future<void> _readFromStorage() async {
    _usernameController.text = await _storage.read(key: "KEY_USERNAME") ?? '';
    _passwordController.text = await _storage.read(key: "KEY_USERNAME") ?? '';
  }

  _onFormSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (_savepassword) {
        await _storage.write(
            key: "KEY_USERNAME", value: _usernameController.text);
        await _storage.write(
            key: "KEY_PASSWORD", value: _passwordController.text);

        _LogIn();
        Navigator.push(
          this.context,
          MaterialPageRoute(builder: (context) => CalendarApp()),
        );
      }
    }
  }

  void _LogIn() {
    final bool? isvalid = _formKey.currentState?.validate();
    if (isvalid == true) {
      debugPrint('Ev');
      debugPrint(_username);
      debugPrint(_password);
    }
  }

  @override
  void initState() {
    super.initState();
    _readFromStorage();
  }

  @override
  Widget build(BuildContext context) {
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

          // Image.asset('assets/primeMinds Logo.png'),
          // Icon(
          //   Icons.phone_android,
          //   size: 100,
          // ),
          SizedBox(height: 25),
          Text(
            'LOGIN PAGE',
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
                    //height: 20,
                    //width: 800,
                    //alignment: Alignment.centerLeft,
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
                              return 'Enter a valid email!';
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
                    //width: 800,
                    //alignment: Alignment.centerLeft,
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
                          decoration: InputDecoration(labelText: 'Password'),
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
                SizedBox(height: 30),
                CheckboxListTile(
                  value: _savepassword,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _savepassword = newValue!;
                    });
                  },
                  title: const Text(
                    'Remeber Me',
                    textAlign: TextAlign.end,
                  ),
                  activeColor: Colors.black,
                ),
                SizedBox(
                  height: 50,
                ),
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
                    //onPressed: _onFormSubmit,

                    child: Container(
                      width: 200,
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        //color: Colors.green,
                        //borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            //color: Colors.black,
                            ),
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Sign In',
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
                  "Don't have an account ?",
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
                          MaterialPageRoute(builder: (context) => Sign_up()),
                        );
                      },
                      child: Container(
                        width: 200,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                          border: Border.all(
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            'Create Account',
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
            ),
          ),
        ],
      )),
    );
  }
}
