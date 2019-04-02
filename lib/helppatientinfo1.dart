import 'dart:async';
import 'package:flutter/material.dart';

class HelpPatientInfo1 extends StatefulWidget {
  @override
  _HelpPatientInfo1State createState() => _HelpPatientInfo1State();
}

class _HelpPatientInfo1State extends State<HelpPatientInfo1> {

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
              'Please fill in the personal info you got from the person you have approached according to their description. \nRemarks: \nName:  Record the name that they introduced themself with. \nIf you tick the reject button, the form will only save the person’s name, gender, and location.\nCSSA (Comprehensive Social Security Assistance (CSSA) Scheme).',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}