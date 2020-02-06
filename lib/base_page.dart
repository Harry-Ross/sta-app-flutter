import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sta_app/models/authentication_state.dart';
import 'package:sta_app/screens/activities/activities_page.dart';
import 'package:sta_app/screens/feed/feed_page.dart';
import 'package:sta_app/screens/home/home_page.dart';
import 'package:sta_app/screens/map/map_page.dart';
import 'package:sta_app/screens/upload/upload_page.dart';


class BasePage extends StatefulWidget {
    final StreamController<AuthenticationState> _streamController;

    const BasePage(this._streamController);

    signOut() {
        _streamController.add(AuthenticationState.signedOut());
    }

    @override
    _BasePageState createState() => new _BasePageState();
}

class _BasePageState extends State<BasePage> {
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
                centerTitle: true,
                title: const Text("Logo here"),
            ),
            body: Container(
                child: _widgetOptions.elementAt(_selectedIndex),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
                onPressed: () { },
                tooltip: 'Increment',
                child: Icon(Icons.add),
                elevation: 5.0,
                backgroundColor: Theme.of(context).primaryColor,
            ),
            bottomNavigationBar: BottomAppBar(
                shape: CircularNotchedRectangle(),
                notchMargin: 10,
                child: Container(
                    //height: 75,
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                            IconButton(
                                color: _selectedIndex == 0 ? Colors.blue[800] : Colors.black,
                                iconSize: 30.0,
                                padding: EdgeInsets.all(14.0),
                                icon: Icon(Icons.home),
                                onPressed: () {
                                    setState(() {
                                        _selectedIndex = 0;
                                    });
                                },
                            ),
                            IconButton(
                                color: _selectedIndex == 1 ? Colors.blue[800] : Colors.black,
                                iconSize: 30.0,
                                padding: EdgeInsets.only(right: 50.0),
                                icon: Icon(Icons.blur_on),
                                onPressed: () {
                                    setState(() {
                                        _selectedIndex = 1;
                                    });
                                },
                            ),
                            IconButton(
                                color: _selectedIndex == 2 ? Colors.blue[800] : Colors.black,
                                iconSize: 30.0,
                                padding: EdgeInsets.only(left: 50.0),
                                icon: Icon(Icons.check),
                                onPressed: () {
                                    setState(() {
                                        _selectedIndex = 2;
                                    });
                                },
                            ),
                            IconButton(
                                color: _selectedIndex == 3 ? Colors.blue[800] : Colors.black,
                                iconSize: 30.0,
                                padding: EdgeInsets.all(14.0),
                                icon: Icon(Icons.map),
                                onPressed: () {
                                    setState(() {
                                        _selectedIndex = 3;
                                    });
                                },
                            ),
                        ],
                    ),
                )
            )
        );
    }
}
