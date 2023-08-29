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

  List<UserData> getUserFromGroup(List<String> userIds) {
    return expenseGroup.members
        .where(
          (element) => userIds.contains(element.id),
        )
        .toList();
  }

  String getBorrowersText(List<UserData> borrowers) {
    if (borrowers.length == 1) {
      return '${borrowers.first.firstName} ${borrowers.first.lastName}';
    } else {
      return '${borrowers.length} people ';
    }
  }

  @override
  Widget build(BuildContext context) {
    final lender = getUserFromGroup([expense.lenderId]).first;
    final borrowers = getUserFromGroup(expense.borrowerIds);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                text: '${lender.firstName} ${lender.lastName}  ',
                children: [
                  const TextSpan(
                    text: 'lent  ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: getBorrowersText(borrowers),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Text(
                '${expense.amount} PLN',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
