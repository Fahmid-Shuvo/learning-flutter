import 'package:flutter/material.dart';
import '../builderMethods/BottomModalSheet.dart';
import '../stream/index.dart';

class BuildScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.movie),
          label: Text("Add Movies"),
          onPressed: () => showBottomSheetModal(context),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Tap to Vote for Movie'),
        ),
        body: CustomStreamBuider());
  }
}
