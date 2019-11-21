import 'package:flutter/material.dart';
import 'package:day_night_switch/day_night_switch.dart';
import 'package:scoped_model/scoped_model.dart';

import './builderMethods/BottomModalSheet.dart';
import './stream/index.dart';
import './models/MovieModel.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      theme: ThemeData(
          primarySwatch: Colors.red,
          brightness: !isDarkMode ? Brightness.light : Brightness.dark),
      home: ScopedModel<MovieModel>(
        model: MovieModel(),
        child: Builder(
          builder: (ctx) => Scaffold(
              floatingActionButton: FloatingActionButton.extended(
                backgroundColor: isDarkMode ? Colors.yellow : Colors.red,
                icon: Icon(Icons.movie),
                label: Text("Add Movies"),
                onPressed: () => showBottomSheetModal(ctx, isDarkMode),
              ),
              appBar: AppBar(
                actions: <Widget>[
                  Container(
                    child: Transform.scale(
                      scale: 0.3,
                      child: DayNightSwitch(
                        value: isDarkMode,
                        onChanged: (value) {
                          setState(() {
                            isDarkMode = value;
                          });
                        },
                      ),
                    ),
                  )
                ],
                centerTitle: true,
                title: Text('Tap to Vote for Movie'),
              ),
              body: CustomStreamBuider()),
        ),
      ),
    );
  }
}
