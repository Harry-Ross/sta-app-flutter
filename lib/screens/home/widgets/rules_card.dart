import 'package:flutter/material.dart';

class RulesCard extends StatelessWidget {
    Widget build(BuildContext context) {
        return Card(
            child: Column(
                children: <Widget>[
                    Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                            "Rules", 
                            style: TextStyle( fontWeight: FontWeight.bold, fontSize: 25,)
                        ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        alignment: Alignment.centerLeft,
                        child: Column(
                            children: <Widget>[
                                Container(padding: const EdgeInsets.all(3), child: Text( "0. Don't learn to code")),
                                Container(padding: const EdgeInsets.all(3), child: Text( "1. Don't learn to code")),
                                Container(padding: const EdgeInsets.all(3), child: Text( "2. Don't learn to code")),
                                Container(padding: const EdgeInsets.all(3), child: Text( "3. Don't learn to code")),
                                Container(padding: const EdgeInsets.all(3), child: Text( "4. Don't learn to code")),
                                Container(padding: const EdgeInsets.all(3), child: Text( "5. Don't learn to code")),
                                Container(padding: const EdgeInsets.all(3), child: Text( "6. Don't learn to code")),
                            ],
                        )
                            
                    )
                ],
            )
        );
    }
}