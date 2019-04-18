import 'dart:async';
import 'package:flutter/material.dart';
import 'helpconfirmation.dart';
import 'package:share/share.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'logout.dart';
import 'newrecord.dart';
import 'userfile.dart';
import 'main.dart';

class Confirmation extends StatefulWidget {
  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Send and log out?"),
          content:
              new Text("You can't edit the records anymore after sending."),
          actions: <Widget>[
            new FlatButton(
                child: Text("logout"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogOut()),
                  );
                }),
            new FlatButton(
              child: Text("cancel"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  var firestoreRecords = Firestore.instance.collection('Records').document();

  void _createNewRecord(UserFile userfile) {
    userfile.records.add(new Record('n/a','n/a','n/a','n/a','n/a','n/a', false, 'n/a', 'n/a', false, 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', false, false, false, 'n/a', 'n/a', 'n/a', 'n/a', 'n/a'));
    ++userfile.numrecords;
  }

  Future<Null> _saveRecord(UserFile userfile) async {
    for (int i = 0; i < userfile.numrecords; i++) {
      Map<String, dynamic> recordMap = {
        'a. access-code': userfile.accesscode,
        'b. user-name': userfile.username,
        'c. email': userfile.email,
        'd. location': userfile.records[i].location,
        'e. name': userfile.records[i].name,
        'f. description': userfile.records[i].description,
        'g. gender': userfile.records[i].gender,
        'h. contact': userfile.records[i].contact,
        'i. HKID': userfile.records[i].hkid,
        'j. CSSA': userfile.records[i].cssa,
        'k. date-of-birth': userfile.records[i].dob,
        'l. age': userfile.records[i].age,
        'm. reject:': userfile.records[i].reject,
        'n. heart-rate': userfile.records[i].location,
        'o. blood-pressure': userfile.records[i].bloodpressure,
        'p. blood-glucose': userfile.records[i].bloodglucose,
        'q. body-height': userfile.records[i].bodyheight,
        'r. body-weight': userfile.records[i].bodyweight,
        's. bmi': userfile.records[i].bmi,
        't. respiration-rate': userfile.records[i].respirationrate,
        'u. smoking': userfile.records[i].smoking,
        'v. alcohol': userfile.records[i].alcohol,
        'w. drugs': userfile.records[i].drugs,
        'x. additional-info1': userfile.records[i].additionalinfo1,
        'y. wound': userfile.records[i].wound,
        'z. mental-issues': userfile.records[i].mentalissues,
        'za. past-med-records': userfile.records[i].previousmedicalrecords,
        'zb. additional-info2': userfile.records[i].additionalinfo2,
      };
      firestoreRecords.setData(recordMap);
    }
  }

/*
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
      'm. appetite_problems:': prefs.getBool('appetite_problems') ?? 0,
      'n. sleep_problems:': prefs.getBool('sleep_problems') ?? 0,
      'o. weight_problems:': prefs.getBool('weight_problems') ?? 0,
      'p. no_routine:': prefs.getBool('no_routine') ?? 0,
      'q. lives_alone:': prefs.getBool('lives_alone') ?? 0,
      'r. mood_problems:': prefs.getBool('mood_problems') ?? 0,
      's. constipation:': prefs.getBool('constipation') ?? 0,
      't. untreated_disease:': prefs.getBool('untreated_disease') ?? 0,
      'u. heart-rate': prefs.getString('heart-rate') ?? 0,
      'v. blood-pressure': prefs.getString('blood-pressure') ?? 0,
      'w. blood-glucose': prefs.getString('blood-glucose') ?? 0,
      'x. body-height': prefs.getString('\0body-height') ?? 0,
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
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Your Files'),
            leading: Container(),
            actions: <Widget>[
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
                        /*
                        Padding(
                          padding: EdgeInsets.only(bottom: 32),
                          child: Text('1. 2019/02/28_Mark'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 32),
                          child: Text('2. 2019/02/28_Suvi'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 32),
                          child: Text('3. 2019/02/28_Panda'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 32),
                          child: Text('4. 2019/02/28_Lemon'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 32),
                          child: Text('5. 2019/02/28_Reese'),
                        ),
                        */
                        new Expanded(
                            child: new ListView.builder(
                                itemCount: LevelUpWidget.of(context).userfile.numrecords,
                                itemBuilder: (BuildContext ctxt, int index) {
                                  return new Text(LevelUpWidget.of(context).userfile.records[index].name);
                                }))
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
                    _createNewRecord(LevelUpWidget.of(context).userfile);
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
                      _saveRecord(LevelUpWidget.of(context).userfile);
                      _showDialog();
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
