import 'package:flutter/material.dart';
import 'package:sta_app/models/leaderboard_data.dart';


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
                        return _listItem(leaderboardData.team, leaderboardData.names, leaderboardData.points);
                    },
                );
            }
        );
    }

    Widget _listItem(String team, String names, int points) {
        return new Container(
            padding: const EdgeInsets.all(8),
            child: Row(
                children: <Widget>[
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                                Container(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Text(
                                        team,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                        )
                                    )
                                ),
                                Text(
                                    names,
                                    style: TextStyle(
                                        color: Colors.grey[500],
                                    )
                                ),
                            ],
                        )
                    ),
                    Icon(
                        Icons.star,
                        color: Colors.red[500],
                    ),
                    Text(points.toString()),

                ],
            )
        );
    }
}
