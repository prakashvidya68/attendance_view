import 'package:flutter/material.dart';

import './dash_board.dart';

class IsThisYou extends StatelessWidget {
  final Map<String, dynamic> _profile;

  final routeName = '/userConfermation';
  IsThisYou(this._profile);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _profile['photoURL'] == null
            ? SizedBox()
            : new UserDetails(profile: _profile),
        _profile['photoURL'] == null
            ? SizedBox()
            : Container(
              width: 150,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.check_circle),
                      FlatButton(
                        textColor: Colors.black,
                        color: Colors.transparent,
                        child: Text(
                          'Confirm',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          print(_profile['Attendance']['Mon']);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DashBoard(_profile),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}

class UserDetails extends StatelessWidget {
  const UserDetails({
    Key key,
    @required Map<String, dynamic> profile,
  })  : _profile = profile,
        super(key: key);

  final Map<String, dynamic> _profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              
              child: _profile!=null?Image.network(_profile['photoURL']):SizedBox(),
            ),
            title: Text('Name: ' + _profile['displayName']),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Text(
                  'E-mail: ' + _profile['email'],
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Roll no: ' + _profile['rollNumber'].toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      height: 15,
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Text(
                      'Class: ' + _profile['Class'],
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
