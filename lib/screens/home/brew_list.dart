import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_brew_crew/models/brew.dart';
import 'package:provider/provider.dart';

import 'brew_tile.dart';

class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>?>(context);
    if (brews != null) {
      brews.forEach((brew) {
        print(brew.name);
        print(brew.strength);
        print(brew.sugars);
      });
    }
    return ListView.builder(
      itemCount: brews?.length ?? 0,
      itemBuilder: (context, index) {
        if (brews?[index] != null) {
          return BrewTile(brew: brews![index]);
        } else {
          // Return an alternative widget or an empty container
          return Container(); // For example
        }
      },
    );
  }
}
