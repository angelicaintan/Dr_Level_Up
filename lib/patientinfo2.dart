import 'package:flutter/material.dart';
import 'helppatientinfo2.dart';
import 'patientinfo3.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'patientinfo1.dart';
import 'userfile.dart';
import 'main.dart';

class PatientInfo2 extends StatefulWidget {
  @override
  _PatientInfo2State createState() => _PatientInfo2State();
}

class _PatientInfo2State extends State<PatientInfo2> {
  @override
  void _dismissKeyboard() {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  bool appetite_problems;
  bool sleep_problems;
  bool weight_problems;
  bool no_routine;
  bool lives_alone;
  bool mood_problems;
  bool constipation;
  bool untreated_disease;
  bool _smoking = false;
  bool _alcohol = false;
  bool _drugs = false;

  String heartrate;
  String bloodpressure;
  String bloodglucose;
  String bodyheight;
  String bodyweight;
  String bmi;
  String respirationrate;
  String additionalinfo1;

  final heartrateController = TextEditingController();
  final bloodpressureController = TextEditingController();
  final bloodglucoseController = TextEditingController();
  final bodyheightController = TextEditingController();
  final bodyweightController = TextEditingController();
  final bmiController = TextEditingController();
  final respirationrateController = TextEditingController();
  final additionalinfo1Controller = TextEditingController();

  var records = Firestore.instance.collection('Records').document();

  _persistPatientInfo2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('appetite_problems', appetite_problems);
    prefs.setBool('sleep_problems', sleep_problems);
    prefs.setBool('weight_problems', weight_problems);
    prefs.setBool('no_routine', no_routine);
    prefs.setBool('lives_alone', lives_alone);
    prefs.setBool('mood_problems', mood_problems);
    prefs.setBool('constipation', constipation);
    prefs.setBool('untreated_disease', untreated_disease);

    prefs.setString('heart-rate', heartrate);
    prefs.setString('blood-pressure', bloodpressure);
    prefs.setString('blood-glucose', bloodglucose);
    prefs.setString('body-height', bodyheight);
    prefs.setString('body-weight', bodyweight);
    prefs.setString('BMI', bmi);
    prefs.setString('respiration-rate', respirationrate);
    prefs.setBool('smoking', _smoking);
    prefs.setBool('alcohol', _alcohol);
    prefs.setBool('drugs', _drugs);
    prefs.setString('additional-info1', additionalinfo1);
  }

  void _savePatientInfo2(UserFile userfile) {
    userfile.records[userfile.numrecords-1].heartrate = heartrate;
    userfile.records[userfile.numrecords-1].bloodpressure = bloodpressure;
    userfile.records[userfile.numrecords-1].bloodglucose = bloodglucose;
    userfile.records[userfile.numrecords-1].bodyheight = bodyheight;
    userfile.records[userfile.numrecords-1].bodyweight = bodyweight;
    userfile.records[userfile.numrecords-1].bmi = bmi;
    userfile.records[userfile.numrecords-1].respirationrate = respirationrate;
    userfile.records[userfile.numrecords-1].smoking = _smoking;
    userfile.records[userfile.numrecords-1].alcohol = _alcohol;
    userfile.records[userfile.numrecords-1].drugs = _drugs;
    userfile.records[userfile.numrecords-1].additionalinfo1 = additionalinfo1;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        IconButton(
          icon: Icon(Icons.help_outline, size: 29),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HelpPatientInfo2()),
            );
          },
        ),
      ]),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () => _dismissKeyboard(),
            child: Column(
              children: <Widget>[
                /*
                Padding(
                  padding: EdgeInsets.only(top: 24, left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: (MediaQuery.of(context).size.width * 0.8) / 4,
                        child: Image.asset('assets/images/Slide1.PNG'),
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width * 0.8) / 4,
                        child: Image.asset('assets/images/Slide2.PNG'),
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width * 0.8) / 4,
                        child: Image.asset('assets/images/Slide3.PNG'),
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width * 0.8) / 4,
                        child: Image.asset('assets/images/Slide4.PNG'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24, left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("appetite problems"),
                      new Checkbox(
                        value: appetite_problems,
                        onChanged: (bool newValue) {
                          setState(() {
                            appetite_problems = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24, left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("sleep problems"),
                      new Checkbox(
                        value: sleep_problems,
                        onChanged: (bool newValue) {
                          setState(() {
                            sleep_problems = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24, left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("body weight problems"),
                      new Checkbox(
                        value: weight_problems,
                        onChanged: (bool newValue) {
                          setState(() {
                            weight_problems = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0, left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("no daily routine"),
                      new Checkbox(
                        value: no_routine,
                        onChanged: (bool newValue) {
                          setState(() {
                            no_routine = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Checkbox(
                        value: good_appetite,
                        onChanged: (bool newValue) {
                          setState(() {
                            good_appetite = newValue;
                          });
                        },
                      ),
                      new Checkbox(
                        value: good_sleep,
                        onChanged: (bool newValue) {
                          setState(() {
                            good_sleep = newValue;
                          });
                        },
                      ),
                      new Checkbox(
                        value: do_exercise,
                        onChanged: (bool newValue) {
                          setState(() {
                            do_exercise = newValue;
                          });
                        },
                      ),
                      new Checkbox(
                        value: have_routine,
                        onChanged: (bool newValue) {
                          setState(() {
                            have_routine = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24, left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("lives alone"),
                      new Checkbox(
                        value: lives_alone,
                        onChanged: (bool newValue) {
                          setState(() {
                            lives_alone = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24, left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("mood or mental problems"),
                      new Checkbox(
                        value: mood_problems,
                        onChanged: (bool newValue) {
                          setState(() {
                            mood_problems = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24, left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("constipation"),
                      new Checkbox(
                        value: constipation,
                        onChanged: (bool newValue) {
                          setState(() {
                            constipation = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24, left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("untreated disease"),
                      new Checkbox(
                        value: untreated_disease,
                        onChanged: (bool newValue) {
                          setState(() {
                            untreated_disease = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24, left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: (MediaQuery.of(context).size.width * 0.8) / 4,
                        child: Image.asset('assets/images/Slide5.PNG'),
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width * 0.8) / 4,
                        child: Image.asset('assets/images/Slide6.PNG'),
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width * 0.8) / 4,
                        child: Image.asset('assets/images/Slide7.PNG'),
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width * 0.8) / 4,
                        child: Image.asset('assets/images/Slide8.PNG'),
                      ),
                    ],
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Checkbox(
                        value: have_livingcompany,
                        onChanged: (bool newValue) {
                          setState(() {
                            have_livingcompany = newValue;
                          });
                        },
                      ),
                      new Checkbox(
                        value: good_mood,
                        onChanged: (bool newValue) {
                          setState(() {
                            good_mood = newValue;
                          });
                        },
                      ),
                      new Checkbox(
                        value: good_bowelmovement,
                        onChanged: (bool newValue) {
                          setState(() {
                            good_bowelmovement = newValue;
                          });
                        },
                      ),
                      new Checkbox(
                        value: manage_disease,
                        onChanged: (bool newValue) {
                          setState(() {
                            manage_disease = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                */
                Padding(
                  padding:
                      EdgeInsets.only(left: 24, right: 24, top: 20, bottom: 5),
                  child: TextField(
                    controller: heartrateController,
                    onChanged: (text) {
                      heartrate = text;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Heart Rate',
                        labelStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  child: TextField(
                    controller: bloodpressureController,
                    onChanged: (text) {
                      bloodpressure = text;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Blood Pressure',
                        labelStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  child: TextField(
                    controller: bloodglucoseController,
                    onChanged: (text) {
                      bloodglucose = text;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Blood Glucose',
                        labelStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  child: TextField(
                    controller: bodyheightController,
                    onChanged: (text) {
                      bodyheight = text;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Body Height',
                        labelStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  child: TextField(
                    controller: bodyweightController,
                    onChanged: (text) {
                      bodyweight = text;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Body Weight',
                        labelStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  child: TextField(
                    controller: bmiController,
                    onChanged: (text) {
                      bmi = text;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'BMI',
                        labelStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  child: TextField(
                    controller: respirationrateController,
                    onChanged: (text) {
                      respirationrate = text;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Respiration Rate',
                        labelStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text('Smoking', style: TextStyle(fontSize: 16)),
                          new Checkbox(
                            value: _smoking,
                            onChanged: (bool newValue) {
                              setState(() {
                                _smoking = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text('Alcohol', style: TextStyle(fontSize: 16)),
                          new Checkbox(
                            value: _alcohol,
                            onChanged: (bool newValue) {
                              setState(() {
                                _alcohol = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text('Drugs', style: TextStyle(fontSize: 16)),
                          new Checkbox(
                            value: _drugs,
                            onChanged: (bool newValue) {
                              setState(() {
                                _drugs = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 24),
                  child: Text('Additional Information',
                      style: TextStyle(fontSize: 16)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  child: TextField(
                    controller: additionalinfo1Controller,
                    onChanged: (text) {
                      additionalinfo1 = text;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'E.g. Lost a lot of weight recently',
                        labelStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Back'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PatientInfo1()),
                        );
                      },
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    RaisedButton(
                      child: Text('Next'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PatientInfo3()),
                        );
                        _savePatientInfo2(LevelUpWidget.of(context).userfile);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
