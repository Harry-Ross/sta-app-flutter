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
        UploadPage(),
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
                    /* TODO https://stackoverflow.com/questions/49299457/how-to-add-button-to-bottom-navigation-bar-which-hang-out-above-flutter 
                        implement this later
                    */
                    BottomNavigationBarItem(
                        icon: Icon(Icons.cloud_upload),
                        title: Text('Upload')
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
                fixedColor: Theme.of(context).primaryColor,
                currentIndex: _selectedIndex,
                unselectedItemColor: Colors.black,
                showUnselectedLabels: true,
                onTap: _onItemTapped,
                type: BottomNavigationBarType.fixed
            ),
        );
    }
}
