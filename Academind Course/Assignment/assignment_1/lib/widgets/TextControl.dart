import 'package:flutter/material.dart';
import './Text.dart';

class TextControl extends StatefulWidget {
  @override
  _TextControlState createState() => _TextControlState();
}

class _TextControlState extends State<TextControl> {
  String _mainText = 'This is main text';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Change Text'),
              onPressed: () {
                setState(() {
                  _mainText = 'This is change';
                });
              },
            ),
            TextWidget(_mainText)
          ],
        ),
      ),
    );
  }
}
