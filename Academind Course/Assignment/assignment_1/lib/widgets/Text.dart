import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String _mainText;

  TextWidget(this._mainText);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(_mainText));
  }
}
