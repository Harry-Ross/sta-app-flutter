import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sta_app/models/authentication_state.dart';
import 'package:sta_app/screens/join_game/join_game_page.dart';
import 'package:sta_app/screens/signin/sign_in_page.dart';
import 'package:sta_app/services/authentication_service.dart';
import 'package:sta_app/services/game_service.dart';

import 'base_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Provider<AuthenticationService>(
            create: (context) => AuthenticationService(), 
            child: Provider<GameService>(
                create: (context) => GameService(),
                child: MaterialApp(
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
                ) ,
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

    @override
    Widget build(BuildContext context) {
        return new Consumer<AuthenticationService>(
            builder: (context, value, child) {
                if (value.loggedIn) {
                    return JoinGamePage();
                } else {
                    return SignInPage();
                }
            },
        );
    }
}
