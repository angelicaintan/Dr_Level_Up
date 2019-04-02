import 'dart:async';
import 'package:flutter/material.dart';

class HelpPatientInfo2 extends StatefulWidget {
  @override
  _HelpPatientInfo2State createState() => _HelpPatientInfo2State();
}

class _HelpPatientInfo2State extends State<HelpPatientInfo2> {

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
              'Record: Emoji + Basic Health Check. \nInstructions for the emoji would be further explained by the staff in charge of ‘Level-up’ program. The emoji represents (from left to right, top to bottom):\nLoss of Appetite\nInsomnia \nWeight loss\nDaily life: Don’t have regular routine\nLives alone\nMood\nConstipation\nHow are they managing their sickness\nPlease click on the according emoji if any abnormal signs (in those listed above) are shown by the person.',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}