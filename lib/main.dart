import 'package:flutter/material.dart';
import 'newrecord.dart';
import 'helpmain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/rxdart.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'translations.dart';
import 'application.dart';
import 'dart:io';
import 'userfile.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

    SpecificLocalizationDelegate _localeOverrideDelegate;

    @override
    void initState(){
    super.initState();
    _localeOverrideDelegate = new SpecificLocalizationDelegate(null);
    ///
    /// Let's save a pointer to this method, should the user wants to change its language
    /// We would then call: applic.onLocaleChanged(new Locale('en',''));
    /// 
    applic.onLocaleChanged = onLocaleChange;
  }

    onLocaleChange(Locale locale){
    setState((){
      _localeOverrideDelegate = new SpecificLocalizationDelegate(locale);
    });
  }

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
      localizationsDelegates: [
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
          const Locale('en', ''),
          const Locale('hk', ''),
      ],
      home: LevelUpWidget(userfile: UserFile('n/a', 'n/a', 'n/a'), child: MyHomePage(title: 'Salvation Army')),
    );
  }
}

class LevelUpWidget extends InheritedWidget {
  UserFile userfile = new UserFile('n/a', 'n/a', 'n/a');

  LevelUpWidget({this.userfile, Widget child}) : super(child: child);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LevelUpWidget of (BuildContext context) =>
    context.inheritFromWidgetOfExactType(LevelUpWidget);
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
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _dismissKeyboard() {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  String username = 'n/a';
  String email = 'n/a';
  String accesscode = 'n/a';
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

  void _saveLogin(UserFile userfile) async {

    userfile.accesscode = accesscode;
    userfile.username = username;
    userfile.email = email;
  }

/*
  _saveLogin(List records) async {
    Map<String, dynamic> loginMap = {
      'access-code': '${accesscodeController.text}',
      'user-name': '${usernameController.text}',
      'user-contact': '${emailController.text}',
    };
    records.setData(loginMap);
    records.add(records)

    records.add(accesscode);
    records.add(username);
    records.add(email);

  }
  */



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
            title: Text(Translations.of(context).text('welcome')),
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
              FlatButton (
                child: Text("EN/中文"),
                onPressed: () { 
                  applic.onLocaleChanged(new Locale('hk', null)); },
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
                        labelText: Translations.of(context).text('access_code'),
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
                    _saveLogin(LevelUpWidget.of(context).userfile);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return LevelUpWidget(
                          userfile: LevelUpWidget.of(context).userfile,
                          child: NewRecord(),
                        );
                      }),
                    );
                    // _persistLogin();
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
