import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sta_app/models/leaderboard_data.dart';
import 'package:sta_app/screens/leaderboard/leaderboard_item.dart';


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
            body: Column(
                children: <Widget>[
                    Container(
                        padding: const EdgeInsets.all(10),
                        //alignment: Alignment.centerLeft,
                        child: Text(
                            _deviceData == [] ? "yeet" : _deviceData[1], 
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
