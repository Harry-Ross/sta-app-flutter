import 'package:flutter/material.dart';
import 'package:sta_app/screens/feed/feed_item.dart';

class FeedPage extends StatefulWidget {
    @override
    _FeedPageState createState() => new _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
    final Map data = {'posts': [
        { 'teamName': 'Team 1', 'name': 'Emma', 'content': "The ultimate Gemini has survived I wasn't supposed to make it past 25", "images": "", "profileImg": "https://api.time.com/wp-content/uploads/2018/11/emma-stone-stage-name-inspired-by-baby-spice.jpg" }, 
        { 'teamName': 'Team 2', 'name': 'Bob', 'content': "When I park my Range Rover Slightly scratch your Corolla Okay, I smashed your Corolla", "images": "https://preview.redd.it/40kmtuje5vb41.png?width=640&crop=smart&auto=webp&s=87f443b7ab91e6e87e6ad940b12bdc615f9b742f", "profileImg": "https://vignette.wikia.nocookie.net/btb/images/6/68/BobSavestheHedgehogs105.png/revision/latest?cb=20190806061908"}, 
        { 'teamName': 'Team 3', 'name': 'Joe', 'content': "I'm living' in that 21st century Doing something mean to it Do it better than anybody you ever seen do it Screams from the haters, got a nice ring to it I guess every superhero need his theme music", "images": "", "profileImg": "https://www.wibc.com/sites/g/files/exi441/f/styles/large_730/public/201908/gettyimages-1157600392.jpg?itok=Cb0cATDB" }
    ]};

    Widget build(BuildContext context) {
        return new Scaffold(
            body: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                    return FeedItem(data['posts'][index]['name'], data['posts'][index]['teamName'], data['posts'][index]['content'], data['posts'][index]['images'], data['posts'][index]['profileImg']);
                }
            ) 
        );
    }
}
