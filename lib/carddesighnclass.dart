import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class cardClassDesighn extends StatefulWidget {
  const cardClassDesighn({super.key});

  @override
  State<cardClassDesighn> createState() => _cardClassDesighnState();
}

class _cardClassDesighnState extends State<cardClassDesighn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        shadowColor: Colors.blueAccent,
        elevation: 15,
        child: ClipPath(
          clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          child: Container(
              height: 180,
              decoration: BoxDecoration(
                border:
                    Border(left: BorderSide(color: Colors.brown, width: 50)),
                color: Colors.yellowAccent.shade100,
              ),
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text('Hi i am here '),
              )),
        ),
      ),
    );
  }
}
