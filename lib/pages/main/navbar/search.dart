import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample/pages/pageForTeam.dart';
import 'package:sample/pages/pageForTournament.dart';
import 'package:sample/pages/playerProfile.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String name = '';

  final _searchController = TextEditingController();
  List<Map> searchResults = [];

  @override
  void dispose() {
    _searchController
        .dispose(); // Dispose of the controller to avoid memory leaks
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void getTeamsAndPlayers(String searchText) async {
    List<Map> teams = [];
    List<Map> players = [];
    List<Map> tournaments = [];

    await FirebaseFirestore.instance
        .collection('Teams')
        .where('name'.toLowerCase(), isEqualTo: searchText.toLowerCase())
        .get()
        .then((teamSnapshot) {
      for (var team in teamSnapshot.docs) {
        teams.add(team.data());
      }
    });

    await FirebaseFirestore.instance
        .collection('events')
        .where('name'.toLowerCase(), isEqualTo: searchText.toLowerCase())
        .get()
        .then((tournamentSnapshot) {
      for (var tournament in tournamentSnapshot.docs) {
        tournaments.add(tournament.data());
      }
    });

    await FirebaseFirestore.instance
        .collection('users')
        .where('name'.toLowerCase(), isEqualTo: searchText.toLowerCase())
        .get()
        .then((playerSnapshot) {
      for (var player in playerSnapshot.docs) {
        players.add(player.data());
      }
    });

    List<Map> combined = [...teams, ...players, ...tournaments];
    setState(() {
      searchResults = combined;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 105, 181),
        title: Card(
          child: TextField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search'),
            onChanged: (value) {
              getTeamsAndPlayers(value);
            },
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(searchResults[index]['name']),
            onTap: () {
              if (searchResults[index]['type'] == 'player') {
                // Assuming a 'type' field differentiates teams and players
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => playerProfile(
                            searchResults: searchResults, index: index)));
              } else if (searchResults[index]['type'] == 'tournament') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PageTournament(
                            searchResults: searchResults, index: index)));
              } else if (searchResults[index]['type'] == 'team') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PageTeam(
                            searchResults: searchResults, index: index)));
              }
            },
          );
        },
      ),
    );
  }
}