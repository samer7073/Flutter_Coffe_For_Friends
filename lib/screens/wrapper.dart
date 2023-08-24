import 'package:flutter/material.dart';
import 'package:flutter_application_brew_crew/models/usermodel.dart';
import 'package:flutter_application_brew_crew/screens/authenticate/authenticate.dart';
import 'package:flutter_application_brew_crew/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    print(user);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
