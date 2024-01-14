import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/budget/budget_cubit.dart';
import 'package:homelist/application/budget/budget_cubit_state.dart';
import 'package:homelist/application/user/user_cubit.dart';
import 'package:homelist/helpers/expeses_helper.dart';
import 'package:homelist/models/expenses/expense/expense.dart';
import 'package:homelist/models/expenses/expense_group/expense_group.dart';
import 'package:homelist/presentation/constants.dart';
import 'package:homelist/presentation/widgets/budget/expense_group_tile.dart';
import 'package:homelist/presentation/widgets/budget/expense_tile.dart';
import 'package:homelist/presentation/widgets/common/circle.dart';
import 'package:user_repository/user_repository.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  final GlobalKey headerExpandedKey = GlobalKey();

  double _getUserTotalExpensesBalance(BudgetCubitState state) {
    final List<Expense> allCurrentUserExpenses = state.allCurrentUserExpenses;
    final String currentUserId = context.read<UserCubit>().state.userData!.id;

    double balance = 0;

    for (final Expense expense in allCurrentUserExpenses) {
      balance += ExpensesHelper.userShare(expense, currentUserId);
    }

    return balance;
  }

  ExpenseGroup getExpenseGroupForExpense(
    String expenseGroupId,
    BuildContext context,
  ) {
    final List<ExpenseGroup> expenseGroups =
        context.read<BudgetCubit>().state.allExpenseGroups;
    return expenseGroups
        .firstWhere((ExpenseGroup element) => element.id == expenseGroupId);
  }

  @override
  Widget build(BuildContext context) {
    final UserData currentUser = context.read<UserCubit>().state.userData!;
    return Column(
      children: [
        Expanded(
          key: headerExpandedKey,
          flex: 4,
          child: Stack(
            children: [
              Align(
                child: Circle(
                  radius: 55,
                  strokeWidth: 14,
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
              ),
              Align(
                child: BlocBuilder<BudgetCubit, BudgetCubitState>(
                  builder: (BuildContext context, BudgetCubitState state) {
                    return _TotalExpenseBalanceWidget(
                      totalExpenses: _getUserTotalExpensesBalance(state),
                    );
                  },
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
                      padding: EdgeInsets.all(8),
                      child: Text('Expenses'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('Groups'),
                    )
                  ],
                ),
                Expanded(
                  flex: 8,
                  child: TabBarView(
                    children: [
                      BlocBuilder<BudgetCubit, BudgetCubitState>(
                        builder:
                            (BuildContext context, BudgetCubitState state) {
                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ...state.allCurrentUserExpenses.map(
                                    (Expense expense) {
                                      return ExpenseTile(
                                        expense: expense,
                                        expenseGroup: getExpenseGroupForExpense(
                                          expense.expenseGroupId,
                                          context,
                                        ),
                                        currentUser: currentUser,
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 80),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      BlocBuilder<BudgetCubit, BudgetCubitState>(
                        builder:
                            (BuildContext context, BudgetCubitState state) {
                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ...state.allExpenseGroups.map(
                                    (ExpenseGroup expenseGroup) =>
                                        ExpenseGroupTile(
                                      expenseGroup: expenseGroup,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
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
        return const TextStyle(
          fontSize: 48,
          color: AppColors.loanGreen,
        );
      case < 0:
        return const TextStyle(
          fontSize: 48,
          color: AppColors.debtRed,
        );
      default:
        return null;
    }
  }

  String _getExpensesHeadingText() {
    switch (totalExpenses) {
      case 0:
        return "You're all settled!";
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
        if (totalExpenses != 0)
          Text(
            totalExpenses.toStringAsFixed(2).replaceAll('-', ''),
            style: _getExpensesHeadingStyle(),
          )
        else
          const SizedBox.shrink(),
      ],
    );
  }
}
