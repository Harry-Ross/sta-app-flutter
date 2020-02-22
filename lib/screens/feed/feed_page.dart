import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sta_app/models/post_data.dart';
import 'package:sta_app/screens/feed/feed_item.dart';

import 'package:http/http.dart' as http;

class FeedPage extends StatefulWidget {
    @override
    _FeedPageState createState() => new _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

    Future<PostData> _getPostDataFromJson(String path) async {
        String jsonString = await rootBundle.loadString(path);
        List<dynamic> postMap = jsonDecode(jsonString);

        var postData = PostData.fromJson(postMap);
        print(postData.posts[0].name);
        
        return postData;
    }

    Widget build(BuildContext context) {
        return new Scaffold(
            body: FutureBuilder<PostData>(
                future: _getPostDataFromJson("assets/posts.json"),
                builder: (BuildContext context, AsyncSnapshot<PostData> snap) { 
                    if (snap.hasData) {
                        return _postList(snap.data);
                    }
                    else {
                        return Center(
                            child: CircularProgressIndicator(backgroundColor: Colors.blue[800],),
                        );
                    }
                    
                }
            )
        );
    }

    Widget _postList(PostData data) {
        return new ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
                return FeedItem(
                    data.posts[index].name, 
                    data.posts[index].teamName, 
                    data.posts[index].content, 
                    data.posts[index].images, 
                    data.posts[index].profileImg
                );
            }
        );
    }
}
