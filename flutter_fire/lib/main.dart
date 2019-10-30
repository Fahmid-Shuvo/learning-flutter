import 'package:flutter/material.dart';
import 'package:day_night_switch/day_night_switch.dart';

import './stream/index.dart';
import './builderMethods/BottomModalSheet.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var switchThemeValue = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.red,
          brightness:
              switchThemeValue == false ? Brightness.light : Brightness.dark),
      home: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            icon: Icon(Icons.movie),
            label: Text("Add Movies"),
            onPressed: () => showBottomModal(context),
          ),
          appBar: AppBar(
            actions: <Widget>[
              Container(
                child: Transform.scale(
                  scale: 0.5,
                  child: DayNightSwitch(
                    value: switchThemeValue,
                    onChanged: (value) {
                      setState(() {
                        switchThemeValue = value;
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
    );
  }
}

void showBottomModal(BuildContext ctx) {
  final movieNameController = TextEditingController();

  showBottomSheetModal(ctx, movieNameController);
}
