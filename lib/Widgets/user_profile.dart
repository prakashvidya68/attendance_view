import '../Screens/student_details.dart';
import 'package:flutter/material.dart';

import './auth.dart';

class UserProfile extends StatefulWidget {
  @override
  UserProfileState createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  Map<String, dynamic> _profile;
  var _loading = false;

  @override
  initState() {
    super.initState();

    authService.profile.listen((state) => setState(() => _profile = state));

    authService.loading.listen((state) => setState(() => _loading = state));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              child:
                  _loading? CircularProgressIndicator() : _profile== null? SizedBox() : IsThisYou(_profile),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ],
    );
  }
}