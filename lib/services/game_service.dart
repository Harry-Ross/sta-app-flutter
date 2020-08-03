import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GameService {
    Future<bool> authenticate(String entryCode) async {
        String url = "http://10.1.1.3:4000/api/games/join";
        http.Response response = await http.post(url, body:{ "entry_code": entryCode });
        if (json.decode(response.body)["game_id"] != null) {
            await storeGameID(json.decode(response.body));
        }
        return response.statusCode == HttpStatus.ok;
    }

    Future<void> storeGameID(Map<String, dynamic> game) async {
        final storage = FlutterSecureStorage();
        await storage.write(key: "game", value: game.toString());
    }
}