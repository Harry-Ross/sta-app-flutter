import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sta_app/models/leaderboard_data.dart';
import 'package:sta_app/screens/leaderboard/leaderboard_item.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
    @override
    _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
    List<String> _deviceData = [];

    _HomePageState() {
        getDeviceDetails().then((val) => setState(() {
            _deviceData = val;
        }));
    }

    final Map data = {'teams': [{ 'team': 'Team 1', 'names': 'person x, person y, person z', 'points': 1050 }, { 'team': 'Team 2', 'names': 'person x, person y, person z', 'points': 730 }, { 'team': 'Team 3', 'names': 'person x, person y, person z', 'points': 670 }]};

    Widget build(BuildContext context) {
        return new Scaffold (
            body: ListView(
                children: <Widget>[
                    Card(
                        child: Column(
                            children: <Widget>[
                                Container(
                                    padding: const EdgeInsets.all(10),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        "Endpoint", 
                                        style: TextStyle( fontWeight: FontWeight.bold, fontSize: 25,)
                                    ),
                                ),
                                Container(
                                    padding: const EdgeInsets.all(10),
                                    //alignment: Alignment.centerLeft,
                                    child: RichText(
                                        text: TextSpan(
                                            style: new TextStyle(
                                                fontSize: 15,
                                                color: Colors.black
                                            ),
                                            children: <TextSpan>[
                                                TextSpan(text: " 16:30", style: TextStyle(fontWeight: FontWeight.bold)),
                                                TextSpan(text: " at"),
                                                TextSpan(text: " Manly Wharf", style: TextStyle(fontWeight: FontWeight.bold))
                                            ]
                                        ),
                                    )
                                ),
                                Container(
                                    padding: const EdgeInsets.all(10),
                                    height: 150,
                                    child: GoogleMap(
                                        initialCameraPosition: CameraPosition(
                                            target: LatLng(-33.782583, 151.239167),
                                            zoom: 11.0,
                                        ),
                                    )
                                )
                            ],
                        )
                    ),
                    Card(
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
                                    height: 180
                                ),
                                GestureDetector(
                                    onTap: () { },
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
                    ),
                    Card(
                        child: Column(
                            children: <Widget>[
                                Container(
                                    padding: const EdgeInsets.all(10),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        "Rules", 
                                        style: TextStyle( fontWeight: FontWeight.bold, fontSize: 25,)
                                    ),
                                ),
                                Container(
                                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                        children: <Widget>[
                                            Container(padding: const EdgeInsets.all(3), child: Text( "0. Don't learn to code")),
                                            Container(padding: const EdgeInsets.all(3), child: Text( "1. Don't learn to code")),
                                            Container(padding: const EdgeInsets.all(3), child: Text( "2. Don't learn to code")),
                                            Container(padding: const EdgeInsets.all(3), child: Text( "3. Don't learn to code")),
                                            Container(padding: const EdgeInsets.all(3), child: Text( "4. Don't learn to code")),
                                            Container(padding: const EdgeInsets.all(3), child: Text( "5. Don't learn to code")),
                                            Container(padding: const EdgeInsets.all(3), child: Text( "6. Don't learn to code")),
                                        ],
                                    )
                                        
                                )
                            ],
                        )
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

    static Future<List<String>> getDeviceDetails() async {
        String deviceName;
        String deviceVersion;
        String identifier; 
        final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();

        try {
            if (Platform.isAndroid) {
                var build = await deviceInfoPlugin.androidInfo;
                deviceName = build.model;
                deviceVersion = build.version.toString();
                identifier = build.androidId;
            } else if (Platform.isIOS) {
                var data = await deviceInfoPlugin.iosInfo;
                deviceName = data.name;
                deviceVersion = data.systemVersion;
                identifier = data.identifierForVendor;
            }
        } on PlatformException {
            print("failure time");
        }

        return [deviceName, deviceVersion, identifier];
 
    }
}
