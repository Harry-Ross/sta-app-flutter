import 'package:flutter/material.dart';
import 'package:sta_app/models/leaderboard_data.dart';
import 'package:sta_app/screens/leaderboard/leaderboard_item.dart';

class LeaderboardCard extends StatelessWidget {

    final Map data = {'teams': [{ 'team': 'Team 1', 'names': 'person x, person y, person z', 'points': 1050 }, { 'team': 'Team 2', 'names': 'person x, person y, person z', 'points': 730 }, { 'team': 'Team 3', 'names': 'person x, person y, person z', 'points': 670 }]};

    LeaderboardData leaderboardData;

    Widget build(BuildContext context) {
        return Card(
            child: Column(
                children: <Widget>[
                    Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                            "Leaderboard", 
                            style: TextStyle( fontWeight: FontWeight.bold, fontSize: 25,)
                        ),
                    ),
                    Container(
                        child: _list(),
                        height: 190
                    ),
                    InkWell(
                        onTap: () { },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                                children: <Widget>[
                                    Icon(
                                        Icons.more_horiz,
                                        color: Colors.black,
                                    ),
                                    Container(
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                            'More',
                                            style: TextStyle(fontSize: 17)
                                        ),
                                    )
                                ],
                            ),
                        )
                    )
                ]
            )
        );
    }

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