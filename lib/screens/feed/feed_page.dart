import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sta_app/models/post_data.dart';

import 'package:http/http.dart' as http;
import 'package:sta_app/screens/profile/profile_page.dart';

class FeedPage extends StatefulWidget {
    @override
    _FeedPageState createState() => new _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

    Widget currentWidget;

    void initState() {
        currentWidget = _feed();
        super.initState();
    }

    Future<PostData> _getPostDataFromJson(String path) async {
        final storage = FlutterSecureStorage();
        String token = await storage.read(key: "jwt");

        http.Response serverResponse = await http.get("http://10.1.1.3:4000/api/posts", 
            headers: {"token": token}
        );
        var jsonString = serverResponse.body;
        try {
            List<dynamic> postMap = jsonDecode(jsonString)["posts"];
            print("fuck");

            var postData = PostData.fromJson(postMap);
            print(postData.posts[0].name);
            
            return postData;
        } catch(e) {
            print(e);
        }
        
    }

    Widget build(BuildContext context) {
        return new Scaffold(
            body: currentWidget
        );
    }

    void openProfile() {
        currentWidget = ProfilePage();
    }

    Widget _feed() {
        return new FutureBuilder<PostData>(
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
        );
    }

    Widget _postList(PostData data) {
        return new ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: data.posts.length,
            itemBuilder: (BuildContext context, int index) {
                return _feedItem(
                    data.posts[index].name, 
                    data.posts[index].teamName, 
                    data.posts[index].content, 
                    data.posts[index].images, 
                    data.posts[index].profileImg
                );
            }
        );
    }

    Widget _feedItem(name, teamName, content, images, profileImg) {
        return Card(
            child: Column(
                children: <Widget>[
                    Container(
                        height: 50,
                        color: Colors.grey[300],
                        child: Row (
                            children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: CircleAvatar(
                                        radius: 16,
                                        backgroundImage: NetworkImage(profileImg),
                                    ),
                                ),
                                Expanded(
                                    child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Row(
                                            children: <Widget>[
                                                InkWell(
                                                    onTap: () {
                                                        print("something");
                                                    },
                                                    child: Text(
                                                        name, 
                                                        textAlign: TextAlign.left, 
                                                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)
                                                    ),
                                                ),
                                                Text(
                                                    " - ", 
                                                    textAlign: TextAlign.left, 
                                                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)
                                                ),
                                                InkWell(
                                                    child: Text(
                                                        teamName, 
                                                        textAlign: TextAlign.left, 
                                                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)
                                                    ),
                                                )
                                            ],
                                        )
                                        
                                    )
                                ),
                            ],
                        ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: Align(
                            alignment: Alignment.topLeft, 
                            child: Text(
                                content, 
                                textAlign: TextAlign.left, 
                            )
                        )
                    ),
                    Padding(
                        padding: EdgeInsets.only( top: 0, left: 8, right: 8, bottom: 8),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: images == null ? null : Container(
                                height: 150,
                                child: Image.network(
                                    images, 
                                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
                                        if (loadingProgress == null) return child;
                                        return Center(
                                            child: CircularProgressIndicator()
                                        );
                                    },
                                )
                            )
                        )
                    )
                ],
                )
        );
    }
}
