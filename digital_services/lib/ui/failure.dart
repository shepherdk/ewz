import 'package:digital_services/utils/colors.dart';
import 'package:flutter/material.dart';


class Failure extends StatefulWidget {
  @override
  _FailureState createState() => _FailureState();
}

class _FailureState extends State<Failure> {
  @override
  Widget build(BuildContext context) {
    return Column(
              mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            Text('Failed to process request, it might mean you already registered before',
                            style: Theme.of(context).textTheme.title),
                            SizedBox(height: 40,),
            Container(
              child: Center(
                child: Icon(Icons.error, color: kShrineErrorRed,size: 100,)
              ),
            ),
        ],
      );
  }

}