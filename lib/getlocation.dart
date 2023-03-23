import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_geocoder/geocoder.dart';

class convertLocation extends StatefulWidget {
  const convertLocation({super.key});

  @override
  State<convertLocation> createState() => _convertLocationState();
}

class _convertLocationState extends State<convertLocation> {
  final cordinate = Coordinates(29.382955, 71.715591);
  String coco = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Location Convertion')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(coco),
            ElevatedButton(
              onPressed: () async {
                var address = await Geocoder.local
                    .findAddressesFromCoordinates(cordinate);
                var first = address.first;
                setState(() {
                  coco = first.addressLine.toString();
                });
              },
              child: Text('convert My location'),
            ),
          ],
        ),
      ),
    );
  }
}
