import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homelist/models/user/user.dart';

class FirestoreRepository {
  final database = FirebaseFirestore.instance;
  final StreamController<UserData?> userDataStream = StreamController();

  static const String _usersCollectionKey = 'users';

  FirestoreRepository();

  Future<void> createUser(UserData userData) async {
    try {
      final ref = database.collection(_usersCollectionKey).doc(userData.id);
      ref.set(userData.toJson());
      await ref.get().then(
            (value) => log(
              value.data().toString(),
            ),
          );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> getUserData(String uid) async {
    log("Getting User Data in Repository");
    final ref = database.collection(_usersCollectionKey).doc(uid);
    final userData = await ref.get();
    print('has Listener: ${userDataStream.hasListener}');
    userDataStream.add(
      UserData.fromJson(userData.data() as Map<String, Object?>),
    );
    log("Added to stream");
    //return UserData.fromJson(userData.data() as Map<String, Object?>);
  }
}
