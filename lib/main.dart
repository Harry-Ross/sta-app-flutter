import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sta_app/app/builder_page.dart';

import 'app/home_page.dart';
import 'app/map_page.dart';
import 'app/activities_page.dart';
import 'app/feed_page.dart';

import 'app/leaderboard_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: "STA App",
            home: MyStatefulWidget(),
            theme: ThemeData(
                brightness: Brightness.light,
                primaryColor: Colors.lightBlue[700],
                accentColor: Colors.cyan[600],
            )
        );
    }
}

class MyStatefulWidget extends StatefulWidget {
    MyStatefulWidget({Key key}) : super(key: key);

    @override
    _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}


class _MyStatefulWidgetState extends State<MyStatefulWidget> {
    Widget build(BuildContext context) {
        return new BuilderPage();
    }
}
