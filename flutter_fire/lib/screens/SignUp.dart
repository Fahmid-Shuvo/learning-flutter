import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../builderMethods/BuildAppBar.dart';
import '../models/ThemeModel.dart';
import './Home.dart';

class SignUpScreen extends StatelessWidget {
  static final routeName = '/sign-up';

  @override
  Widget build(BuildContext context) {
    final theme = ScopedModel.of<ThemeChanger>(context);
    return Scaffold(
      appBar: appBarWithThemeChanger(theme, 'Login'),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 25),
              child: Text(
                'Come back',
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(labelText: 'Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(labelText: 'Password'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.center,
                child: FlatButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                  child: Text(
                    'Let me in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Home.routeName);
                  },
                  color: Colors.green,
                  textColor: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Or log in via',
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton.icon(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  icon: Icon(
                    FontAwesomeIcons.facebookF,
                    size: 20,
                  ),
                  color: Color(0xFF3b5998),
                  textColor: Colors.white,
                  label: Text(
                    'Facebook',
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 20,
                ),
                FlatButton.icon(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  icon: Icon(
                    FontAwesomeIcons.google,
                    size: 20,
                  ),
                  color: Colors.red,
                  textColor: Colors.white,
                  label: Text(
                    'Google',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
    ;
  }
}
