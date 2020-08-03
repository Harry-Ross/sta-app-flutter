import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sta_app/models/authentication_state.dart';
import 'package:sta_app/screens/activities/activities_page.dart';
import 'package:sta_app/screens/feed/feed_page.dart';
import 'package:sta_app/screens/home/home_page.dart';
import 'package:sta_app/screens/map/map_page.dart';
import 'package:sta_app/screens/upload/upload_page.dart';
import 'package:sta_app/services/authentication_service.dart';


class BasePage extends StatefulWidget {

    @override
    _BasePageState createState() => new _BasePageState();
}

class _BasePageState extends State<BasePage> {

    int _selectedIndex = 0;
    static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold); 

    List<Widget> _widgetOptions = <Widget>[
        HomePage(),
        FeedPage(),
        UploadPage(),
        ActivityPage(),
        MapPage(),
    ];

    @override
    Widget build(BuildContext context) {

        final provider = Provider.of<AuthenticationService>(context);

        return Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: const Text("L  O  G  O"),
            ),
            body: Container(
                child: _widgetOptions.elementAt(_selectedIndex),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
                onPressed: () { 
                    setState(() {
                        _selectedIndex = 2;
                    });
                },
                tooltip: 'Upload',
                child: Icon(Icons.add),
                elevation: 5.0,
                backgroundColor: Theme.of(context).primaryColor,
            ),
            bottomNavigationBar: BottomAppBar(
                shape: CircularNotchedRectangle(),
                notchMargin: 10,
                child: Container(
                    height: 55,
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                            _navButton(Icon(Icons.home), 0),
                            _navButton(Icon(Icons.blur_on), 1),
                            Container(
                                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                            ),
                            _navButton(Icon(Icons.check), 3),
                            _navButton(Icon(Icons.map), 4)
                        ],
                    ),
                )
            )
        );
    }

    Widget _navButton(Icon icon, int index) {
        return new Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: IconButton(
                color: _selectedIndex == index ? Theme.of(context).primaryColor : Colors.black,
                iconSize: 30.0,
                icon: icon,
                onPressed: () {
                    setState(() {
                        _selectedIndex = index;
                    });
                },
            ),
        );
    }
}
