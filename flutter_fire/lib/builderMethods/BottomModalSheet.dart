import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void addMovie(BuildContext ctx, String movieName) {
  if (movieName.isEmpty) {
    return;
  }
  final dbRef = Firestore.instance.collection('movies').document();
  Firestore.instance.runTransaction((transaction) async {
    DocumentSnapshot freshSnap = await transaction.get(dbRef);
    await transaction.set(freshSnap.reference, {'name': movieName, 'votes': 0});
    Navigator.of(ctx).pop();
  });
}

Future<void> showBottomSheetModal(
        BuildContext ctx, movieNameController, isDark) =>
    showModalBottomSheet(
        backgroundColor: isDark ? Colors.black : Colors.white,
        context: ctx,
        builder: (_) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(ctx).viewInsets.bottom + 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    controller: movieNameController,
                    decoration: InputDecoration(
                      labelText: 'Movie Name',
                      labelStyle: TextStyle(
                          color: isDark ? Colors.white : Colors.black),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  OutlineButton(
                    child: Text(
                      'Add',
                      style: TextStyle(
                          color: isDark ? Colors.white : Colors.black),
                    ),
                    onPressed: () => addMovie(ctx, movieNameController.text),
                    borderSide: BorderSide(color: Colors.purple, width: 2),
                  )
                ],
              ),
            ),
          );
        });
