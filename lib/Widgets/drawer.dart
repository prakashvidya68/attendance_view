import 'package:attendance/Screens/attendance_record.dart';
import 'package:attendance/Screens/dash_board.dart';
import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({
    Key key,
    @required Map<String, dynamic> profile,
  })  : _profile = profile,
        super(key: key);

  final Map<String, dynamic> _profile;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: <Widget>[
                Container(
                  height: 75,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.network(
                      _profile['photoURL'],
                    ),
                  ),
                ),
                Text(
                  _profile['displayName'],
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  _profile['email'],
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
          ),
          ListTile(
            leading: Icon(Icons.show_chart),
            title: Text('Dash Board'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => DashBoard(_profile),
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(Icons.timelapse),
                Text(
                  'Attendance of Last 15 Weaks',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            dense: true,
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.book),
                SizedBox(width: 20,),
                Text('Subject 1'),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Attendance(_profile, 0),
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.book),
                SizedBox(width: 20,),
                Text('Subject 2'),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Attendance(_profile, 1),
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.book),
                SizedBox(width: 20,),
                Text('Subject 3'),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Attendance(_profile, 1),
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.book),
                SizedBox(width: 20,),
                Text('Subject 4'),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Attendance(_profile, 3),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
