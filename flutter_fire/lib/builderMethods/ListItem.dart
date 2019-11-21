import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/MovieModel.dart';

Widget buildListTile(BuildContext context, DocumentSnapshot document) {
  final movieRef = ScopedModel.of<MovieModel>(context);
  return Dismissible(
    direction: DismissDirection.endToStart,
    confirmDismiss: (_) {
      return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('Are you sure?'),
                content: Text('You want to delete this?'),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      'No',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  FlatButton(
                    child: Text(
                      'Yes',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                ],
              ));
    },
    key: ValueKey(document),
    background: Container(
      color: Colors.red,
      alignment: Alignment.centerRight,
      child: Icon(
        Icons.delete,
        size: 25,
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(right: 20),
    ),
    onDismissed: (_) => movieRef.deleteMovie(document.documentID),
    child: InkWell(
      onTap: () => movieRef.updateCollection(document),
      child: ListTile(
          leading: Text(
            '${document['name']}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          trailing: CircleAvatar(
            child: Text(
              '${document['votes']}',
              style: TextStyle(fontSize: 20),
            ),
          )),
    ),
  );
}
