// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_brew_crew/shared/constants.dart';
import 'package:flutter_application_brew_crew/shared/loading.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  String currentName = "";
  String? currentSuger = "0";

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              "Updatebyour brew settings",
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) => value!.isEmpty ? 'Enter Name' : null,
              onChanged: (value) {
                setState(() {
                  currentName = value;
                });
              },
              decoration: textInputDecoration.copyWith(hintText: "Name"),
            ),
            SizedBox(
              height: 20.0,
            ),
            DropdownButtonFormField(
              value: currentSuger ?? '0',
              decoration: textInputDecoration,
              items: sugars.map((sugar) {
                return DropdownMenuItem(
                  value: sugar,
                  child: Text('$sugar sugars'),
                );
              }).toList(),
              onChanged: (val) => setState(() {
                currentSuger = val;
              }),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[400],
                ),
                onPressed: () {
                  print(currentName);
                  print(currentSuger);
                },
                child: Text(
                  "Update ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
          ],
        ));
  }
}
