import 'package:flutter/material.dart';

class FeedItem extends StatelessWidget {
    final String name;
    final String teamName;
    final String content;
    final String images;
    final String profileImg;

    FeedItem(this.name, this.teamName, this.content, this.images, this.profileImg);

    @override 
    Widget build (BuildContext context) {
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
                                        child: Text(
                                            name + " - " + teamName, 
                                            textAlign: TextAlign.left, 
                                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)
                                        ),
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
                            child: Image.network(images, 
                                width: 150, 
                            )
                        )
                    )
                ],
                )
        );
    }
}