import 'package:cloud_firestore/cloud_firestore.dart';

class TournamentModel {
  final String primary;
  final String createBy;
  final String description;
  final String location;
  final Timestamp datetime;
  final String name;
  final String participants;
  final String image;
  DocumentReference ref;

  // int ?likesCount;
  // int ?retweetsCount;

  TournamentModel(
      { required this.primary,
      required this.createBy,
      required this.description,
      required this.location,
      required this.datetime,
      required this.name,
      required this.participants,
      required this.image,
      required this.ref});
}