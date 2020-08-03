import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
    @override
    _UploadPageState createState() => new _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {

    final List<String> entries = <String>['Person 1', 'Person 2', 'Person 3'];
    final picker = ImagePicker();

    Widget build(BuildContext context) {
        return new Scaffold (
            body: Column(
                children: <Widget>[
                    TextField(
                        decoration: InputDecoration(
                            hintText: "Title",
                        ),
                    ),
                    TextField(
                        decoration: InputDecoration(
                            hintText: "Body",
                        ),
                    ),
                ],
            ),
        );
    }
}
