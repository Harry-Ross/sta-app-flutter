import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
    @override
    _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

    final data = [{ 'team': 'Team 1', 'names': 'person x, person y, person z', 'points': '1050' }, { 'team': 'Team 2', 'names': 'person x, person y, person z', 'points': '730' }, { 'team': 'Team 3', 'names': 'person x, person y, person z', 'points': '670' }];

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

    Widget _list() {
        return new ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
                return Container(
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
                                                data[index]['team'],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                )
                                            )
                                        ),
                                        Text(
                                            data[index]['names'],
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
                            Text(data[index]['points']),
 
                        ],
                    )
                );
            },
        );
    }
}
