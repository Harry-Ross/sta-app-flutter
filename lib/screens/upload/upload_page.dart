import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
    @override
    _UploadPageState createState() => new _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {

    final List<String> entries = <String>['Person 1', 'Person 2', 'Person 3'];

    Widget build(BuildContext context) {
        return new Scaffold (
            body: Text("hello"),
        );
    }
}
