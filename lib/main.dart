import 'package:azimout/views/intro.dart';
import 'package:azimout/views/Auth/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
  Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      '/Intro': (BuildContext context) => Intro(),
      '/Register': (BuildContext context) => Register(),
    };
    return new MaterialApp(
      title: 'Azimout',
      theme: new ThemeData(
        primaryColor: Colors.white,
        fontFamily: 'Raleway',
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white))),
      ),
      home: new Home(),
      routes: routes,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: <Widget>[
          (Intro()),
        ],
      ),
    );
  }
}
