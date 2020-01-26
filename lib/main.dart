import 'dart:async';

import 'package:flutter/material.dart';

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
                primaryColor: Colors.lightBlue[800],
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
    // TODO - This is really messily done, redo later

    int _selectedIndex = 0;
    static const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

    List<Widget> _widgetOptions = <Widget>[
        HomePage(),
        FeedPage(),
        ActivityPage(),
        MapPage(),
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
                title: const Text("STA App"),
            ),
            body: Center(
                child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        title: Text('Home'),
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.blur_on),
                        title: Text('Feed'),
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.check),
                        title: Text('Activities'),
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.map),
                        title: Text('Map'),
                    ),
                ],
                fixedColor: Colors.amber[800],
                currentIndex: _selectedIndex,
                unselectedItemColor: Colors.black,
                showUnselectedLabels: true,
                onTap: _onItemTapped,
            ),
        );
 
    }
}
