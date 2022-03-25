import 'dart:async';
import 'package:challenge/screens/details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  var locationMess = "";
  var Latitude = 10.7535146;
  var Longitude = 106.630329;
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
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      Latitude = position.latitude;
      Longitude = position.longitude;
    });
  }

  Completer<GoogleMapController> _controller = Completer();
  List markers = [];

  getData() async {
    final CollectionReference document =
        FirebaseFirestore.instance.collection("reports");
    await document.get().then((value) async => {
          value.docs.forEach((element) => {
                setState(() => {
                      markers.add({
                        'id': element.id,
                        'title': element['address'],
                        'lat': element['lat'],
                        'long': element['long']
                      }),
                    })
              }),
          print(markers)
        });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    determinePosition();
    getData();
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
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            position: (LatLng(s['lat'], s['long'])),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => detail(s['id'])));
            },
          );
        }).toSet(),
        initialCameraPosition: CameraPosition(
          target: LatLng(Latitude, Longitude),
          zoom: 15,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
