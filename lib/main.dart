import 'dart:async';

import 'package:flutter/material.dart';

import 'app/map_page.dart';
import 'app/leaderboard_page.dart';
import 'app/feed_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: "Haha epic",
            home: MyStatefulWidget(),
        );
    }
}

class MyStatefulWidget extends StatefulWidget {
    MyStatefulWidget({Key key}) : super(key: key);

    @override
    _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}


class _MyStatefulWidgetState extends State<MyStatefulWidget> {
    // TODO -This is really messily done, redo later

    int _selectedIndex = 0;
    static const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

    List<Widget> _widgetOptions = <Widget>[
        MapPage(),
        LeaderboardPage(),
        FeedPage()
    ];

    void _onItemTapped(int index) {
        setState(() {
            _selectedIndex = index;
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text("Gamer time"),
            ),
            body: Center(
                child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Icon(Icons.map),
                        title: Text('Map'),
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.grade),
                        title: Text('Leaderboard'),
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.blur_on),
                        title: Text('Feed'),
                    ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.amber[800],
                onTap: _onItemTapped,
            ),
        );
 
    }
}
