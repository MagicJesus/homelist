import 'dart:async';

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

  Future<void> addExpenseGroup(
    String currentUserId,
    String newGroupName,
  ) async {}

  Future<void> addExpenseGroupMember(
    String newGroupMemberId,
  ) async {}
}
