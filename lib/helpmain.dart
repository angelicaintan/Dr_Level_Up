import 'dart:async';
import 'package:flutter/material.dart';

class HelpMain extends StatefulWidget {
  @override
  _HelpMainState createState() => _HelpMainState();
}

class _HelpMainState extends State<HelpMain> {
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
              'You can get your access code from your team leader to use the app. Please fill in your name and contact number in case we need verification on the records that you input',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
