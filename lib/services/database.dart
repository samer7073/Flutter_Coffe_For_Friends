import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_brew_crew/models/brew.dart';
import 'package:flutter_application_brew_crew/services/auth.dart';

class DataBaseService {
  final String uid;
  DataBaseService({required this.uid});
  final brew = FirebaseFirestore.instance.collection("brews");
  Future upadteUserAndData(String sugars, String name, int strength) async {
    return await brew
        .doc(uid)
        .set({'sugars': sugars, 'name': name, "strength": strength});
  }

List<Brew>? _brewListFromSnapshot(QuerySnapshot snapshot) {
  return snapshot.docs.map((doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Brew(
      name: data['name'] ?? '',
      sugars: data['sugars'] ?? '0',
      strength: data['strength'] ?? 0,
    );
  }).toList();
}


  Stream<List<Brew>?> get brews {
    return brew.snapshots().map((_brewListFromSnapshot));
  }
}
