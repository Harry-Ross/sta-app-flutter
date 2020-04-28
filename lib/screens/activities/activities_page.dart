import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sta_app/models/activity_data.dart';
import 'package:sta_app/screens/activities/widgets/category_selector.dart';

class ActivityPage extends StatefulWidget {
    @override
    _ActivityPageState createState() => new _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {

    Future<ActivityData> _getPostDataFromJson(String path) async {
        http.Response serverResponse = await http.get("http://10.1.1.3:3000/api/posts");
        String jsonString = serverResponse.body;

        List<dynamic> activityMap = jsonDecode(jsonString);

        var activityData = ActivityData.fromJson(activityMap);

        return activityData;
    }

    List<bool> checkboxesSelected = [];
    
    Widget build(BuildContext context) {
        return new Scaffold (
            body: FutureBuilder<ActivityData>(
                future: _getPostDataFromJson('assets/activities.json'),
                builder: (BuildContext context, AsyncSnapshot<ActivityData> snap) {
                    if (snap.hasData) {
                        return _activityList(snap.data.activities);
                    }
                    else {
                        return Center(
                            child: CircularProgressIndicator(backgroundColor: Colors.blue[800],),
                        );
                    }
                },
            )
        );
    }

    Widget _activityList (List<Activity> activities) {
        return Center(
            child: Column(
                children: <Widget>[
                    CategorySelector(),
                    Expanded(
                        child: Container(
                            child: ListView.builder(
                                itemCount: activities.length,
                                itemBuilder: (BuildContext context, int index) {
                                    checkboxesSelected.add(activities[index].completed);
                                    return _activityItem(activities[index], index);
                                },
                            )
                        ),
                    )
                    
                ],
            )
        );
    }

    Widget _activityItem (Activity activity, int index) {
        return ExpansionTile(
            leading: Checkbox(
                value: checkboxesSelected[index], 
                onChanged: (bool value) {
                    setState(() {
                        checkboxesSelected[index] = value;
                    });
                },
            ),
            title: Text(
                activity.name, 
                style: TextStyle(fontSize: 18)
            ),
            subtitle: Text(
                "${activity.points}", 
                style: TextStyle(fontWeight: FontWeight.bold)
            ),
            children: <Widget>[
                Align(
                    child: Text(
                        activity.description, 
                        style: TextStyle(), 
                        textAlign: TextAlign.left
                    ),
                    alignment: Alignment.topLeft,
                )
            ],
        );
        // return InkWell(
        //     onTap: () { },
        //     child: Column(
        //         children: <Widget>[
        //             Divider(),
        //             Row(
        //                 children: <Widget>[
        //                     Expanded(
        //                         child: Container(
        //                             padding: EdgeInsets.all(10),
        //                             alignment: Alignment.centerLeft,
        //                             height: 36,
        //                             child: Text(activity.name)
        //                         ),
        //                     ),
        //                     Container(
        //                         padding: EdgeInsets.all(10),
        //                         alignment: Alignment.centerRight,
        //                         child: Text("${activity.points}"),
        //                     )
        //                 ],
        //             )
        //         ],
        //     )
        // );
    }
}
