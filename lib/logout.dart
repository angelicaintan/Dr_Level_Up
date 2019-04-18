import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart';

class LogOut extends StatefulWidget {
  @override
  _LogOutState createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new Container(),
      ),
      body: ListView(
        children: <Widget> [
          Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
              child: Text('You have logged out from our system.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 24, left: 24, right: 24),
              child: Text('Thank you for your contribution! By filling out these forms, you help us save time and effort to organise the records. We hope we will meet you again soon!',
              style: TextStyle(fontSize: 18), textAlign: TextAlign.center
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Image.asset('assets/images/icon@2x.png', height: 150),
            ),
            RaisedButton(
              child: Text(
                'Back'
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
            ),
          ],
        ),
        ],
      )
    );
  }
}