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

Widget myCard(context, text, onTapped) => RaisedButton(
  onPressed: onTapped,
  elevation: 3,
  child: Container(child: Center(child: Text(text)), width: MediaQuery.of(context).size.width,),

);