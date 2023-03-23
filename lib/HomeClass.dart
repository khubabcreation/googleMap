import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Homeclass extends StatefulWidget {
  const Homeclass({super.key});

  @override
  State<Homeclass> createState() => _HomeclassState();
}

class _HomeclassState extends State<Homeclass> {
  List<Marker> marker = [];
  List<Marker> markarList = [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(
          23.414166,
          -102.737833,
        ),
        infoWindow: InfoWindow(title: 'Mexico City')),
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(29.385297, 71.720437),
        infoWindow: InfoWindow(title: 'Mam Sana Afzal')),
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(29.384846, 71.710512),
        infoWindow: InfoWindow(title: 'Technical  chowk')),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(29.388485, 71.702013),
        infoWindow: InfoWindow(title: 'one Unit chowk')),
    Marker(
        markerId: MarkerId('3'),
        position: LatLng(29.385781, 71.755642),
        infoWindow: InfoWindow(title: 'Iub')),
    Marker(
        markerId: MarkerId('4'),
        position: LatLng(29.383033, 71.715636),
        infoWindow: InfoWindow(title: 'Center for Advance Solutions')),
    Marker(
        markerId: MarkerId('5'),
        position: LatLng(29.35332750986124, 71.6979947179303),
        infoWindow: InfoWindow(title: 'Raja chowk Bahawalpur')),
  ];
  @override
  void initState() {
    super.initState();
    marker.addAll(markarList);
  }

  Completer<GoogleMapController> controller = Completer();
  static CameraPosition position = CameraPosition(
      target: LatLng(29.35332750986124, 71.6979947179303), zoom: 14);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
            markers: Set<Marker>.of(marker),
            initialCameraPosition: position,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController value) {
              controller.complete(value);
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            GoogleMapController cont = await controller.future;
            cont.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                target: LatLng(
              23.414166,
              -102.737833,
            ))));
            setState(() {});
          },
          child: Icon(Icons.location_disabled_outlined),
        ),
      ),
    );
  }
}
