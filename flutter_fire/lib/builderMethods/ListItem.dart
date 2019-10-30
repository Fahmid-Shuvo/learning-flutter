import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Widget buildListTile(BuildContext context, DocumentSnapshot document) {
  return InkWell(
    onTap: () {
      Firestore.instance.runTransaction((transaction) async {
        DocumentSnapshot freshSnap = await transaction.get(document.reference);
        await transaction
            .update(freshSnap.reference, {'votes': freshSnap['votes'] + 1});
      });
    },
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
  );
}
