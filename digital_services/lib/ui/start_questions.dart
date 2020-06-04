import 'package:digital_services/ui/device.dart';
import 'package:digital_services/ui/q_age.dart';
import 'package:digital_services/ui/q_data.dart';
import 'package:digital_services/ui/q_favorite_bundle.dart';
import 'package:digital_services/ui/q_sms.dart';
import 'package:digital_services/ui/q_voice.dart';
import 'package:digital_services/utils/colors.dart';
import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        leading: Icon(Icons.menu),
        title: Text('EWZ'),
        centerTitle: true,
      ),
      body: QBody(),
    );
  }
}

class QBody extends StatefulWidget {
  @override
  _QBodyState createState() => _QBodyState();
}

class _QBodyState extends State<QBody> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 24),
        LinearProgressIndicator(value: (index+1/6), backgroundColor: kShrinePink50,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: SingleChildScrollView(
                          child: IndexedStack(
                index: 0, //_store this value in provider
                children: <Widget>[
                  SMS(),
                  DataPage(),
                  Voice(),
                  Device(),
                  Bundle(),
                  Age(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

// Widget progressRow(int currentIndex, len) {
//   List<Widget> icons = List.generate(
//       len,
//           (index) => index <= currentIndex
//           ? Icon(HRIcons.circle, color: Strings.hrPurplePrimary, size: 14)
//           : Icon(HRIcons.circle_thin,
//           color: Strings.hrPurplePrimary, size: 14));
//   return FractionallySizedBox(
//     widthFactor: 0.6,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: icons,
//     ),
//   );
// }