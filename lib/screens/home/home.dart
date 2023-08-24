import 'package:flutter/material.dart';
import 'package:flutter_application_brew_crew/models/brew.dart';
import 'package:flutter_application_brew_crew/models/usermodel.dart';
import 'package:flutter_application_brew_crew/screens/home/brew_list.dart';
import 'package:flutter_application_brew_crew/screens/home/settings_form.dart';

import '../../services/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_brew_crew/services/database.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    final user = Provider.of<UserModel?>(
        context); // Assuming you have a User object from Firebase Auth

    if (user != null) {
      return StreamProvider<List<Brew>?>.value(
        value: DataBaseService(uid: user.uid).brews, // Pass the user's uid
        initialData: null,

        child: Scaffold(
          // ...
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            backgroundColor: Colors.brown[500],
            title: Text("Brew crew"),
            elevation: 0.0,
            actions: [
              ElevatedButton.icon(
                onPressed: () async {
                  //await _auth.singOut();
                  await _auth.singout();
                },
                icon: Icon(Icons.person),
                label: Text("Logout"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown[500],
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  _showSettingsPanel();
                },
                icon: Icon(Icons.settings),
                label: Text("Settings"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown[500],
                ),
              )
            ],
          ),
          body: BrewList(),
        ),
      );
    } else {
      // Handle the case where user is not logged in
      return Center(
        child: Text("Not logged in"),
      );
    }
  }
}
