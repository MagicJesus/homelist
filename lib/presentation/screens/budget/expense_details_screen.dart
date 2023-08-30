import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/budget/budget_cubit.dart';
import 'package:homelist/helpers/expeses_helper.dart';
import 'package:homelist/models/user/user.dart';
import 'package:homelist/presentation/widgets/common/homelist_appbar.dart';
import 'package:homelist/presentation/widgets/common/user_tile.dart';

class ExpenseDetailsScreen extends StatelessWidget {
  const ExpenseDetailsScreen({
    super.key,
  });

  static const routeName = '/expense_details';

  @override
  Widget build(BuildContext context) {
    final expense = context.read<BudgetCubit>().state.currentExpense!;
    final expenseGroup = context.read<BudgetCubit>().state.currentExpenseGroup!;
    final lender = expenseGroup.members
        .firstWhere((element) => element.id == expense.lenderId);
    return Scaffold(
      appBar: HomeListAppBar(
        title: expense.title,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: UserTile(
                    userData: lender,
                    displayName: false,
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: '${lender.firstName} paid ',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                      children: [
                        TextSpan(
                          text: expense.amount.toStringAsFixed(2),
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                          children: [
                            TextSpan(
                              text: ' PLN',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ],
            ),
            ...expenseGroup.members.map(
              (UserData userData) => Row(
                children: [
                  const SizedBox(
                    width: 32,
                  ),
                  UserTile(
                    userData: userData,
                    displayName: false,
                  ),
                  Center(
                    child: Text(
                      '${userData.firstName} owes ${ExpensesHelper.userShareAbsolute(expense, userData.id).toStringAsFixed(2)} PLN',
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              indent: 12,
              endIndent: 12,
            )
          ],
        ),
      ),
    );
  }
}
