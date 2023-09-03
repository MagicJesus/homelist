import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homelist/models/expenses/expense/expense.dart';
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

  Stream<List<ExpenseGroup>> getAllExpenseGroupsStream(
    UserData currentUser,
  ) {
    return _expenseGroupsCollection
        .where('members', arrayContains: currentUser.toJson())
        .snapshots()
        .map(
          (expenseGroupQuerySnapshot) => expenseGroupQuerySnapshot.docs
              .map(
                (expenseGroup) => ExpenseGroup.fromJson(
                  expenseGroup.data(),
                ),
              )
              .toList(),
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
    String newGroupName,
    UserData currentUser,
  ) async {
    final newExpenseGroupDocument = _expenseGroupsCollection.doc();

    final newExpenseGroup = ExpenseGroup(
      id: newExpenseGroupDocument.id,
      groupName: newGroupName,
      members: [currentUser],
      expenses: [],
    );

    final jsonObject = newExpenseGroup.toJson();
    jsonObject['members'] = [
      ...newExpenseGroup.members.map((member) => member.toJson())
    ];

    newExpenseGroupDocument
        .set(
          jsonObject,
        )
        .onError(
          (error, stackTrace) => log('$error $stackTrace'),
        );
  }

  Future<void> addExpense(
    Expense newExpense,
    ExpenseGroup currentExpenseGroup,
  ) async {
    final currentExpenseGroupRef = _expenseGroupsCollection.doc(
      currentExpenseGroup.id,
    );

    database.runTransaction(
      (transaction) => transaction.get(currentExpenseGroupRef).then(
        (currentExpenseGroupSnapshot) {
          final expenseGroupObject = ExpenseGroup.fromJson(
            currentExpenseGroupSnapshot.data() as Map<String, Object?>,
          );

          List<Map<String, dynamic>> expenses =
              [...expenseGroupObject.expenses, newExpense]
                  .map(
                    (expense) => expense.toJson(),
                  )
                  .toList();

          transaction.update(currentExpenseGroupRef, {
            'expenses': expenses,
          });
        },
      ),
    );
  }
}
