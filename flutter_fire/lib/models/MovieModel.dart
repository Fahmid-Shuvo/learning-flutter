import 'dart:io';
import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';

class MovieModel extends Model {
  static MovieModel of(BuildContext context) =>
      ScopedModel.of<MovieModel>(context);

  Stream<QuerySnapshot> get getMovies =>
      Firestore.instance.collection('movies').orderBy('name').snapshots();

  void deleteMovie(id) {
    Firestore.instance.collection('movies').document(id).delete();
    notifyListeners();
  }

  void addMovie(String movieName) {
    if (movieName.isEmpty) {
      return;
    }
    final documentRef = Firestore.instance.collection('movies').document();
    Firestore.instance.runTransaction((transaction) async {
      DocumentSnapshot freshSnap = await transaction.get(documentRef);
      await transaction.set(freshSnap.reference,
          {'name': movieName, 'votes': 0, 'votes_from': []});
    });
    notifyListeners();
  }

  Future<dynamic> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return (androidInfo.androidId);
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return (iosInfo.identifierForVendor);
    }
  }

  void updateCollection(document) async {
    var deviceId = await getDeviceId();

    Firestore.instance.runTransaction((transaction) async {
      DocumentSnapshot freshSnap = await transaction.get(document.reference);
      List<dynamic> votes = freshSnap['votes_from'];
      final alreadyVoted = votes.where((item) {
        // var votedAt = item['voted_at'].toString();
        // var currentDate = DateTime.now().toString().split(' ')[0].toString();
        if (item['device_id'].toString() == deviceId) {
          // if (votedAt == currentDate) {
          //   return true;
          // }
          return true;
        }
        return false;
      });
      if (alreadyVoted.isNotEmpty) {
        return;
      }

      await transaction.update(freshSnap.reference, {
        'votes': freshSnap['votes'] + 1,
        'votes_from': FieldValue.arrayUnion([
          {
            'device_id': deviceId,
            'voted_at': DateTime.now().toString().split(' ')[0].toString()
          }
        ])
        //  [
        //   {'device_id': deviceId, 'voted_at': DateTime.now()}
        // ]
      });
    });
    notifyListeners();
  }
}
