import 'dart:async';
import 'package:flutter/material.dart';

class HelpConfirmation extends StatefulWidget {
  @override
  _HelpConfirmation createState() => _HelpConfirmation();
}

class _HelpConfirmation extends State<HelpConfirmation> {

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
              'Clicking “Add record” will take you to Home. Here, you can add record of the next person that your group encounters. You can convert it to a spreadsheet. Clicking send & log out will send the converted files (CSV) to the staff members at Salvation Army Office and you will be logged out from the system.',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}