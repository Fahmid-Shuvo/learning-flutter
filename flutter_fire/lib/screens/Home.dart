import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../stream/index.dart';
import '../builderMethods/BottomModalSheet.dart';
import '../models/ThemeModel.dart';
import '../builderMethods/BuildAppBar.dart';

class Home extends StatelessWidget {
  static final routeName = '/home';

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
