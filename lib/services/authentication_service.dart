import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthenticationService {
    Future<bool> authenticate(String username, String password) async {
        String url = "https://postman-echo.com/post?username=${username}&password=${password}";
        http.Response response = await http.post(url);
        if (json.decode(response.body)["token"]) {
            storeJWT(json.decode(response.body)["token"]);
        }
        return response.statusCode == HttpStatus.ok;
    }

    void storeJWT(String token) {
        final storage = FlutterSecureStorage();
        storage.write(key: "jwt", value: token);
    }
}