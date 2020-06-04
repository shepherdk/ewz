import 'package:digital_services/ui/shared_widgets.dart';
import 'package:digital_services/utils/providers.dart';
import 'package:digital_services/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Voice extends StatefulWidget {
  @override
  _VoiceState createState() => _VoiceState();
}

class _VoiceState extends State<Voice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.grey[200],
          body: Column(
            children: <Widget>[
              SizedBox(height: 24),
              Padding(padding: EdgeInsets.all(10),child:LinearProgressIndicator( value:  0.45,)),
              SizedBox(height: 12),
              Text('What\'s your monthly spend on voice?',
                            style: Theme.of(context).textTheme.headline),
              SizedBox(height: 10),
              myCard(context, '\$0 - \$5', () => _goTo(1)),
              myCard(context, '\$6 - \$15', () => _goTo(2)),
              myCard(context, '\$16 - \$25', () => _goTo(3)),
              myCard(context, '\$26 and above', () => _goTo(4)),

            ],
        ),
    );
  }

      _goTo(int id) {
    Provider.of<SurveyAnswers>(context, listen: false).voice = id;
        Provider.of<Progress>(context, listen: false).index = 3;

   // Navigator.pushNamed(context, Strings.deviceRoute);
  }

}