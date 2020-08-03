import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sta_app/services/authentication_service.dart';

class SignInPage extends StatelessWidget {

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
                                    onPressed: (() => {
                                        Provider.of<AuthenticationService>(context).signIn("hazross@hotmail.com", "password").then((val) => {
                                            // error handling here based on value of val boolean
                                        })
                                    }),
                                )
                            ]
                        )
                    )
                )
            ))
        );
    }
}