import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
    @override
    _BottomNavState createState() => new _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

    final List<String> entries = <String>['Person 1', 'Person 2', 'Person 3'];

    Widget build(BuildContext context) {
        return new Scaffold (
            body: Text("hello"),
        );
    }
}
