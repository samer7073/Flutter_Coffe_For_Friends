// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_brew_crew/models/usermodel.dart';
import 'package:flutter_application_brew_crew/screens/wrapper.dart';
import 'package:flutter_application_brew_crew/services/auth.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      initialData:
          null, // Set initial data to null or an appropriate default value
      value: AuthService().user,
      catchError: (context, error) {
        print("Error in stream: $error");
        return null; // Provide a fallback value or handle the error gracefully
      },
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
