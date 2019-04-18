import 'dart:async';
import 'package:flutter/material.dart';
import 'helppatientinfo1.dart';
import 'helpnewrecord.dart';
import 'Location.dart';
import 'main.dart';
import 'userfile.dart';

class NewRecord extends StatefulWidget {
  @override
  _NewRecordState createState() => _NewRecordState();
}

void _createNewRecord (UserFile userfile) {
    Record temp = new Record('n/a','n/a','n/a','n/a','n/a','n/a', false, 'n/a', 'n/a', false, 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', false, false, false, 'n/a', 'n/a', 'n/a', 'n/a', 'n/a');
    // userfile.records.add(temp);
    // ++userfile.numrecords;
    
}


class _NewRecordState extends State<NewRecord> {
  @override
  Widget build(BuildContext context) {
    print(LevelUpWidget.of(context).userfile.accesscode);
    return Scaffold(
        appBar: AppBar(actions: <Widget>[
          FlatButton(
            child: Text('logout', style: TextStyle(fontSize: 18, color: Colors.white)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.help_outline, size: 29),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpNewRecord()),
              );
            },
          ),
          
        ]),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              /*
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      padding: EdgeInsets.all(5.0),
                      child: Text('Log Out'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                        );
                      },
                    )),
              ),
              */
              Padding(
                padding:EdgeInsets.only(top:50),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: RaisedButton(
                  padding: EdgeInsets.all(20),
                  child: Text('New Record', style: TextStyle(fontSize: 21)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Location()),
                    );
                    _createNewRecord(LevelUpWidget.of(context).userfile);
                  },
                ),
              ),
              RaisedButton(
                padding: EdgeInsets.all(20),
                child: Text('Finish Outreach', style: TextStyle(fontSize: 21)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
