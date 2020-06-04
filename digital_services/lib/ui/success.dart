import 'package:flutter/material.dart';


class Success extends StatefulWidget {
  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Column(
              mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            Text('You have been successfully added',
                            style: Theme.of(context).textTheme.title),
                            SizedBox(height: 40,),
            Container(
              child: Center(
                child: Icon(Icons.check_circle_outline, color: Colors.green,size: 100,)
              ),
            ),
        ],
      );
  }

}