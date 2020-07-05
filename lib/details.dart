import 'package:flutter/material.dart';
import 'event.dart';

class Details extends StatelessWidget {
  final Event event;

  Details({Key key, @required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(event.description),
      ),
    );
  }
}