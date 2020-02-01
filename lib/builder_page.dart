import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sta_app/base_page.dart';
import 'package:sta_app/models/authentication_state.dart';
import 'package:sta_app/screens/signin/sign_in_page.dart';

class BuilderPage extends StatelessWidget {
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