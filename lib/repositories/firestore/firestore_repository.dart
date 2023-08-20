import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homelist/models/list/list.dart';
import 'package:homelist/models/list/list_item.dart';
import 'package:homelist/models/user/user.dart';

class FirestoreRepository {
  final database = FirebaseFirestore.instance;
  final _listsCollection = FirebaseFirestore.instance.collection(
    _listsCollectionKey,
  );
  final _usersCollection = FirebaseFirestore.instance.collection(
    _usersCollectionKey,
  );
  final StreamController<UserData?> userDataStream = StreamController();

  static const String _usersCollectionKey = 'users';
  static const String _listsCollectionKey = 'lists';

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
    final ref = database.collection(_usersCollectionKey).doc(uid);
    final userData = await ref.get();
    userDataStream.add(
      UserData.fromJson(userData.data() as Map<String, Object?>),
    );
  }

  Future<Stream<List<SharedList>>> getUserListsStream(String ownerId) async {
    return _listsCollection
        .where('ownerId', isEqualTo: ownerId)
        .snapshots()
        .map(
          (querySnapshots) => querySnapshots.docs
              .map(
                (e) => SharedList.fromJson(
                  e.data(),
                ),
              )
              .toList(),
        );
  }

  Future<Stream<List<SharedList>>> getSharedListsStream(
    String currentUserId,
  ) async {
    return _listsCollection
        .where('allowedUsersIds', arrayContains: currentUserId)
        .snapshots()
        .map(
          (querySnapshots) => querySnapshots.docs
              .map(
                (e) => SharedList.fromJson(
                  e.data(),
                ),
              )
              .toList(),
        );
  }

  Stream<SharedList?> getCurrentListStream(String listId) {
    return _listsCollection.doc(listId).snapshots().map((querySnapshot) {
      if (querySnapshot.data() == null) {
        return null;
      }
      return SharedList.fromJson(
        querySnapshot.data() as Map<String, Object?>,
      );
    });
  }

  Stream<List<UserData>> getUsersToShareStream(
    String currentUserId,
    SharedList currentList,
  ) {
    return _usersCollection
        .where(
          'id',
          whereNotIn: [
            currentUserId,
            ...currentList.allowedUsersIds,
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

  Future<void> createList(SharedList newList) async {
    try {
      final ref = database.collection(_listsCollectionKey).doc();
      final finalList = newList.copyWith(id: ref.id);
      ref.set(finalList.toJson());
      await ref.get().then(
            (value) => log(
              value.data().toString(),
            ),
          );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> addListItem(SharedList currentList, ListItem newListItem) async {
    try {
      final currentListDocumentRef = database
          .collection(
            _listsCollectionKey,
          )
          .doc(
            currentList.id,
          );
      database.runTransaction(
        (transaction) {
          return transaction.get(currentListDocumentRef).then(
            (currentListDocument) {
              final items = currentListDocument.get('items') as List;
              items.add(
                newListItem.toJson(),
              );
              transaction.update(
                currentListDocumentRef,
                {'items': items},
              );
            },
          );
        },
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> editListItem(
    SharedList currentList,
    ListItem editedItem,
  ) async {
    try {
      final currentListDocumentRef = database
          .collection(
            _listsCollectionKey,
          )
          .doc(
            currentList.id,
          );

      database.runTransaction(
        (transaction) {
          return transaction.get(currentListDocumentRef).then(
            (currentListDocument) {
              List items = currentListDocument.get('items') as List;
              final castItems = items
                  .map(
                    (e) => ListItem.fromJson(e),
                  )
                  .toList();

              final currentItem = castItems.firstWhere(
                (element) => element.id == editedItem.id,
              );

              final currentItemIndex = castItems.indexOf(currentItem);

              castItems.replaceRange(
                currentItemIndex,
                currentItemIndex + 1,
                [editedItem],
              );

              final itemsToUpdate = castItems.map(
                (e) => e.toJson(),
              );

              transaction.update(
                currentListDocumentRef,
                {'items': itemsToUpdate},
              );
            },
          );
        },
      );
    } catch (e) {
      log(
        e.toString(),
      );
    }
  }

  Future<void> removeListItem(
    SharedList currentList,
    ListItem itemToDelete,
  ) async {
    final currentListDocumentRef = database
        .collection(
          _listsCollectionKey,
        )
        .doc(
          currentList.id,
        );

    database.runTransaction(
      (transaction) {
        return transaction.get(currentListDocumentRef).then(
          (currentListDocument) {
            List items = currentListDocument.get('items') as List;
            final castItems = items
                .map(
                  (e) => ListItem.fromJson(e),
                )
                .toList();
            castItems.remove(itemToDelete);

            final itemsToUpdate = castItems.map(
              (e) => e.toJson(),
            );

            transaction.update(
              currentListDocumentRef,
              {'items': itemsToUpdate},
            );
          },
        );
      },
    );
  }

  Future<void> shareListToUsers(
    SharedList currentList,
    List<String> usersToShareWith,
  ) async {
    try {
      final currentListDocumentRef = database
          .collection(
            _listsCollectionKey,
          )
          .doc(
            currentList.id,
          );
      database.runTransaction(
        (transaction) {
          return transaction.get(currentListDocumentRef).then(
            (currentListDocument) {
              final currentList = SharedList.fromJson(
                currentListDocument.data() as Map<String, Object?>,
              );

              final updatedAllowedUsersList = [
                ...currentList.allowedUsersIds,
                ...usersToShareWith
              ];

              final updatedAllowedUsersListDistinct =
                  updatedAllowedUsersList.toSet().toList();

              transaction.update(currentListDocumentRef, {
                'allowedUsersIds': updatedAllowedUsersListDistinct,
              });
            },
          );
        },
      );
    } catch (e) {
      log(
        e.toString(),
      );
    }
  }
}
