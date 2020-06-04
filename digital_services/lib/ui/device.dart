import 'package:digital_services/ui/shared_widgets.dart';
import 'package:digital_services/utils/providers.dart';
import 'package:digital_services/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Device extends StatefulWidget {
  @override
  _DeviceState createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
  @override
  Widget build(BuildContext context) {
    return Column(
            children: <Widget>[
              SizedBox(height: 24), 
              Text('What\'s your device type?',
                            style: Theme.of(context).textTheme.headline),
              SizedBox(height: 10),
              myCard(context, '2G', () => _goTo(1)),
              myCard(context, '3G', () => _goTo(2)),
              myCard(context, '4G', () => _goTo(3)),

            ],
        );
  }

    _goTo(int id) {
    Provider.of<SurveyAnswers>(context, listen: false).device = id;
    Navigator.pushNamed(context, Strings.favoriteBundleRoute);
  }
}