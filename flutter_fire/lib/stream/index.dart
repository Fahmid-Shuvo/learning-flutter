import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:scoped_model/scoped_model.dart';

import '../builderMethods/ListItem.dart';
// import '../models//MovieModel.dart';

class CustomStreamBuider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final moviesRef = ScopedModel.of<MovieModel>(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance
              .collection('movies')
              .orderBy('name')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            if (snapshot.data.documents.isEmpty)
              return Center(
                child: Text('No movies added, Add one'),
              );
            return ListView.separated(
              separatorBuilder: (_, index) => Divider(),
              itemCount: snapshot.data.documents.length,
              itemBuilder: (ctx, index) =>
                  buildListTile(context, snapshot.data.documents[index]),
            );
          }),
    );
  }
}
