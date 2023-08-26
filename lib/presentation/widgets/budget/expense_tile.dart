import 'package:flutter/material.dart';
import 'package:homelist/models/expenses/expense/expense.dart';
import 'package:homelist/models/expenses/expense_group/expense_group.dart';
import 'package:homelist/models/user/user.dart';

class ExpenseTile extends StatelessWidget {
  const ExpenseTile({
    super.key,
    required this.expense,
    required this.expenseGroup,
  });

  final Expense expense;
  final ExpenseGroup expenseGroup;

  UserData getUserFromGroup(String userId) {
    return expenseGroup.members.firstWhere((element) => element.id == userId);
  }

  @override
  Widget build(BuildContext context) {
    final lender = getUserFromGroup(expense.lenderId);
    final borrower = getUserFromGroup(expense.borrowerId);
    return GestureDetector(
      onTap: () {
        print(expenseGroup.id);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  '${lender.firstName} ${lender.lastName}',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(Icons.arrow_right_alt_rounded),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  '${borrower.firstName} ${borrower.lastName}',
                ),
              ),
              Expanded(child: Text('${expense.amount} PLN')),
              const Icon(Icons.arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}
