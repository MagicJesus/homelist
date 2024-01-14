// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_repository/user_repository.dart';

abstract class UsersRepositoryGeneralFailure implements Exception {
  UsersRepositoryGeneralFailure(this.error);

  final Object? error;
}

class CreateUserFailure extends UsersRepositoryGeneralFailure {
  CreateUserFailure(super.error);
}

class GetUserDataFailure extends UsersRepositoryGeneralFailure {
  GetUserDataFailure(super.error);
}

class GetUsersToShareStreamFailure extends UsersRepositoryGeneralFailure {
  GetUsersToShareStreamFailure(super.error);
}

class UsersRepository {
  final CollectionReference<Map<String, dynamic>> _usersCollection =
      FirebaseFirestore.instance.collection(
    _usersCollectionKey,
  );

  static const String _usersCollectionKey = 'users';

  final StreamController<UserData?> userDataStream =
      StreamController<UserData?>();

  Future<void> createUser(UserData userData) async {
    try {
      final DocumentReference<Map<String, dynamic>> ref =
          _usersCollection.doc(userData.id);
      await ref.set(userData.toJson());
      await ref.get().then(
            (DocumentSnapshot<Map<String, dynamic>> value) => log(
              value.data().toString(),
            ),
          );
    } on FirebaseException catch (e, stackTrace) {
      Error.throwWithStackTrace(CreateUserFailure(e), stackTrace);
    }
  }

  Future<void> getUserData(String uid) async {
    final DocumentReference<Map<String, dynamic>> ref =
        _usersCollection.doc(uid);
    final DocumentSnapshot<Map<String, dynamic>> userRef = await ref.get();
    final Map<String, dynamic>? userData = userRef.data();

    if (userData != null) {
      userDataStream.add(
        UserData.fromJson(userData),
      );
    }
  }

  Future<Stream<List<UserData>>> getUsersToShareStream(
    String currentUserId,
    List<String> usersToExclude,
  ) async {
    return _usersCollection
        .where(
          'id',
          whereNotIn: <Object?>[
            currentUserId,
            ...usersToExclude,
          ],
        )
        .snapshots()
        .map(
          (QuerySnapshot<Map<String, dynamic>> querySnapshot) {
            return querySnapshot.docs.map(
              (QueryDocumentSnapshot<Map<String, dynamic>> userData) {
                final UserData user = UserData.fromJson(
                  userData.data(),
                );

                return user;
              },
            ).toList();
          },
        );
  }
}
