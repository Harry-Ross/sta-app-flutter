import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/user_data.dart';
import 'package:http/http.dart' as http;


class UserService {
    Future<User> getUser() async {
        final storage = FlutterSecureStorage   ();
        String token = await storage.read(key: "jwt");

        http.Response serverResponse = await http.get("http://10.1.1.3:4000/api/posts", 
            headers: {"token": token}
        );
        var jsonString = serverResponse.body;
        Map<String, String> userMap = jsonDecode(jsonString);
        User user = User.fromJson(userMap);
        return user;
    }
}