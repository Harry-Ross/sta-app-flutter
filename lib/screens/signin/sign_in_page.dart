import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sta_app/models/authentication_state.dart';
import 'package:sta_app/services/authentication_service.dart';

class SignInPage extends StatelessWidget {
    final StreamController<AuthenticationState> _streamController;
    final AuthenticationService _authenticationService = new AuthenticationService();

    SignInPage(this._streamController);

    signIn() async {
        _streamController.add(AuthenticationState.authenticated());
        var result = await _authenticationService.authenticate("username", "password");

        if (result) {
            _streamController.add(AuthenticationState.authenticated());
        }
        else {
            _streamController.add(AuthenticationState.failed());
        }
    }

    initState() {
        signIn();
    }

    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: Text('Sign in')),
            body: Center(
                child: Form(
                    child: Column(
                        children: <Widget>[
                            TextFormField(

                            ),
                            TextFormField(
                                
                            ),
                            RaisedButton(
                                child: Text('Sign in'),
                                onPressed: signIn,
                            )
                        ]
                    )
                )
            )
        );
    }
}