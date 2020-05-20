import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthenticationService {
    Future<bool> authenticate(String email, String password) async {
        String url = "http://10.1.1.3:4000/api/auth/login";
        http.Response response = await http.post(url, body:{ "email": email, "password": password });
        if (json.decode(response.body)["token"] != null) {
            await storeJWT(json.decode(response.body)["token"]);
        }
        return response.statusCode == HttpStatus.ok;
    }

    Future<void> storeJWT(String token) async {
        final storage = FlutterSecureStorage();
        await storage.write(key: "jwt", value: token);
    }
}