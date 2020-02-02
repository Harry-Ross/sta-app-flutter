import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
    @override
    _ActivityPageState createState() => new _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {

    final List<String> entries = <String>['Person 1', 'Person 2', 'Person 3'];

    Widget build(BuildContext context) {
        return new Scaffold (
            body: Text("hello"),
        );
    }
}
