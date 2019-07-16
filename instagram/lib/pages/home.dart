import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.camera_alt),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.web_asset),
            onPressed: () {},
          ),
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.send),
            onPressed: () {},
          ),
        ],
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        title: Text(
          'Instagram',
          style: TextStyle(color: Colors.black, fontFamily: 'Pacifico'),
        ),
      ),
      body: Center(
        child: Column(),
      ),
    );
  }
}
