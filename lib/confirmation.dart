import 'dart:async';
import 'package:flutter/material.dart';
import 'helpconfirmation.dart';
import 'package:share/share.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'logout.dart';
import 'newrecord.dart';

class Confirmation extends StatefulWidget {
  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  var records = Firestore.instance.collection('Records').document();

  Future<Null> _saveRecord() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> recordMap = {
      'a. access-code': prefs.getString('access-code') ?? 0,
      'b. user-name': prefs.getString('user-name') ?? 0,
      'c. user-contact': prefs.getString('user-contact') ?? 0,
      'd. location': prefs.getString('location') ?? 0,
      'e. name': prefs.getString('name') ?? 0,
      'f. gender': prefs.getString('gender') ?? 0,
      'g. contact': prefs.getString('contact') ?? 0,
      'h. HKID': prefs.getString('HKID') ?? 0,
      'i. CSSA': prefs.getBool('cssa') ?? 0,
      'j. birthday': prefs.getString('birthday') ?? 0,
      'k. age': prefs.getString('age') ?? 0,
      'l. reject:': prefs.getBool('reject') ?? 0,
      'm. good_appetite:': prefs.getBool('good_appetite') ?? 0,
      'n. good_sleep:': prefs.getBool('good_sleep') ?? 0,
      'o. do_exercise:': prefs.getBool('do_exercise') ?? 0,
      'p. have_routine:': prefs.getBool('have_routine') ?? 0,
      'q. have_livingcompany:': prefs.getBool('have_routine') ?? 0,
      'r. good_mood:': prefs.getBool('have_routine') ?? 0,
      's. good_bowelmovement:': prefs.getBool('have_routine') ?? 0,
      't. manage_disease:': prefs.getBool('have_routine') ?? 0,
      'u. heart-rate': prefs.getString('heart-rate') ?? 0,
      'v. blood-pressure': prefs.getString('blood-pressure') ?? 0,
      'w. blood-glucose': prefs.getString('blood-glucose') ?? 0,
      'x. body-height': prefs.getString('body-height') ?? 0,
      'y. body-weight': prefs.getString('body-weight') ?? 0,
      'z. bmi': prefs.getString('BMI') ?? 0,
      'za. respiration-rate': prefs.getString('respiration-rate') ?? 0,
      'zb. smoking': prefs.getBool('smoking') ?? 0,
      'zc. alcohol': prefs.getBool('alcohol') ?? 0,
      'zd. drugs': prefs.getBool('drugs') ?? 0,
      'ze. additional-info1': prefs.getString('additional-info1') ?? 0,
      'zf. wound': prefs.getString('wound') ?? 0,
      'zg. mental-issues': prefs.getString('mental-issues') ?? 0,
      'zh. past-med-records': prefs.getString('past-med-records') ?? 0,
      'zi. additional-info2': prefs.getString('additional-info2') ?? 0,
    };
    records.setData(recordMap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Your Files'), leading: Container(), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help_outline, size: 29),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpConfirmation()),
              );
            },
          ),
        ]),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 24, top: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 32),
                          child: Text('1. 2019/02/28_22:23_Mark'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 32),
                          child: Text('2. 2019/02/28_22:50_Suvi'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 32),
                          child: Text('3. 2019/02/28_23:00_Panda'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 32),
                          child: Text('4. 2019/02/28_23:02_Lemon'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 32),
                          child: Text('5. 2019/02/28_23:07_Reese'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: 24, bottom: 24, left: 10, right: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                padding: EdgeInsets.all(0),
                                child: FlatButton(
                                  child: Text('edit'),
                                ),
                              ),
                              Container(
                                width: 75,
                                padding: EdgeInsets.all(0),
                                child: FlatButton(
                                  child: Text('delete'),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                padding: EdgeInsets.all(0),
                                child: FlatButton(
                                  child: Text('edit'),
                                ),
                              ),
                              Container(
                                width: 75,
                                padding: EdgeInsets.all(0),
                                child: FlatButton(
                                  child: Text('delete'),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                padding: EdgeInsets.all(0),
                                child: FlatButton(
                                  child: Text('edit'),
                                ),
                              ),
                              Container(
                                width: 75,
                                padding: EdgeInsets.all(0),
                                child: FlatButton(
                                  child: Text('delete'),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                padding: EdgeInsets.all(0),
                                child: FlatButton(
                                  child: Text('edit'),
                                ),
                              ),
                              Container(
                                width: 75,
                                padding: EdgeInsets.all(0),
                                child: FlatButton(
                                  child: Text('delete'),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                padding: EdgeInsets.all(0),
                                child: FlatButton(
                                  padding: EdgeInsets.all(0),
                                  child: Text('edit'),
                                ),
                              ),
                              Container(
                                width: 75,
                                child: FlatButton(
                                  padding: EdgeInsets.all(0),
                                  child: Text('delete'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ]),
                RaisedButton(
                  child: Text('Add Record'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewRecord()),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    child: Text('Send & Logout'),
                    onPressed: () {
                      _saveRecord();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogOut()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
              ],
            ),
          ],
        ));
  }
}
