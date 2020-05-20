import 'package:sta_app/models/post_data.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class FeedService {
    static Future<PostData> getPosts() async {
        final storage = FlutterSecureStorage();
        String token = await storage.read(key: "jwt");

        http.Response serverResponse = await http.get("http://10.1.1.3:4000/api/posts", 
            headers: {"token": token}
        );
        var jsonString = serverResponse.body;
        
        try {
            List<dynamic> postMap = jsonDecode(jsonString)["posts"];

            var postData = PostData.fromJson(postMap);
            
            return postData;
        } catch(e) {
            print(e);
            return null;
        }
    }
}