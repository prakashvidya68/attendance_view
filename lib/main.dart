import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './Widgets/home.dart';
import './Widgets/user_profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterBase',
      home: Scaffold(
        body: Container(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.lime, Colors.green]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Attendance',
                  style: TextStyle(fontFamily: 'AlexBrush', fontSize: 75),
                ),
                SizedBox(
                  height: 20,
                ),
                Home(), // <-- Built with StreamBuilder
                SizedBox(
                  height: 20,
                ),
                UserProfile(), // <-- Built with StatefulWidget
              ],
            ),
          ),
        ),
      ),
      theme: ThemeData(
        fontFamily: 'Able',
        textTheme: TextTheme(
          body1: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
