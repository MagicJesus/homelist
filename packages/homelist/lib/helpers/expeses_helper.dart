import 'package:homelist/models/expenses/expense/expense.dart';

class ExpensesHelper {
  const ExpensesHelper._();

  static double userShare(Expense expense, String userId) {
    if (expense.lenderId == userId) {
      return (expense.amount / (expense.borrowerIds.length + 1)) *
          expense.borrowerIds.length;
    } else if (expense.borrowerIds.contains(userId)) {
      return -(expense.amount / (expense.borrowerIds.length + 1));
    } else {
      return 0;
    }
  }

  static double userShareAbsolute(Expense expense, String userId) {
    final usersCount = expense.borrowerIds.length + 1; // borrowers + lender
    return expense.amount / usersCount;
  }
}
