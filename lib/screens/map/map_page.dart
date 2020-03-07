import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:location/location.dart';
import 'package:sta_app/models/activity_data.dart';

class MapPage extends StatefulWidget {
    MapPage({Key key}) : super(key: key);

    @override
    _MapPageState createState() => new _MapPageState();
}

class _MapPageState extends State<MapPage> {

    static BitmapDescriptor myicon;

    @override
    void initState() {
        super.initState();
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(size: Size(48, 48)), 'assets/pin.png')
            .then((onValue) {
                myicon = onValue;
            });
        getLocationPermission();
    }

    Future<Set<Marker>> _getMarkersFromJson(String path) async {
        String jsonString = await rootBundle.loadString(path);
        List<dynamic> activityMap = jsonDecode(jsonString);

        var activityData = ActivityData.fromJson(activityMap);
        
        Set<Marker> markers = activityData.activities.map((i) => Marker(
            markerId: MarkerId(i.name), 
            position: LatLng(i.lat, i.long),
            icon: myicon
        )).toSet();

        return markers;
    }

    static Completer<GoogleMapController> _controller = Completer();

    LatLng _center = const LatLng(-33.792462, 151.239167);

    // final Set<Marker> locations = { 
    //     Marker(
    //         markerId: MarkerId("Yes that is quite epic time"),
    //         position: LatLng(-33.792462, 151.251398),
    //         infoWindow: InfoWindow(title: "yes"),
    //         icon: myicon
    //     ),
    //     Marker(
    //         markerId: MarkerId("Yes that is quite epic time but two"),
    //         position: LatLng(-33.793936, 151.268728)
    //     ),
    // };

    void _onMapCreated(GoogleMapController controller) {
        _controller.complete(controller);
    }

    Widget build(BuildContext context) {
        return new Scaffold(
            body: FutureBuilder<bool>(
                future: getLocationPermission(),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    return _map();
                }
            )
            
        );
    }

    Widget _map() {
        return FutureBuilder<Set<Marker>>(
            future: _getMarkersFromJson('assets/activities.json'),
            builder: (BuildContext context, AsyncSnapshot<Set<Marker>> snap) {
                if (snap.hasData) {
                    return GoogleMap(
                        myLocationEnabled: true,
                        mapType: MapType.hybrid,
                        onMapCreated: _onMapCreated,
                        markers: snap.data,
                        initialCameraPosition: CameraPosition(
                            target: _center,
                            zoom: 11.0,
                        ), 
                    );
                }
                else {
                    return Center(
                        child: CircularProgressIndicator(backgroundColor: Colors.blue[800],),
                    );
                }
            }
        );
    }

    Future<bool> getLocationPermission() async {
        final Location location = new Location();
        try {
            location.requestPermission(); //to lunch location permission popup
        } on PlatformException catch (e) {
            if (e.code == 'PERMISSION_DENIED') {
                print('Permission denied');
                return false;
            }
        }
        return true;
    }
}