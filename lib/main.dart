import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sta_app/base_page.dart';
import 'package:sta_app/models/authentication_state.dart';
import 'package:sta_app/screens/signin/sign_in_page.dart';

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
                textTheme: GoogleFonts.interTextTheme(
                    Theme.of(context).textTheme
                )
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
    final StreamController<AuthenticationState> _streamController = new StreamController<AuthenticationState>();

    Widget buildUi(BuildContext context, AuthenticationState s) {
        if (s.authenticated) {
            return BasePage(_streamController);
        } else {
            return SignInPage(_streamController);
        }
    }

    @override
    Widget build(BuildContext context) {
        return new StreamBuilder<AuthenticationState>(
            stream: _streamController.stream,
            initialData: new AuthenticationState.initial(),
            builder: (BuildContext context, AsyncSnapshot<AuthenticationState> snapshot) {
                final state = snapshot.data;
                return buildUi(context, state);
            }
        );
    }
}
