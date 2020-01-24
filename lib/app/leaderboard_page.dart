import 'package:flutter/material.dart';

class LeaderboardPage extends StatefulWidget {
    @override
    _LeaderboardPageState createState() => new _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
    Widget build(BuildContext context) {
        return new Scaffold (
            body: Text('Leaderboard Here', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        );
    }
}
