import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EndpointCard extends StatelessWidget {
    Widget build(BuildContext context) {
        return Card(
            child: Column(
                children: <Widget>[
                    Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                            "Endpoint", 
                            style: TextStyle( fontWeight: FontWeight.bold, fontSize: 25,)
                        ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(10),
                        //alignment: Alignment.centerLeft,
                        child: RichText(
                            text: TextSpan(
                                style: new TextStyle(
                                    fontSize: 15,
                                    color: Colors.black
                                ),
                                children: <TextSpan>[
                                    TextSpan(text: " 16:30", style: TextStyle(fontWeight: FontWeight.bold)),
                                    TextSpan(text: " at"),
                                    TextSpan(text: " Manly Wharf", style: TextStyle(fontWeight: FontWeight.bold))
                                ]
                            ),
                        )
                    ),
                    Container(
                        padding: const EdgeInsets.all(10),
                        height: 150,
                        child: GoogleMap(
                            initialCameraPosition: CameraPosition(
                                target: LatLng(-33.782583, 151.239167),
                                zoom: 11.0,
                            ),
                        )
                    )
                ],
            )
        );
    }
}