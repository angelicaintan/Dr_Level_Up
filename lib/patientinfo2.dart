import 'package:flutter/material.dart';
import 'helppatientinfo2.dart';
import 'patientinfo3.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'patientinfo1.dart';

class PatientInfo2 extends StatefulWidget {
  @override
  _PatientInfo2State createState() => _PatientInfo2State();
}

class _PatientInfo2State extends State<PatientInfo2> {
  @override
  void _dismissKeyboard() {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  bool good_appetite = false;
  bool good_sleep = false;
  bool do_exercise = false;
  bool have_routine = false;
  bool have_livingcompany = false;
  bool good_mood = false;
  bool good_bowelmovement = false;
  bool manage_disease = false;
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
    prefs.setBool('good_appetite', good_appetite);
    prefs.setBool('good_sleep', good_sleep);
    prefs.setBool('do_exercise', do_exercise);
    prefs.setBool('have_routine', have_routine);
    prefs.setBool('have_livingcompany', have_livingcompany);
    prefs.setBool('good_mood', good_mood);
    prefs.setBool('good_bowelmovement', good_bowelmovement);
    prefs.setBool('manage_disease', manage_disease);

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
                      Text('Smoking', style: TextStyle(fontSize: 16)),
                      new Checkbox(
                        value: _smoking,
                        onChanged: (bool newValue) {
                          setState(() {
                            _smoking = newValue;
                          });
                        },
                      ),
                      Text('Alcohol', style: TextStyle(fontSize: 16)),
                      new Checkbox(
                        value: _alcohol,
                        onChanged: (bool newValue) {
                          setState(() {
                            _alcohol = newValue;
                          });
                        },
                      ),
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
                          MaterialPageRoute(builder: (context) => PatientInfo1()),
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
                        _persistPatientInfo2();
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
