import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/budget/budget_cubit.dart';
import 'package:homelist/application/budget/budget_cubit_state.dart';
import 'package:homelist/application/user/user_cubit.dart';
import 'package:homelist/models/expenses/expense_group/expense_group.dart';
import 'package:homelist/presentation/widgets/budget/expense_group_tile.dart';
import 'package:homelist/presentation/widgets/budget/expense_tile.dart';
import 'package:homelist/presentation/widgets/common/circle.dart';

class BudgetScreen extends StatelessWidget {
  BudgetScreen({super.key});

  final GlobalKey headerExpandedKey = GlobalKey();

  double _getUserTotalExpensesBalance(BuildContext context) {
    final allCurrentUserExpenses =
        context.read<BudgetCubit>().state.allCurrentUserExpenses;
    final currentUserId = context.read<UserCubit>().state.userData!.id;
    double balance = 0;

    for (var expense in allCurrentUserExpenses) {
      if (expense.lenderId == currentUserId) {
        balance += expense.amount;
      } else if (expense.borrowerId == currentUserId) {
        balance -= expense.amount;
      } else {
        continue;
      }
    }

    return balance;
  }

  double getDistanceFromTop() {
    if (headerExpandedKey.currentContext != null &&
        headerExpandedKey.currentContext!.mounted) {
      return headerExpandedKey.currentContext!.size!.height / 2;
    } else {
      return 0;
    }
  }

  ExpenseGroup getExpenseGroupForExpense(
    String expenseGroupId,
    BuildContext context,
  ) {
    final expenseGroups = context.read<BudgetCubit>().state.allExpenseGroups;
    return expenseGroups.firstWhere((element) => element.id == expenseGroupId);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          key: headerExpandedKey,
          flex: 4,
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.center,
                child: Circle(
                  radius: 55,
                  strokeWidth: 8,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: _TotalExpenseBalanceWidget(
                  totalExpenses: _getUserTotalExpensesBalance(context),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 6,
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                const TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Expenses"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Groups"),
                    )
                  ],
                ),
                Expanded(
                  flex: 8,
                  child: TabBarView(
                    children: [
                      BlocBuilder<BudgetCubit, BudgetCubitState>(
                        builder: ((context, state) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                ...state.allCurrentUserExpenses.map(
                                  (expense) => ExpenseTile(
                                    expense: expense,
                                    expenseGroup: getExpenseGroupForExpense(
                                      expense.expenseGroupId,
                                      context,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                      BlocBuilder<BudgetCubit, BudgetCubitState>(
                        builder: ((context, state) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                ...state.allExpenseGroups.map(
                                  (expenseGroup) => ExpenseGroupTile(
                                    expenseGroup: expenseGroup,
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _TotalExpenseBalanceWidget extends StatelessWidget {
  const _TotalExpenseBalanceWidget({required this.totalExpenses});

  final double totalExpenses;

  TextStyle? _getExpensesHeadingStyle() {
    switch (totalExpenses) {
      case 0:
        return const TextStyle(fontSize: 48);
      case > 0:
        return TextStyle(
          fontSize: 48,
          color: Colors.greenAccent.shade400,
        );
      case < 0:
        return TextStyle(
          fontSize: 48,
          color: Colors.redAccent.shade400,
        );
      default:
        return null;
    }
  }

  String _getExpensesHeadingText() {
    switch (totalExpenses) {
      case 0:
        return 'You\'re all settled!';
      case > 0:
        return 'You get back';
      case < 0:
        return 'You owe';
      default:
        return 'null';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          _getExpensesHeadingText(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        totalExpenses != 0
            ? Text(
                totalExpenses.toString().replaceAll('-', ''),
                style: _getExpensesHeadingStyle(),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
