import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class User {
    String uuid;
    String email;
    String firstname;
    String lastname;
}

class AuthenticationService {
    bool loggedIn = false;

    Future<bool> signIn(String email, String password) async {
        String url = "http://10.1.1.142:4000/api/auth/login";
        http.Response response = await http.post(url, body:{ "email": email, "password": password });
        if (json.decode(response.body)["token"] != null) {
            await storeJWT(json.decode(response.body)["token"]);
        }
        if (response.statusCode == HttpStatus.ok) {
            loggedIn = true;
            return true;
        }
        return false;
    }

    Future<bool> signedIn() async {
        if (!loggedIn) {
            final storage = FlutterSecureStorage();
            var jwt = await storage.read(key: "jwt");
            return false;
        } else {
            return true;
        }
    }

    Future<void> signOut() async {
        final storage = FlutterSecureStorage();
        await storage.delete(key: "jwt");
    }

    Future<void> storeJWT(String token) async {
        final storage = FlutterSecureStorage();
        await storage.write(key: "jwt", value: token);
    }

    Future<String> getCurrentUser() {

    }
}