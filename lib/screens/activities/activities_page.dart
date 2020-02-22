import 'package:flutter/material.dart';
import 'package:sta_app/screens/activities/widgets/category_selector.dart';

class ActivityPage extends StatefulWidget {
    @override
    _ActivityPageState createState() => new _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
    
    Widget build(BuildContext context) {
        return new Scaffold (
            body: Center(
                child: Column(
                    children: <Widget>[
                        CategorySelector(),
                        Expanded(
                            child: Container(
                                child: ListView.builder(
                                    itemCount: 30,
                                    itemBuilder: (BuildContext context, int index) {
                                        return _activityItem("Redwood Station");
                                    },
                                )
                            ),
                        )
                        
                    ],
                )
            )
        );
    }

    Widget _activityItem (String label) {
        return InkWell(
            onTap: () { },
            child: Column(
                children: <Widget>[
                    Divider(),
                    Row(
                        children: <Widget>[
                            Expanded(
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    alignment: Alignment.centerLeft,
                                    height: 36,
                                    child: Text(label)
                                ),
                            ),
                            Container(
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.centerRight,
                                child: Text("250"),
                            )
                        ],
                    )
                ],
            )
        );
    }
}
