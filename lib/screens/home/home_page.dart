import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sta_app/models/leaderboard_data.dart';
import 'package:sta_app/screens/home/widgets/endpoint_card.dart';
import 'package:sta_app/screens/home/widgets/leaderboard_card.dart';
import 'package:sta_app/screens/home/widgets/rules_card.dart';
import 'package:sta_app/screens/leaderboard/leaderboard_item.dart';
import 'package:sta_app/services/authentication_service.dart';


class HomePage extends StatefulWidget {
    @override
    _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
    List<String> _deviceData = [];
    AuthenticationService _authenticationService = new AuthenticationService();

    @override
    void initState() {
        super.initState();
    }


    _HomePageState() {
        getDeviceDetails().then((val) => setState(() {
            _deviceData = val;
        }));
    }

    Widget build(BuildContext context) {
        return new Scaffold (
            body: ListView(
                children: <Widget>[
                    EndpointCard(),
                    LeaderboardCard(),
                    RulesCard(),
                ]
            )
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
