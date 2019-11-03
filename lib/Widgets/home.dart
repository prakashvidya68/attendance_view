import 'package:flutter/material.dart';

import './auth.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: authService.user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      
                    ),
                    child: FlatButton(
                      onPressed: () => authService.signOut(),
                      textColor: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.report),
                          Text(
                            ' Not me',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () => authService.googleSignIn(),
                      color: Colors.transparent,
                      textColor: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Signin with ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          Image.asset(
                            'lib/Assets/google_PNG19644.png',
                            height: 35,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
