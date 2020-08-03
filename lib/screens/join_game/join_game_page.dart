import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sta_app/models/authentication_state.dart';


import 'package:sta_app/base_page.dart';

class JoinGamePage extends StatefulWidget {
    @override
    _JoinGamePageState createState() => new _JoinGamePageState();
}

class _JoinGamePageState extends State<JoinGamePage> {

    Widget _currentElement;

    initState() {
        _currentElement = _joinGameWidget();
    }

    Widget build(BuildContext context) {
        return new Scaffold (
            body: _currentElement
        );
    }

    Widget _joinGameWidget() {
        return new Center(
            child: Column(
                children: <Widget>[
                    TextField(
                        decoration: InputDecoration(
                            hintText: "Game code"
                        ),
                    ),
                    RaisedButton(
                        child: Text("JOIN GAME"),
                        onPressed: (() => {

                        }),
                    )
                ],
            )
        );
    }
}
