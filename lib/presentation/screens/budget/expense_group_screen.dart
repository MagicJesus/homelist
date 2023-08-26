import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/budget/budget_cubit.dart';
import 'package:homelist/application/budget/budget_cubit_state.dart';
import 'package:homelist/models/user/user.dart';
import 'package:homelist/presentation/widgets/budget/expense_tile.dart';
import 'package:homelist/presentation/widgets/common/homelist_appbar.dart';
import 'package:homelist/presentation/widgets/lists/share_to_users_dialog.dart';

class ExpenseGroupScreen extends StatelessWidget {
  const ExpenseGroupScreen({super.key});

  static const routeName = '/expense_group_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BudgetCubit, BudgetCubitState>(
      builder: (context, state) {
        final currentExpenseGroup = state.currentExpenseGroup!;
        return Scaffold(
          appBar: HomeListAppBar(
            title: currentExpenseGroup.groupName,
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return ShareToUsersDialog(
                        onShare: (List<String> usersToShare) {},
                        usersToExclude: state.currentExpenseGroup!.members
                            .map((UserData user) => user.id)
                            .toList(),
                      );
                    },
                  );
                },
                icon: const Icon(Icons.share),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Group Members:',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...currentExpenseGroup.members.map(
                        (UserData userData) => _UserTile(
                          userData: userData,
                        ),
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return ShareToUsersDialog(
                                    onShare: (List<String> usersToShare) {},
                                    usersToExclude: state
                                        .currentExpenseGroup!.members
                                        .map((UserData user) => user.id)
                                        .toList(),
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(8),
                              shape: const CircleBorder(),
                            ),
                            child: const Icon(
                              Icons.add,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(),
                ...currentExpenseGroup.expenses.map(
                  (expense) => ExpenseTile(
                    expense: expense,
                    expenseGroup: currentExpenseGroup,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _UserTile extends StatelessWidget {
  const _UserTile({
    required this.userData,
  });

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: Image.network(
              userData.avatarImage ??
                  'https://png.pngtree.com/png-vector/20220709/ourmid/pngtree-businessman-user-avatar-wearing-suit-with-red-tie-png-image_5809521.png',
            ).image,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(userData.firstName),
        ],
      ),
    );
  }
}
