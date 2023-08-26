import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homelist/application/user/user_cubit.dart';
import 'package:homelist/application/user/user_cubit_state.dart';

class ShareToUsersDialog extends StatefulWidget {
  const ShareToUsersDialog({
    required this.onShare,
    this.usersToExclude,
    super.key,
  });

  final List<String>? usersToExclude;
  final void Function(List<String>) onShare;

  @override
  State<ShareToUsersDialog> createState() => _ShareToUsersDialogState();
}

class _ShareToUsersDialogState extends State<ShareToUsersDialog> {
  List<String> selectedUsers = [];

  @override
  void initState() {
    context.read<UserCubit>().getUsersToShareStream([
      ...?widget.usersToExclude,
    ]);
    super.initState();
  }

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
    return AlertDialog(
      title: const Text("Find Users"),
      actions: [
        ElevatedButton(
          onPressed: selectedUsers.isEmpty
              ? null
              : () {
                  widget.onShare(selectedUsers);
                  context.pop();
                },
          child: const Text('Share'),
        )
      ],
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<UserCubit, UserCubitState>(
            builder: ((context, state) {
              final userListResults = state.usersToShare;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...userListResults.map(
                      (user) {
                        return Container(
                          margin: const EdgeInsets.only(top: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.amberAccent,
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
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
