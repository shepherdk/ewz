import 'package:flutter/material.dart';

Widget skButton({String label: "Opt in", Function onPress}) {
  return RaisedButton(
    onPressed: onPress,
    elevation: 20,
    child: Padding(
      padding: EdgeInsets.all(12),
      child: Text(label, style: TextStyle(
        fontSize: 24,
      ),),
    ),
    color: Colors.blueAccent,
    textColor: Colors.white,
  );
}

Widget myCard(context, text, onTapped) => Card(
//                color: Colors.blue,
              elevation: 4,
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: onTapped,
                      child: Container(
                        child: Text(text,
                        style: Theme.of(context).textTheme.subhead),  
                      ),
                    ),
                  ),
                ],
                ),
              );