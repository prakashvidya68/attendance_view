import 'dart:io';

import 'package:attendance/Widgets/auth.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'student_details.dart';
import '../Widgets/chart.dart';
import '../Widgets/drawer.dart';

class DashBoard extends StatefulWidget {
  final Map<String, dynamic> _profile;
  var x = false;

  DashBoard(this._profile);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    List<double> attendanceRatio = [];

    attendanceRatio
        .add(calcSubAttenPercent(widget._profile['Attendance']['0']));
    attendanceRatio
        .add(calcSubAttenPercent(widget._profile['Attendance']['1']));
    attendanceRatio
        .add(calcSubAttenPercent(widget._profile['Attendance']['2']));
    attendanceRatio
        .add(calcSubAttenPercent(widget._profile['Attendance']['3']));

    print(attendanceRatio);
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Dash Board'),
        backgroundColor: Colors.lime,
        actions: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'Log out',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            onPressed: () async {
              setState(() {
                widget.x = true;
              });
              authService.signOut();
              await Future.delayed(Duration(seconds: 5));
              setState(() {
                widget.x = true;
              });
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyApp(),
                ),
              );
            },
          )
        ],
      ),
      drawer: new DrawerView(profile: widget._profile),
      body: Padding(
        padding: const EdgeInsets.only(top: 35, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Card(
                  elevation: 8,
                  color: Colors.redAccent,
                  child: Card(
                    child: UserDetails(
                      profile: widget._profile,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              widget.x ? CircularProgressIndicator() : SizedBox(),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 18,
                  color: Colors.green,
                  child: Card(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Class: ${widget._profile['Class']}',
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Notice: ',
                            style: TextStyle(color: Colors.pink, fontSize: 25),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    '1) ' + widget._profile['anounce']['1'],
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    '2) ' + widget._profile['anounce']['2'],
                                    textAlign: TextAlign.justify,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                color: Colors.purple,
                child: Card(
                  elevation: 24,
                  child: Chart(attendanceRatio, widget._profile),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calcSubAttenPercent(Map<dynamic, dynamic> att) {
    var sum = 0;
    var percnt;
    sum += 0;
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    const totalClases = 15 * 6;

    // print(att[subjctNumber.toString()]['Mon']);
    for (int j = 0; j < 6; j++) {
      for (int i = 0; i < 15; i++) {
        sum += att[days[j]][i];
      }
    }
    percnt = (sum / totalClases) * 100;

    print(percnt);

    return percnt;
  }
}
