// ignore_for_file: public_member_api_docs

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_repository/user_repository.dart';

class UsersRepository {
  final _usersCollection = FirebaseFirestore.instance.collection(
    _usersCollectionKey,
  );

  static const String _usersCollectionKey = 'users';

  Future<Stream<List<UserData>>> getUsersToShareStream(
    String currentUserId,
    List<String> usersToExclude,
  ) async {
    return _usersCollection
        .where(
          'id',
          whereNotIn: [
            currentUserId,
            ...usersToExclude,
          ],
        )
        .snapshots()
        .map(
          (querySnapshot) {
            return querySnapshot.docs.map(
              (userData) {
                final user = UserData.fromJson(
                  userData.data(),
                );

                return user;
              },
            ).toList();
          },
        );
  }
}
