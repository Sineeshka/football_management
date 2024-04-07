import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample/models/Team.dart';

class TeamService {
  
  List<TeamModel> _TeamListFromSnapshot(QuerySnapshot snapshot) {
  return snapshot.docs.map((DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
    return TeamModel(
      primary: data['primary'],
      createBy: data['createBy'],
      description: data['description'],
      location: data['location'] ?? 0,
      datetime: data['datetime'] ?? 0,
      name: data['name'] ?? 0,
      participants: data['participants'] ?? false,
      image: data['image'] ?? null,
      ref: doc.reference, 
      //location: data['location'],
    );
  }).toList();
}
}