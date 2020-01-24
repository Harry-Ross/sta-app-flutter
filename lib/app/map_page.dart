import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapPage extends StatefulWidget {
    MapPage({Key key}) : super(key: key);

    @override
    _MapPageState createState() => new _MapPageState();
}

class _MapPageState extends State<MapPage> {

    static Completer<GoogleMapController> _controller = Completer();

    static const LatLng _center = const LatLng(-33.782583, 151.239167);

    void _onMapCreated(GoogleMapController controller) {
        _controller.complete(controller);
    }

    Widget build(BuildContext context) {
        return new Scaffold(
            body: _map()
        );
    }

    Widget _map() {
        return new GoogleMap(
            mapType: MapType.satellite,
            onMapCreated: _onMapCreated,
            myLocationButtonEnabled: true,
            initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
            ),
        );
    }
}