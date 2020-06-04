import 'package:digital_services/ui/device.dart';
import 'package:digital_services/ui/failure.dart';
import 'package:digital_services/ui/q_age.dart';
import 'package:digital_services/ui/q_data.dart';
import 'package:digital_services/ui/q_favorite_bundle.dart';
import 'package:digital_services/ui/q_sms.dart';
import 'package:digital_services/ui/q_voice.dart';
import 'package:digital_services/ui/success.dart';
import 'package:digital_services/utils/colors.dart';
import 'package:digital_services/utils/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Provider.of<Progress>(context, listen: true).index <= 5 ? Text('Question ${Provider.of<Progress>(context, listen: true).index+1} of 6'): SizedBox(),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width* 0.9,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IndexedStack(
                index: Provider.of<Progress>(context, listen: false).index.toInt(), //_store this value in provider
                children: <Widget>[
                  SMS(),
                  DataPage(),
                  Voice(),
                  Device(),
                  Bundle(),
                  Age(),
                  Success(),
                  Failure()
                ],
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