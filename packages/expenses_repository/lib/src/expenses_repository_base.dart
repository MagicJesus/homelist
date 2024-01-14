import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenses_repository/src/models/expense.dart';
import 'package:user_repository/user_repository.dart';

import 'models/expense_group.dart';

class ExpensesRepository {
  ExpensesRepository();
  final FirebaseFirestore database = FirebaseFirestore.instance;
  final CollectionReference<Map<String, dynamic>> _expenseGroupsCollection =
      FirebaseFirestore.instance.collection(
    _expenseGroupsCollectionKey,
  );

  static const String _expenseGroupsCollectionKey = 'expenseGroups';

  Future<Stream<ExpenseGroup>> getCurrentExpenseGroupStream(
    ExpenseGroup currentExpenseGroup,
  ) async {
    return _expenseGroupsCollection
        .doc(
          currentExpenseGroup.id,
        )
        .snapshots()
        .map(
          (DocumentSnapshot<Map<String, dynamic>> expenseGroupSnapshot) => ExpenseGroup.fromJson(
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
          (QuerySnapshot<Map<String, dynamic>> expenseGroupQuerySnapshot) =>
              expenseGroupQuerySnapshot.docs
                  .map(
                    (QueryDocumentSnapshot<Map<String, dynamic>> expenseGroup) =>
                        ExpenseGroup.fromJson(
                      expenseGroup.data(),
                    ),
                  )
                  .toList(),
        );
  }

  Future<List<ExpenseGroup>> getAllExpenseGroups(UserData currentUser) async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _expenseGroupsCollection.where('members', arrayContains: currentUser.toJson()).get();

    List<ExpenseGroup> expenseGroups = <ExpenseGroup>[];
    for (final QueryDocumentSnapshot<Map<String, dynamic>> docSnapshot in querySnapshot.docs) {
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
      final DocumentReference<Map<String, dynamic>> currentExpenseGroupDocumentRef = database
          .collection(
            _expenseGroupsCollectionKey,
          )
          .doc(
            currentExpenseGroup.id,
          );
      await database.runTransaction(
        (Transaction transaction) {
          return transaction.get(currentExpenseGroupDocumentRef).then(
            (_) {
              final List<UserData> updatedMembersList = <UserData>[
                ...currentExpenseGroup.members,
                ...usersToShareWith
              ];

              final Iterable<Map<String, dynamic>> updatedMembersListDistinct =
                  updatedMembersList.toSet().toList().map(
                        (UserData e) => e.toJson(),
                      );

              transaction.update(currentExpenseGroupDocumentRef, <String, dynamic>{
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
    final DocumentReference<Map<String, dynamic>> newExpenseGroupDocument =
        _expenseGroupsCollection.doc();

    final ExpenseGroup newExpenseGroup = ExpenseGroup(
      id: newExpenseGroupDocument.id,
      groupName: newGroupName,
      members: <UserData>[currentUser],
      expenses: <Expense>[],
    );

    final Map<String, dynamic> jsonObject = newExpenseGroup.toJson();
    jsonObject['members'] = <Map<String, dynamic>>[
      ...newExpenseGroup.members.map((UserData member) => member.toJson())
    ];

    await newExpenseGroupDocument
        .set(
          jsonObject,
        )
        .onError(
          (Object? error, StackTrace stackTrace) => log('$error $stackTrace'),
        );
  }

  Future<void> addExpense(
    Expense newExpense,
    ExpenseGroup currentExpenseGroup,
  ) async {
    final DocumentReference<Map<String, dynamic>> currentExpenseGroupRef =
        _expenseGroupsCollection.doc(
      currentExpenseGroup.id,
    );

    await database.runTransaction(
      (Transaction transaction) => transaction.get(currentExpenseGroupRef).then(
        (DocumentSnapshot<Map<String, dynamic>> currentExpenseGroupSnapshot) {
          final ExpenseGroup expenseGroupObject = ExpenseGroup.fromJson(
            currentExpenseGroupSnapshot.data() as Map<String, Object?>,
          );

          List<Map<String, dynamic>> expenses =
              <Expense>[...expenseGroupObject.expenses, newExpense]
                  .map(
                    (Expense expense) => expense.toJson(),
                  )
                  .toList();

          transaction.update(
            currentExpenseGroupRef,
            <String, dynamic>{
              'expenses': expenses,
            },
          );
        },
      ),
    );
  }
}
