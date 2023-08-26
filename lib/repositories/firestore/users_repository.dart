import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homelist/models/user/user.dart';

class UsersRepository {
  final database = FirebaseFirestore.instance;
  final _usersCollection = FirebaseFirestore.instance.collection(
    _usersCollectionKey,
  );

  static const String _usersCollectionKey = 'users';

  UsersRepository();

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
