import 'package:flutter/material.dart';

class LeaderboardPage extends StatefulWidget {
    @override
    _LeaderboardPageState createState() => new _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {

    final List<String> entries = <String>['Person 1', 'Person 2', 'Person 3'];

    Widget build(BuildContext context) {
        return new Scaffold (
            body: Text("hello"),
        );
    }

    
}
