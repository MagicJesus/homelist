import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/budget/budget_cubit_state.dart';
import 'package:homelist/application/status.dart';
import 'package:homelist/models/expenses/expense/expense.dart';
import 'package:homelist/models/expenses/expense_group/expense_group.dart';
import 'package:homelist/repositories/firestore/expenses_repository.dart';
import 'package:user_repository/user_repository.dart';

class BudgetCubit extends Cubit<BudgetCubitState> {
  BudgetCubit(this._expensesRepository)
      : super(
          BudgetCubitState.initialState(),
        );

  final ExpensesRepository _expensesRepository;
  StreamSubscription<ExpenseGroup>? _currentExpenseGroupStreamSubscription;
  StreamSubscription<List<ExpenseGroup>>? _allExpenseGroupsStreamSubscription;

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
      await _currentExpenseGroupStreamSubscription!.cancel();
    }

    final ExpenseGroup currentExpenseGroup = state.currentExpenseGroup!;

    final Stream<ExpenseGroup> stream =
        await _expensesRepository.getCurrentExpenseGroupStream(
      currentExpenseGroup,
    );
    _currentExpenseGroupStreamSubscription = stream.listen(
      (ExpenseGroup event) {
        emit(
          state.copyWith(
            currentExpenseGroup: event,
          ),
        );
      },
    );
  }

  void listenToAllExpenseGroupsStream(
    UserData currentUser,
  ) {
    if (_allExpenseGroupsStreamSubscription != null) {
      _allExpenseGroupsStreamSubscription!.cancel();
    }

    final Stream<List<ExpenseGroup>> stream =
        _expensesRepository.getAllExpenseGroupsStream(currentUser);

    _allExpenseGroupsStreamSubscription = stream.listen(
      (List<ExpenseGroup> allExpenseGroups) {
        final List<Expense> allCurrentUserExpenses = <Expense>[];

        for (final ExpenseGroup expenseGroup in allExpenseGroups) {
          for (final Expense expense in expenseGroup.expenses) {
            if (<String>[...expense.borrowerIds, expense.lenderId]
                .contains(currentUser.id)) {
              allCurrentUserExpenses.add(expense);
            }
          }
        }

        emit(
          state.copyWith(
            allExpenseGroups: allExpenseGroups,
            allCurrentUserExpenses: allCurrentUserExpenses,
          ),
        );
      },
    );
  }

  Future<void> getAllExpenseGroups(UserData currentUser) async {
    emit(
      state.copyWith(allExpenseGroupsStatus: Status.loading),
    );
    final List<ExpenseGroup> allExpenseGroups =
        await _expensesRepository.getAllExpenseGroups(currentUser);
    final List<Expense> allCurrentUserExpenses = <Expense>[];

    for (final ExpenseGroup expenseGroup in allExpenseGroups) {
      for (final Expense expense in expenseGroup.expenses) {
        if (<String>[...expense.borrowerIds, expense.lenderId]
            .contains(currentUser.id)) {
          allCurrentUserExpenses.add(expense);
        }
      }
    }

    emit(
      state.copyWith(
        allExpenseGroups: allExpenseGroups,
        allCurrentUserExpenses: allCurrentUserExpenses,
      ),
    );
  }

  Future<void> addUsersToExpenseGroup(List<UserData> usersToShareWith) async {
    await _expensesRepository.addUsersToExpenseGroup(
      state.currentExpenseGroup!,
      usersToShareWith,
    );
  }

  Future<void> addExpenseGroup(
    String newGroupName,
    UserData currentUser,
  ) async {
    await _expensesRepository.addExpenseGroup(
      newGroupName,
      currentUser,
    );
  }

  Future<void> addExpense(
    Expense newExpense,
  ) async {
    await _expensesRepository.addExpense(
      newExpense,
      state.currentExpenseGroup!,
    );
  }
}
