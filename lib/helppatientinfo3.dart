import 'dart:async';
import 'package:flutter/material.dart';

class HelpPatientInfo3 extends StatefulWidget {
  @override
  _HelpPatientInfo3State createState() => _HelpPatientInfo3State();
}

class _HelpPatientInfo3State extends State<HelpPatientInfo3> {

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
              'You can add photos of the person’s physical ailments or previous medical appointments/referrals in the ‘Additional files or photos’ section.',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}