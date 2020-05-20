import 'package:flutter/material.dart';
import 'package:sta_app/models/activity_data.dart';
import 'package:sta_app/screens/activities/widgets/category_selector.dart';
import 'package:sta_app/services/activities_service.dart';

class ActivityPage extends StatefulWidget {
    @override
    _ActivityPageState createState() => new _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {

    List<bool> checkboxesSelected = [];
    
    Widget build(BuildContext context) {
        return new Scaffold (
            body: FutureBuilder<ActivityData>(
                future: ActivitiesService.getActivities(),
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
