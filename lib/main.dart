import 'package:flutter/material.dart';
import 'newrecord.dart';
import 'helpmain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: LevelUpWidget(records: [], child: MyHomePage(title: 'Salvation Army')),
    );
  }
}

class LevelUpWidget extends InheritedWidget {
  List records;

  LevelUpWidget({this.records, Widget child}) : super(child: child);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _dismissKeyboard() {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  String username;
  String email;
  String accesscode;
  int test;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final accesscodeController = TextEditingController();

  var records = Firestore.instance.collection('Records').document();

  _persistLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('access-code', accesscode);
    prefs.setString('user-name', username);
    prefs.setString('user-contact', email);
  }

  Future<Null> _saveLogin() async {
    Map<String, dynamic> loginMap = {
      'access-code': '${accesscodeController.text}',
      'user-name': '${usernameController.text}',
      'user-contact': '${emailController.text}',
    };
    records.setData(loginMap);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text('Welcome'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.help_outline, size: 29),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpMain()),
                  );
                },
              ),
            ]),
        body: ListView(children: <Widget>[
          GestureDetector(
            onTap: () => _dismissKeyboard(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/logo.png'),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  child: TextField(
                    controller: accesscodeController,
                    onChanged: (text) {
                      accesscode = text;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Access Code',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  child: TextField(
                    controller: usernameController,
                    onChanged: (text) {
                      username = text;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  child: TextField(
                    controller: emailController,
                    onChanged: (text) {
                      email = text;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Email Address',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
                RaisedButton(
                  child: Text(
                    'Go!',
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewRecord()),
                    );
                    _persistLogin();
                    // _saveLogin();
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
              ],
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ]));
  }
}
