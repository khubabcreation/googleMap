import 'package:flutter/material.dart';
import 'package:google_map_cas/carddesighnclass.dart';
import 'package:google_map_cas/getCurrentLocOnMap.dart';
import 'package:google_map_cas/getlocation.dart';

import 'HomeClass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: cardClassDesighn(),
    );
  }
}
