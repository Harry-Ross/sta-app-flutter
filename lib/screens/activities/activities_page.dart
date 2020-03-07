import 'dart:convert';

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
        String jsonString = await rootBundle.loadString(path);
        List<dynamic> activityMap = jsonDecode(jsonString);

        var activityData = ActivityData.fromJson(activityMap);
        
        return activityData;
    }
    
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
                                    return _activityItem(activities[index]);
                                },
                            )
                        ),
                    )
                    
                ],
            )
        );
    }

    Widget _activityItem (Activity activity) {
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
                                    child: Text(activity.name)
                                ),
                            ),
                            Container(
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.centerRight,
                                child: Text("${activity.points}"),
                            )
                        ],
                    )
                ],
            )
        );
    }
}
