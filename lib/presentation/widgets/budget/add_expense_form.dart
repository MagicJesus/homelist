import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homelist/application/budget/budget_cubit.dart';
import 'package:homelist/application/budget/budget_cubit_state.dart';
import 'package:homelist/application/user/user_cubit.dart';
import 'package:homelist/models/expenses/expense/expense.dart';
import 'package:homelist/presentation/constants.dart';
import 'package:uuid/uuid.dart';

class AddExpenseFormScreen extends StatefulWidget {
  const AddExpenseFormScreen({
    super.key,
  });

  static const routeName = '/add_expense';

  @override
  State<AddExpenseFormScreen> createState() => _AddExpenseFormScreenState();
}

class _AddExpenseFormScreenState extends State<AddExpenseFormScreen> {
  List<String> selectedUsers = [];

  final _formKey = GlobalKey<FormState>();

  final amountController = TextEditingController.fromValue(
    const TextEditingValue(text: ''),
  );

  void selectUser(String selectedUserId) {
    if (isSelected(selectedUserId)) {
      selectedUsers.remove(selectedUserId);
    } else {
      selectedUsers.add(selectedUserId);
    }
    setState(() {});
  }

  bool isSelected(String selectedUserId) {
    return selectedUsers.contains(selectedUserId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BudgetCubit, BudgetCubitState>(
        builder: (context, state) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      autofocus: true,
                      controller: amountController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: const Text('How much did you pay?'),
                        hintStyle:
                            const TextStyle(color: AppColors.hintTextColor),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ...state.currentExpenseGroup!.members.map(
                (user) {
                  return Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${user.firstName} '
                              '${user.lastName}',
                            ),
                            Text(user.email),
                          ],
                        ),
                        Expanded(child: Container()),
                        Column(
                          children: [
                            Checkbox(
                              value: isSelected(user.id),
                              onChanged: (_) {
                                selectUser(user.id);
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ).toList(),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text("Cancel"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          context.read<BudgetCubit>().addExpense(
                                Expense(
                                  id: const Uuid().v1(),
                                  amount: double.parse(amountController.text),
                                  lenderId: context
                                      .read<UserCubit>()
                                      .state
                                      .userData!
                                      .id,
                                  borrowerIds: [...selectedUsers],
                                  expenseGroupId: state.currentExpenseGroup!.id,
                                ),
                              );
                          if (context.mounted) {
                            context.pop();
                          }
                        }
                      },
                      child: const Text("Add"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
