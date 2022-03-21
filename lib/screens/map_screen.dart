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
   var Latitude;
  var Longitude;
  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var latPosition = await Geolocator.getLastKnownPosition();
    print("$position.latitude,$position.longtitude");
    setState(() {
      locationMess = "$position.latitude,$position.longtitude";
    });
  }

  void determinePosition() async {
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        setState(() {
      Latitude = position.latitude;
      Longitude = position.longitude;
    });
  }

  Completer<GoogleMapController> _controller = Completer();
  List markers = [
    {
      "id": "_kGooglePlexMaker",
      "title": "hahaha",
      "lat": "11.766871",
      "long": "108.801220"
    },
  ];

  void initState() {
    // TODO: implement initState
    super.initState();
    determinePosition();
  }

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
            position: (LatLng(Latitude,Longitude)),
            onTap: () {
              print(locationMess);
            },
          );
        }).toSet(),
        initialCameraPosition: CameraPosition(
          target: LatLng(Latitude,Longitude),
          zoom: 15,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
