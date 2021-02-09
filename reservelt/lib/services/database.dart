import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Database {

  final String uid;
  Database({ this.uid });

  final CollectionReference reserveCollection= FirebaseFirestore.instance.collection('reserves');

  Future updateUserData(String name, String sex, String city, String locality, int radius, String time) async {
    return await reserveCollection.doc(uid).set({
      'name':name,
      'sex':sex,
      'city':city,
      'locality':locality,
      'radius':radius,
      'time':time,
    });

  }
  //
  Stream<QuerySnapshot> get brews {
    return reserveCollection.snapshots();
  }
}