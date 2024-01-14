import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homelist/models/list/list.dart';
import 'package:homelist/models/list/list_item.dart';
import 'package:user_repository/user_repository.dart';

class FirestoreRepository {
  FirestoreRepository();
  final FirebaseFirestore database = FirebaseFirestore.instance;
  final CollectionReference<Map<String, dynamic>> _listsCollection =
      FirebaseFirestore.instance.collection(
    _listsCollectionKey,
  );
  final CollectionReference<Map<String, dynamic>> _usersCollection =
      FirebaseFirestore.instance.collection(
    _usersCollectionKey,
  );

  static const String _usersCollectionKey = 'users';
  static const String _listsCollectionKey = 'lists';

  Future<Stream<List<SharedList>>> getUserListsStream(String ownerId) async {
    return _listsCollection
        .where('ownerId', isEqualTo: ownerId)
        .snapshots()
        .map(
          (QuerySnapshot<Map<String, dynamic>> querySnapshots) =>
              querySnapshots.docs
                  .map(
                    (QueryDocumentSnapshot<Map<String, dynamic>> e) =>
                        SharedList.fromJson(
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
          (QuerySnapshot<Map<String, dynamic>> querySnapshots) =>
              querySnapshots.docs
                  .map(
                    (QueryDocumentSnapshot<Map<String, dynamic>> e) =>
                        SharedList.fromJson(
                      e.data(),
                    ),
                  )
                  .toList(),
        );
  }

  Stream<SharedList?> getCurrentListStream(String listId) {
    return _listsCollection
        .doc(listId)
        .snapshots()
        .map((DocumentSnapshot<Map<String, dynamic>> querySnapshot) {
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
          whereNotIn: <Object?>[
            currentUserId,
            ...currentList.allowedUsersIds,
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

  Future<void> createList(SharedList newList) async {
    try {
      final DocumentReference<Map<String, dynamic>> ref =
          database.collection(_listsCollectionKey).doc();
      final SharedList finalList = newList.copyWith(id: ref.id);
      await ref.set(finalList.toJson());
      await ref.get().then(
            (DocumentSnapshot<Map<String, dynamic>> value) => log(
              value.data().toString(),
            ),
          );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> addListItem(SharedList currentList, ListItem newListItem) async {
    try {
      final DocumentReference<Map<String, dynamic>> currentListDocumentRef =
          database
              .collection(
                _listsCollectionKey,
              )
              .doc(
                currentList.id,
              );
      await database.runTransaction(
        (Transaction transaction) {
          return transaction.get(currentListDocumentRef).then(
            (DocumentSnapshot<Map<String, dynamic>> currentListDocument) {
              final List<dynamic> items =
                  currentListDocument.get('items') as List<dynamic>;
              items.add(
                newListItem.toJson(),
              );
              transaction.update(
                currentListDocumentRef,
                <String, dynamic>{'items': items},
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
      final DocumentReference<Map<String, dynamic>> currentListDocumentRef =
          database
              .collection(
                _listsCollectionKey,
              )
              .doc(
                currentList.id,
              );

      await database.runTransaction(
        (Transaction transaction) {
          return transaction.get(currentListDocumentRef).then(
            (DocumentSnapshot<Map<String, dynamic>> currentListDocument) {
              final List<Map<String, Object?>> items = currentListDocument
                  .get('items') as List<Map<String, Object?>>;
              final List<ListItem> castItems = items
                  .map(
                    ListItem.fromJson,
                  )
                  .toList();

              final ListItem currentItem = castItems.firstWhere(
                (ListItem element) => element.id == editedItem.id,
              );

              final int currentItemIndex = castItems.indexOf(currentItem);

              castItems.replaceRange(
                currentItemIndex,
                currentItemIndex + 1,
                <ListItem>[editedItem],
              );

              final Iterable<Map<String, dynamic>> itemsToUpdate =
                  castItems.map(
                (ListItem e) => e.toJson(),
              );

              transaction.update(
                currentListDocumentRef,
                <String, dynamic>{'items': itemsToUpdate},
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
    final DocumentReference<Map<String, dynamic>> currentListDocumentRef =
        database
            .collection(
              _listsCollectionKey,
            )
            .doc(
              currentList.id,
            );

    await database.runTransaction(
      (Transaction transaction) {
        return transaction.get(currentListDocumentRef).then(
          (DocumentSnapshot<Map<String, dynamic>> currentListDocument) {
            final List<dynamic> items =
                currentListDocument.get('items') as List<dynamic>;

            final List<Map<String, Object?>> itemsMap =
                items.map((dynamic e) => e as Map<String, Object?>).toList();

            final List<ListItem> castItems = itemsMap
                .map(
                  ListItem.fromJson,
                )
                .toList()
              ..remove(itemToDelete);

            final Iterable<Map<String, dynamic>> itemsToUpdate = castItems.map(
              (ListItem e) => e.toJson(),
            );

            transaction.update(
              currentListDocumentRef,
              <String, dynamic>{'items': itemsToUpdate},
            );
          },
        );
      },
    );
  }

  Future<void> shareListToUsers(
    SharedList currentList,
    List<UserData> usersToShareWith,
  ) async {
    try {
      final DocumentReference<Map<String, dynamic>> currentListDocumentRef =
          database
              .collection(
                _listsCollectionKey,
              )
              .doc(
                currentList.id,
              );
      await database.runTransaction(
        (Transaction transaction) {
          return transaction.get(currentListDocumentRef).then(
            (DocumentSnapshot<Map<String, dynamic>> currentListDocument) {
              final SharedList currentList = SharedList.fromJson(
                currentListDocument.data()!,
              );

              final List<String> updatedAllowedUsersList = <String>[
                ...currentList.allowedUsersIds,
                ...usersToShareWith.map((UserData e) => e.id)
              ];

              final List<String> updatedAllowedUsersListDistinct =
                  updatedAllowedUsersList.toSet().toList();

              transaction.update(currentListDocumentRef, <String, dynamic>{
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
