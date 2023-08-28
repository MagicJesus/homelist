import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homelist/models/expenses/expense_group/expense_group.dart';
import 'package:homelist/models/user/user.dart';

class ExpensesRepository {
  final database = FirebaseFirestore.instance;
  final _expenseGroupsCollection = FirebaseFirestore.instance.collection(
    _expenseGroupsCollectionKey,
  );

  static const String _expenseGroupsCollectionKey = 'expenseGroups';

  ExpensesRepository();

  Future<Stream<ExpenseGroup>> getCurrentExpenseGroupStream(
    ExpenseGroup currentExpenseGroup,
  ) async {
    return _expenseGroupsCollection
        .doc(
          currentExpenseGroup.id,
        )
        .snapshots()
        .map(
          (expenseGroupSnapshot) => ExpenseGroup.fromJson(
            expenseGroupSnapshot.data() as Map<String, Object?>,
          ),
        );
  }

  Future<List<ExpenseGroup>> getAllExpenseGroups(UserData currentUser) async {
    final querySnapshot = await _expenseGroupsCollection
        .where('members', arrayContains: currentUser.toJson())
        .get();

    List<ExpenseGroup> expenseGroups = [];
    for (var docSnapshot in querySnapshot.docs) {
      expenseGroups.add(
        ExpenseGroup.fromJson(
          docSnapshot.data(),
        ),
      );
    }
    return expenseGroups;
  }

  Future<void> addUsersToExpenseGroup(
    ExpenseGroup currentExpenseGroup,
    List<UserData> usersToShareWith,
  ) async {
    try {
      final currentExpenseGroupDocumentRef = database
          .collection(
            _expenseGroupsCollectionKey,
          )
          .doc(
            currentExpenseGroup.id,
          );
      database.runTransaction(
        (transaction) {
          return transaction.get(currentExpenseGroupDocumentRef).then(
            (_) {
              final updatedMembersList = [
                ...currentExpenseGroup.members,
                ...usersToShareWith
              ];

              final updatedMembersListDistinct =
                  updatedMembersList.toSet().toList().map(
                        (e) => e.toJson(),
                      );

              transaction.update(currentExpenseGroupDocumentRef, {
                'members': updatedMembersListDistinct,
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

  Future<void> addExpenseGroup(
    String currentUserId,
    String newGroupName,
  ) async {}
}
