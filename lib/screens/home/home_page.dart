import 'package:flutter/material.dart';
import 'package:sta_app/models/leaderboard_data.dart';
import 'package:sta_app/screens/leaderboard/leaderboard_item.dart';


class HomePage extends StatefulWidget {
    @override
    _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

    final Map data = {'teams': [{ 'team': 'Team 1', 'names': 'person x, person y, person z', 'points': 1050 }, { 'team': 'Team 2', 'names': 'person x, person y, person z', 'points': 730 }, { 'team': 'Team 3', 'names': 'person x, person y, person z', 'points': 670 }]};

    Widget build(BuildContext context) {
        return new Scaffold (
            body: Column(
                children: <Widget>[
                    Container(
                        padding: const EdgeInsets.all(10),
                        //alignment: Alignment.centerLeft,
                        child: Text(
                            'Leaderboard', 
                            style: TextStyle( fontWeight: FontWeight.bold, fontSize: 35,)
                        ),
                    ),
                    Container(
                        child: _list(),
                        height: 180
                    ),
                    GestureDetector(
                        onTap: () {
                            
                        },
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                                children: <Widget>[
                                    Icon(
                                        Icons.more_horiz,
                                        color: Colors.black,
                                    ),
                                    Text('   More', style: TextStyle(fontSize: 17))
                                ],
                            ),
                        ),
                    )
                    
                ]
            )
        );
    }

    LeaderboardData leaderboardData;

    Widget _list() {
        return new FutureBuilder(
            builder: (context, snapshot) {
                return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: data['teams'].length,
                    itemBuilder: (BuildContext context, int index) {
                        leaderboardData = new LeaderboardData.fromJson(data['teams'][index]);
                        return LeaderboardItem(leaderboardData.team, leaderboardData.names, leaderboardData.points);
                    },
                );
            }
        );
    }
}
