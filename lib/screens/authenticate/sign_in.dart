// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_brew_crew/services/auth.dart';
import 'package:flutter_application_brew_crew/shared/loading.dart';

import '../../shared/constants.dart';

class SignIn extends StatefulWidget {
  final Function toggelView;
  const SignIn({super.key, required this.toggelView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = "";
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign In to brew crew "),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              widget.toggelView();
            },
            icon: Icon(Icons.person),
            label: Text("Register"),
            style: ElevatedButton.styleFrom(primary: Colors.brown[400]),
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) => value!.isEmpty ? 'Enter email' : null,
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    decoration: textInputDecoration.copyWith(hintText: "Email"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration:
                        textInputDecoration.copyWith(hintText: "Password"),
                    validator: (value) => value!.length < 6
                        ? 'Enter Password more 6+ carct'
                        : null,
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink[400],
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error = 'COULD NOT SIGN IN WITH CREDENTIALS';
                              loading = false;
                            });
                          }
                        }
                      },
                      child: Text(
                        "sign in ",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  )
                ],
              ))),
    );
  }
}
