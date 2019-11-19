import 'package:flutter/material.dart';
import 'package:day_night_switch/day_night_switch.dart';
import 'package:scoped_model/scoped_model.dart';

import './builderMethods/BottomModalSheet.dart';
import './stream/index.dart';
import './models/MovieModel.dart';

void main() => runApp(MyHomePage());

void showBottomModal(BuildContext ctx, bool isDark) {
  final movieNameController = TextEditingController();
  showBottomSheetModal(ctx, movieNameController, isDark);
}

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
          brightness: !switchThemeValue ? Brightness.light : Brightness.dark),
      home: Builder(
        builder: (ctx) => Scaffold(
            floatingActionButton: FloatingActionButton.extended(
              icon: Icon(Icons.movie),
              label: Text("Add Movies"),
              onPressed: () => showBottomModal(ctx, switchThemeValue),
            ),
            appBar: AppBar(
              actions: <Widget>[
                Container(
                  child: Transform.scale(
                    scale: 0.3,
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
            body: ScopedModel<MovieModel>(
                model: MovieModel(), child: CustomStreamBuider())),
      ),
    );
  }
}
