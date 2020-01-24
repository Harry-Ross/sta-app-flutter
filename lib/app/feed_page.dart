import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
    @override
    _FeedPageState createState() => new _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
    Widget build(BuildContext context) {
        return new Scaffold (
            body: Text('Feed Here', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        );
    }
}
