import 'package:digital_services/ui/shared_widgets.dart';
import 'package:digital_services/utils/providers.dart';
import 'package:digital_services/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SMSPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SMS();
  }
}
class SMS extends StatefulWidget {
  @override
  _SMSState createState() => _SMSState();
}

class _SMSState extends State<SMS> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
              children: <Widget>[
                SizedBox(height: 12),
                Text('What\'s your monthly spend on sms?',
                              style: Theme.of(context).textTheme.headline),
                SizedBox(height: 24),
                myCard(context, '\$0 - \$5', () { _goTo(1);}),
                myCard(context, '\$6 - \$15', () {_goTo(2);}),
                myCard(context, '\$16 - \$25', () {_goTo(3);}),
                myCard(context, '\$26 and above', () {_goTo(4);}),

              ],
          ),
    );
  }

  _goTo(int id) {
    print("id = $id");
    Provider.of<SurveyAnswers>(context, listen: false).sms = id;
    setState(() {
    Provider.of<Progress>(context, listen: false).index = 1;  
    print(Provider.of<Progress>(context, listen: false).index);
    });
    // Navigator.pushNamed(context, Strings.dataRoute);
  }
}