import 'package:flutter/material.dart';

import '../Screens/attendance_record.dart';

class Chart extends StatelessWidget {
  final List<double> data;
  final Map<String, dynamic> _profile;

  Chart(this.data, this._profile);
  @override
  Widget build(BuildContext context) {
    final barLen = MediaQuery.of(context).size.width * 0.60;

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical:20,horizontal: 10),
              child: Text(
                'Subject 1',
                style: TextStyle(color: Colors.purple),
              ),
            ),
            GestureDetector(
              child: new Bar(
                barLen: barLen,
                data: data,
                subjectNumber: 1,
                color: Colors.orange,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Attendance(_profile, 0),
                  ),
                );
              },
            )
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Subject 2',
                style: TextStyle(color: Colors.purple),
              ),
            ),
            GestureDetector(
              child: new Bar(
                barLen: barLen,
                data: data,
                subjectNumber: 2,
                color: Colors.lightGreen,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Attendance(_profile, 1),
                  ),
                );
              },
            )
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Subject 3',
                style: TextStyle(color: Colors.purple),
              ),
            ),
            GestureDetector(
                child: new Bar(
                  barLen: barLen,
                  data: data,
                  subjectNumber: 3,
                  color: Colors.amber,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Attendance(_profile, 2),
                    ),
                  );
                })
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Subject 4',
                style: TextStyle(color: Colors.purple),
              ),
            ),
            GestureDetector(
                child: new Bar(
                  barLen: barLen,
                  data: data,
                  subjectNumber: 4,
                  color: Colors.pink,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Attendance(_profile, 3),
                    ),
                  );
                })
          ],
        ),
      ],
    );
  }
}

class Bar extends StatelessWidget {
  final int subjectNumber;
  final Color color;

  const Bar({
    this.color,
    this.subjectNumber,
    Key key,
    @required this.barLen,
    @required this.data,
  }) : super(key: key);

  final double barLen;
  final List<double> data;

  @override
  Widget build(BuildContext context) {
    print((barLen * data[subjectNumber - 1]) / 100);
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 23,
              width: barLen,
              child: Card(
                elevation: 0,
                child: Text(''),
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 23,
                  width: (barLen * data[subjectNumber - 1]) / 100,
                  child: Card(
                    elevation: 20,
                    color: color,
                    child: Text(''),
                  ),
                ),
                Text(data[subjectNumber-1].round().toString()+'%'),
              ],
            ),
          ],
        )
      ],
    );
  }
}