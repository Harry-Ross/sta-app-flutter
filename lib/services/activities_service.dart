import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sta_app/models/activity_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ActivitiesService {
    static Future<ActivityData> getActivities() async {
        final storage = FlutterSecureStorage();
        String token = await storage.read(key: "jwt");

        http.Response serverResponse = await http.get("http://10.1.1.3:4000/api/games/game_id_here/activities", 
            headers: {"token": token}
        );

        String jsonString = serverResponse.body;

        List<dynamic> activityMap = jsonDecode(jsonString)["activities"];

        var activityData = ActivityData.fromJson(activityMap);

        return activityData;
    }
}