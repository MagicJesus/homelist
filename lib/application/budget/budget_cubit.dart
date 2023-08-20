import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/budget/budget_cubit_state.dart';
import 'package:homelist/application/status.dart';
import 'package:homelist/models/expenses/expense/expense.dart';
import 'package:homelist/models/user/user.dart';
import 'package:homelist/repositories/firestore/expenses_repository.dart';

class BudgetCubit extends Cubit<BudgetCubitState> {
  BudgetCubit(this._expensesRepository)
      : super(
          BudgetCubitState.initialState(),
        );

  final ExpensesRepository _expensesRepository;

  Future<void> getAllExpenseGroups(UserData currentUser) async {
    emit(
      state.copyWith(allExpenseGroupsStatus: Status.loading),
    );
    final allExpenseGroups =
        await _expensesRepository.getAllExpenseGroups(currentUser);
    List<Expense> allCurrentUserExpenses = [];

    for (var expenseGroup in allExpenseGroups) {
      for (var expense in expenseGroup.expenses) {
        if ([expense.borrowerId, expense.lenderId].contains(currentUser.id)) {
          allCurrentUserExpenses.add(expense);
        }
      }
    }

    emit(state.copyWith(
      allExpenseGroups: allExpenseGroups,
      allCurrentUserExpenses: allCurrentUserExpenses,
    ));
  }
}
