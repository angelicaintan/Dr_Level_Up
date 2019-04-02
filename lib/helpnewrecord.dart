import 'dart:async';
import 'package:flutter/material.dart';

class HelpNewRecord extends StatefulWidget {
  @override
  _HelpNewRecordState createState() => _HelpNewRecordState();
}

class _HelpNewRecordState extends State<HelpNewRecord> {

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
              'To start a new record, please press the “New Record” button. If there is no more data to be inputted, please press the “Finish Outreach” button. \nRemarks: Once you press “Finish Outreach” button, you cannot add more or edit the files!',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}