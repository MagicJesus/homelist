import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/budget/budget_cubit_state.dart';
import 'package:homelist/application/status.dart';
import 'package:homelist/models/expenses/expense/expense.dart';
import 'package:homelist/models/expenses/expense_group/expense_group.dart';
import 'package:homelist/models/user/user.dart';
import 'package:homelist/repositories/firestore/expenses_repository.dart';

class BudgetCubit extends Cubit<BudgetCubitState> {
  BudgetCubit(this._expensesRepository)
      : super(
          BudgetCubitState.initialState(),
        );

  final ExpensesRepository _expensesRepository;
  StreamSubscription? _currentExpenseGroupStreamSubscription;
  StreamSubscription? _allExpenseGroupsStreamSubscription;

  void setCurrentExpenseGroup(ExpenseGroup? expenseGroup) {
    emit(
      state.copyWith(currentExpenseGroup: expenseGroup),
    );
    listenToCurrentExpenseGroupStream();
  }

  void setCurrentExpense(Expense? expense) {
    emit(
      state.copyWith(currentExpense: expense),
    );
  }

  Future<void> listenToCurrentExpenseGroupStream() async {
    if (_currentExpenseGroupStreamSubscription != null) {
      _currentExpenseGroupStreamSubscription!.cancel();
    }

    final currentExpenseGroup = state.currentExpenseGroup!;

    final stream = await _expensesRepository.getCurrentExpenseGroupStream(
      currentExpenseGroup,
    );
    _currentExpenseGroupStreamSubscription = stream.listen(
      (event) {
        emit(
          state.copyWith(
            currentExpenseGroup: event,
          ),
        );
      },
    );
  }

  Future<void> listenToAllExpenseGroupsStream(
    UserData currentUser,
  ) async {
    if (_allExpenseGroupsStreamSubscription != null) {
      _allExpenseGroupsStreamSubscription!.cancel();
    }

    final stream =
        await _expensesRepository.getAllExpenseGroupsStream(currentUser);
    _currentExpenseGroupStreamSubscription = stream.listen(
      (allExpenseGroups) {
        List<Expense> allCurrentUserExpenses = [];

        for (var expenseGroup in allExpenseGroups) {
          for (var expense in expenseGroup.expenses) {
            if ([...expense.borrowerIds, expense.lenderId]
                .contains(currentUser.id)) {
              allCurrentUserExpenses.add(expense);
            }
          }
        }

        emit(state.copyWith(
          allExpenseGroups: allExpenseGroups,
          allCurrentUserExpenses: allCurrentUserExpenses,
        ));
      },
    );
  }

  Future<void> getAllExpenseGroups(UserData currentUser) async {
    emit(
      state.copyWith(allExpenseGroupsStatus: Status.loading),
    );
    final allExpenseGroups =
        await _expensesRepository.getAllExpenseGroups(currentUser);
    List<Expense> allCurrentUserExpenses = [];

    for (var expenseGroup in allExpenseGroups) {
      for (var expense in expenseGroup.expenses) {
        if ([...expense.borrowerIds, expense.lenderId]
            .contains(currentUser.id)) {
          allCurrentUserExpenses.add(expense);
        }
      }
    }

    emit(state.copyWith(
      allExpenseGroups: allExpenseGroups,
      allCurrentUserExpenses: allCurrentUserExpenses,
    ));
  }

  Future<void> addUsersToExpenseGroup(List<UserData> usersToShareWith) async {
    _expensesRepository.addUsersToExpenseGroup(
      state.currentExpenseGroup!,
      usersToShareWith,
    );
  }

  Future<void> addExpenseGroup(
    String newGroupName,
    UserData currentUser,
  ) async {
    _expensesRepository.addExpenseGroup(
      newGroupName,
      currentUser,
    );
  }

  Future<void> addExpense(
    Expense newExpense,
  ) async {
    _expensesRepository.addExpense(
      newExpense,
      state.currentExpenseGroup!,
    );
  }
}
