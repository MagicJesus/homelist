import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homelist/application/budget/budget_cubit.dart';
import 'package:homelist/helpers/expeses_helper.dart';
import 'package:homelist/models/expenses/expense/expense.dart';
import 'package:homelist/models/expenses/expense_group/expense_group.dart';
import 'package:homelist/models/user/user.dart';
import 'package:homelist/presentation/constants.dart';
import 'package:homelist/presentation/screens/budget/expense_details_screen.dart';

class ExpenseTile extends StatelessWidget {
  const ExpenseTile({
    super.key,
    required this.expense,
    required this.expenseGroup,
    required this.currentUser,
  });

  final Expense expense;
  final ExpenseGroup expenseGroup;
  final UserData currentUser;

  List<UserData> getUserFromGroup(List<String> userIds) {
    return expenseGroup.members
        .where(
          (element) => userIds.contains(element.id),
        )
        .toList();
  }

  String getLendersName(BuildContext context, UserData lender) {
    if (lender.id == currentUser.id) {
      return 'You';
    } else {
      return '${lender.firstName} ${lender.lastName}';
    }
  }

  Widget getCurrentUserShareInExpense() {
    final userShare = ExpensesHelper.userShare(expense, currentUser.id);
    bool isLender = userShare > 0;
    return _UserShareWidget(isLender: isLender, amount: userShare);
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
    final lender = getUserFromGroup([expense.lenderId]).first;
    return GestureDetector(
      onTap: () {
        context.read<BudgetCubit>()
          ..setCurrentExpense(expense)
          ..setCurrentExpenseGroup(
            getExpenseGroupForExpense(
              expense.expenseGroupId,
              context,
            ),
          );
        context.push(
          ExpenseDetailsScreen.routeName,
        );
      },
      child: Card(
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    expense.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 18),
                  ),
                  Text(
                    '${getLendersName(context, lender)} paid ${expense.amount} PLN',
                  ),
                ],
              ),
              const Expanded(
                child: SizedBox.shrink(),
              ),
              getCurrentUserShareInExpense(),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserShareWidget extends StatelessWidget {
  const _UserShareWidget({
    required this.isLender,
    required this.amount,
  });

  final bool isLender;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          isLender ? 'You lent' : 'You borrowed',
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: isLender ? AppColors.loanGreen : AppColors.debtRed,
              ),
        ),
        Text(
          '${amount.toStringAsFixed(2).replaceAll('-', '')} PLN',
          style: TextStyle(
            color: isLender ? AppColors.loanGreen : AppColors.debtRed,
          ),
        ),
      ],
    );
  }
}
