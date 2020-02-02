import 'package:flutter/material.dart';
import 'package:sta_app/models/leaderboard_data.dart';

class LeaderboardItem extends StatelessWidget {
    final String team, names;
    final dynamic points;


    LeaderboardItem(this.team, this.names, this.points);

    Widget build (BuildContext context) {
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
                    Text(points.toString()),
                    Icon(
                        Icons.star,
                        color: Colors.red[500],
                    ),

                ],
            )
        );
    }

}