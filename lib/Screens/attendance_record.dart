import 'package:flutter/material.dart';

import '../Dummy/attendance.dart';

class Attendance extends StatelessWidget {
  final Map<String, dynamic> _profile;
  final int subjctNumber;
  static const RouteName = '/attendance';

  Attendance(this._profile, this.subjctNumber);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Record'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(6),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border:Border.all(),
          ),
                child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: new AttendanceView(
              subjctNumber: subjctNumber,
              profile: _profile,
            ),
          ),
        ),
      ),
    );
  }
}

class AttendanceView extends StatelessWidget {
  final int subjctNumber;
  final Map<String, dynamic> profile;

  AttendanceView({Key key, this.subjctNumber, this.profile}) : super(key: key);
  @override
  Widget build(BuildContext context) {


    // return Table(
    //   border: TableBorder.all(),
    //   children: <TableRow>[
    //     TableRow(
    //       children: <Widget>[
    //         Text('MON'),
    //         Text('TUE'),
    //         Text('WED'),
    //         Text('THU'),
    //         Text('FRI'),
    //         Text('SAT'),
    //       ],
    //     ),
    //     for(int i=0;i<15;i++){

    //     }
    //   ],
    // );

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('MON'),
              Text('TUE'),
              Text('WED'),
              Text('THU'),
              Text('FRI'),
              Text('SAT'),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: AttData[subjctNumber].atten['Mon'].length,
            itemBuilder: (ctx, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Checkbox(
                    onChanged: (v) {},
                    value: profile['Attendance'][subjctNumber.toString()]['Mon']
                                [index] ==
                            1
                        ? true
                        : false,
                  ),
                  Checkbox(
                    onChanged: (v) {},
                    value: profile['Attendance'][subjctNumber.toString()]['Tue']
                                [index] ==
                            1
                        ? true
                        : false,
                  ),
                  Checkbox(
                    onChanged: (v) {},
                    value: profile['Attendance'][subjctNumber.toString()]['Wed']
                                [index] ==
                            1
                        ? true
                        : false,
                  ),
                  Checkbox(
                    onChanged: (v) {},
                    value: profile['Attendance'][subjctNumber.toString()]['Thu']
                                [index] ==
                            1
                        ? true
                        : false,
                  ),
                  Checkbox(
                    onChanged: (v) {},
                    value: profile['Attendance'][subjctNumber.toString()]['Fri']
                                [index] ==
                            1
                        ? true
                        : false,
                  ),
                  Checkbox(
                    onChanged: (v) {},
                    value: profile['Attendance'][subjctNumber.toString()]['Sat']
                                [index] ==
                            1
                        ? true
                        : false,
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
