import 'package:flutter/material.dart';
import 'package:homelist/models/expenses/expense_group/expense_group.dart';

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
        print('tabbps');
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
