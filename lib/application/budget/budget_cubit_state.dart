import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:homelist/application/status.dart';
import 'package:homelist/models/expenses/expense/expense.dart';
import 'package:homelist/models/expenses/expense_group/expense_group.dart';

part 'budget_cubit_state.freezed.dart';

@freezed
class BudgetCubitState with _$BudgetCubitState {
  factory BudgetCubitState({
    required List<ExpenseGroup> allExpenseGroups,
    required List<Expense> allCurrentUserExpenses,
    required Status allExpenseGroupsStatus,
    ExpenseGroup? currentExpenseGroup,
    Expense? currentExpense,
  }) = _BudgetCubitState;

  factory BudgetCubitState.initialState() {
    return BudgetCubitState(
      allCurrentUserExpenses: [],
      allExpenseGroups: [],
      allExpenseGroupsStatus: Status.initial,
    );
  }
}
