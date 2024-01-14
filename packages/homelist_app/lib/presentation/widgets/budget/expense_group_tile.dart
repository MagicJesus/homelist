import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homelist/application/budget/budget_cubit.dart';
import 'package:homelist/models/expenses/expense_group/expense_group.dart';
import 'package:homelist/presentation/screens/budget/expense_group_screen.dart';

class ExpenseGroupTile extends StatelessWidget {
  const ExpenseGroupTile({
    super.key,
    required this.expenseGroup,
  });

  final ExpenseGroup expenseGroup;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<BudgetCubit>().setCurrentExpenseGroup(expenseGroup);
        context.push(ExpenseGroupScreen.routeName);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text(
                expenseGroup.groupName,
              ),
              const Expanded(
                child: SizedBox.shrink(),
              ),
              const Icon(Icons.arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}
