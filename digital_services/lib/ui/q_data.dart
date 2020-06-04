import 'package:digital_services/ui/shared_widgets.dart';
import 'package:digital_services/utils/providers.dart';
import 'package:digital_services/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataPage extends StatefulWidget {
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
            children: <Widget>[
              SizedBox(height: 24),
              Text('What\'s your monthly spend on data?',
                            style: Theme.of(context).textTheme.headline),
              SizedBox(height: 10),
              myCard(context, '\$0 - \$5', () =>_goTo(1)),
              myCard(context, '\$6 - \$15',() =>_goTo(2)),
              myCard(context, '\$16 - \$25', () =>_goTo(3)),
              myCard(context, '\$26 and above', () =>_goTo(4)),

            ],
        );
  }

    _goTo(int id) {
    Provider.of<SurveyAnswers>(context, listen: false).data = id;
        Provider.of<Progress>(context, listen: false).index = 2;
    // Navigator.pushNamed(context, Strings.voiceRoute);
  }

}