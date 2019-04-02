import 'dart:async';
import 'package:flutter/material.dart';

class HelpLocation extends StatefulWidget {
  @override
  _HelpLocationState createState() => _HelpLocationState();
}

class _HelpLocationState extends State<HelpLocation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Text(
              'Pinpoint the person’s location via GPS or manually input it in the box above the map.',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}