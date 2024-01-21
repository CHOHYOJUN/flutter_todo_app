import 'package:cloud_firestore_odm/annotation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 파이어베이스
import 'package:firebase_core/firebase_core.dart';

/// 파이어베이스 - 파이어스토어
import 'package:cloud_firestore/cloud_firestore.dart';

/// 파이어베이스 - ODM - Object Document Mapper
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart' as odm;

import '../data/model/user.dart';

@Collection<User>('users')
class OdmTest with ChangeNotifier {

  // Firestore 인스턴스 가져오기
  // FirebaseFirestore firestore = FirebaseFirestore.instance;

  final usersRef = FirebaseFirestore.instance.collection('users').withConverter<User>(
      fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
      toFirestore: (user, _) => user.toJson(),
  );


  Future<void> addData() async {
    print('-- add() --');
    final newUser = User(age: 10,email:'test@test.com' ,name: 'messi');

    final querySnapshot = await usersRef.add(newUser);
    print(querySnapshot.toString());
    notifyListeners();
  }

  Future<void> getData() async {
    print('-- get() --');
    List<QueryDocumentSnapshot<User>> users = await usersRef.get().then((snapshot) => snapshot.docs);
    users.forEach((element) {
      print(element.data().toString());
    });

    notifyListeners();
  }


}