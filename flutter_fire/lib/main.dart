import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './models/MovieModel.dart';
import './widget/BuildScaffold.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        builder: (context, child) {
          return ScopedModel<MovieModel>(
            model: MovieModel(),
            child: child,
          );
        },
        home: BuildScaffold());
  }
}
