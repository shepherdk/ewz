import 'package:digital_services/ui/shared_widgets.dart';
import 'package:digital_services/utils/providers.dart';
import 'package:digital_services/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bundle extends StatefulWidget {
  @override
  _BundleState createState() => _BundleState();
}

class _BundleState extends State<Bundle> {
  @override
  Widget build(BuildContext context) {
    return Column(
            children: <Widget>[
              SizedBox(height: 12),
              Text('What\'s your most sought after bundle?',
                            style: Theme.of(context).textTheme.headline),
              SizedBox(height: 10),
              myCard(context, 'Whatsapp', () => _goTo(1)),
              myCard(context, 'Facebook', () => _goTo(2)),
              myCard(context, 'SMS', () => _goTo(3)),

            ],
        );
  }

    _goTo(int id) {
    Provider.of<SurveyAnswers>(context, listen: false).bundle = id;
    Provider.of<Progress>(context, listen: false).index = 5;
print('${Provider.of<Progress>(context, listen: false).index}');
    // Navigator.pushNamed(context, Strings.ageRoute);
  }
}