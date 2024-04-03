import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample/models/tournament.dart';

class TournamentService {
  
  List<TournamentModel> _tournamentListFromSnapshot(QuerySnapshot snapshot) {
  return snapshot.docs.map((DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
    return TournamentModel(
      primary: data['id'],
      createBy: data['createBy'],
      description: data['description'],
      location: data['location'] ?? 0,
      datetime: data['datetime'] ?? 0,
      name: data['name'] ?? 0,
      participants: data['participants'] ?? false,
      image: data['image'] ?? null,
      ref: doc.reference,
    );
  }).toList();
}
final CollectionReference events = FirebaseFirestore.instance.collection('events');

  //Uint8List? _image;
  void createtournament(text1,text2,text3,text4,id) {
    // Uint8List img =  pickImage(ImageSource.gallery);
   // setState(() {
    //  _image = img;
   // });

    final data = {'primary':id,'name':text1,'description':text2,'location': text3,'datetime': text4};


    events.add(data);

  }
// Future savetournament(text) async {
//     await FirebaseFirestore.instance.collection("events").add({
//       // 'text': text,
//       'creatorid': FirebaseAuth.instance.currentUser!.uid,
//       // 'timestamp': FieldValue.serverTimestamp(),
//       //'retweet': false
//     });
Stream<List<TournamentModel>> getTournamentsByUser(uid) {
    return FirebaseFirestore.instance
        .collection("events")
        .where('id', isEqualTo: uid)
        .snapshots()
        .map(_tournamentListFromSnapshot);
  }
}