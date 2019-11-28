import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../stream/index.dart';
import '../builderMethods/BottomModalSheet.dart';
import '../models/ThemeModel.dart';
import '../models/AuthModel.dart';
import '../builderMethods/BuildAppBar.dart';
import './Login.dart';

class HomeScreen extends StatefulWidget {
  static final routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didUpdateWidget(HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('asd');
    ScopedModelDescendant<AuthModel>(builder: (context, child, model) {
      model.getUser().then((user) {
        print(user);
        if (user == null) {
          Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
        }
      });
      return;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ScopedModel.of<ThemeChanger>(context);

    return Builder(
      builder: (ctx) => Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            icon: Icon(Icons.movie),
            label: Text("Add Movies"),
            onPressed: () => showBottomSheetModal(ctx, theme.isDarkMode),
          ),
          appBar: appBarWithThemeChanger(theme, 'Tap to vote for movies'),
          body: CustomStreamBuider()),
    );
  }
}
