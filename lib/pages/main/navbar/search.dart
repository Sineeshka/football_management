import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
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
  TextStyle mine = GoogleFonts.epilogue(
                fontSize: 16, fontWeight: FontWeight.normal, color: Color.fromARGB(255,101,75,78),);

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
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255,101,75,78),
        title: Card(
          child: TextField(
            decoration: InputDecoration(
              labelStyle: mine,
              hintStyle: mine,
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
          return Column(
            children: [
              SizedBox(
                height: 6,
              ),
              GestureDetector(
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
                child: Container(
                  height: 50,
                  width: screenSize.width-20,
                  child: Center(
                    child: Text(searchResults[index]['name'],
                    style: GoogleFonts.epilogue(
                      fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255,230, 220, 221),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color.fromARGB(255,101,75,78),
                    )
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}