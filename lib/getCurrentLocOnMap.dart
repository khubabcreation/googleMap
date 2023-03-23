import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetcurrentLocation extends StatefulWidget {
  const GetcurrentLocation({super.key});

  @override
  State<GetcurrentLocation> createState() => _GetcurrentLocationState();
}

class _GetcurrentLocationState extends State<GetcurrentLocation> {
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print(error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  List<Marker> marker = [
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(29.6970, 72.5538),
    )
  ];
  Completer<GoogleMapController> controller = Completer();
  CameraPosition position =
      CameraPosition(zoom: 14, target: LatLng(29.6970, 72.5538));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: GoogleMap(
          markers: Set<Marker>.of(marker),
          initialCameraPosition: position,
          onMapCreated: (GoogleMapController mycontroller) {
            controller.complete(mycontroller);
          },
          mapType: MapType.normal),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            getUserCurrentLocation().then((value) async {
              print('user current location');
              print('this is the latitiude :' + "" + value.latitude.toString());
              print(
                  'this is the longitude : ' + "" + value.longitude.toString());
              marker.add(Marker(
                  infoWindow: InfoWindow(title: 'my current location '),
                  markerId: MarkerId('3'),
                  position: LatLng(value.latitude, value.longitude)));
              CameraPosition cameraposition = CameraPosition(
                  zoom: 14, target: LatLng(value.latitude, value.longitude));
              final GoogleMapController control = await controller.future;
              control.animateCamera(
                  CameraUpdate.newCameraPosition(cameraposition));
            });
            setState(() {});
          },
          child: Icon(Icons.location_city_rounded)),
    ));
  }
}
