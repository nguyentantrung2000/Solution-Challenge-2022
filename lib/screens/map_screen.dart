import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  var locationMess = "";
  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var latPosition = await Geolocator.getLastKnownPosition();
    print(latPosition);
    setState(() {
      locationMess = "$position.latitude,$position.longtitude";
    });
  }

  Completer<GoogleMapController> _controller = Completer();
  List markers = [
    {
      "id": "_kGooglePlexMaker",
      "title": "Google Plex",
      "lat": "11.766871",
      "long": "108.801220"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.terrain,
        markers: markers.map((s) {
          return Marker(
            markerId: MarkerId(s['id']),
            infoWindow: InfoWindow(title: s['title']),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            position: (LatLng(double.parse(s['lat']), double.parse(s['long']))),
            onTap: () {
              print(locationMess);
            },
          );
        }).toSet(),
        initialCameraPosition: CameraPosition(
          target: LatLng(11.766873, 108.801208),
          zoom: 15,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            bearing: 192.8334901395799,
            target: LatLng(11.766877, 108.801220),
            tilt: 59.440717697143555,
            zoom: 25),
      ),
    );
  }
}
