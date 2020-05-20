import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sta_app/models/authentication_state.dart';
import 'package:sta_app/services/authentication_service.dart';

class SignInPage extends StatelessWidget {
    final StreamController<AuthenticationState> _streamController;
    AuthenticationService _authenticationService = new AuthenticationService();

    SignInPage(this._streamController);

    signIn() async {
        _streamController.add(AuthenticationState.authenticated());
        var result = await _authenticationService.authenticate("hazross@hotmail.com", "password");

        if (result) {
            _streamController.add(AuthenticationState.authenticated());
        }
        else {
            _streamController.add(AuthenticationState.failed());
        }
    }

    initState() {
        //signIn();
    }

    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: Text('Sign in')),
            body: Center(child: Container(
                height: 252,
                width: 250,
                child: Card(
                    child: Form(
                        child: Column(
                            children: <Widget>[
                                FlutterLogo(size: 100),
                                Container(
                                    width: 150,
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Username",
                                        ),
                                    ),
                                ),
                                Container(
                                    width: 150,
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Password",
                                        ),
                                        obscureText: true,
                                    ),
                                ),
                                RaisedButton(
                                    child: Text('Sign in'),
                                    onPressed: signIn,
                                )
                            ]
                        )
                    )
                )
            ))
        );
    }
}