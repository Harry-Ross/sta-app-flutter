import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:location/location.dart';

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

    static Completer<GoogleMapController> _controller = Completer();

    static const LatLng _center = const LatLng(-33.782583, 151.239167);

    final Map<String, Marker> locations = { 
        "firstOne": Marker(
            markerId: MarkerId("Yes that is quite epic time"),
            position: LatLng(-33.792462, 151.251398),
            infoWindow: InfoWindow(title: "yes"),
            icon: myicon
        ),
        "secondOne": Marker(
            markerId: MarkerId("Yes that is quite epic time but two"),
            position: LatLng(-33.793936, 151.268728)
        ),
    };

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
        return new GoogleMap(
            myLocationEnabled: true,
            mapType: MapType.hybrid,
            onMapCreated: _onMapCreated,
            markers: locations.values.toSet(),
            initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
            ),
            
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