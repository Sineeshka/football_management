import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sample/pages/main/navbar/profile/list.dart';
import 'package:sample/services/posts.dart';
import 'package:sample/services/tournament.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //PostService _postService = PostService();
  TournamentService _tournamentService = TournamentService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: _tournamentService.getTournamentsByUser(FirebaseAuth.instance.currentUser!.uid),
      initialData: null,
      child: Container(
        child: Listtournament(),
      ),
    );
  }
}