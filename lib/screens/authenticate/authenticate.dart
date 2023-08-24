import 'package:flutter/material.dart';
import 'package:flutter_application_brew_crew/screens/authenticate/register.dart';
import 'package:flutter_application_brew_crew/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggelView() {
    setState(() => showSignIn =!showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn==true) {
      return SignIn(toggelView: toggelView);
    } else {
      return Register(toggelView: toggelView);
    }
  }
}
