import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homelist/application/user/user_cubit.dart';
import 'package:homelist/application/user/user_cubit_state.dart';
import 'package:homelist/generated/assets.gen.dart';
import 'package:homelist/models/user/user.dart';

class ShareToUsersDialog extends StatefulWidget {
  const ShareToUsersDialog({
    required this.onShare,
    this.usersToExclude,
    super.key,
  });

  final List<String>? usersToExclude;
  final void Function(List<UserData>) onShare;

  @override
  State<ShareToUsersDialog> createState() => _ShareToUsersDialogState();
}

class _ShareToUsersDialogState extends State<ShareToUsersDialog> {
  List<UserData> selectedUsers = [];

  @override
  void initState() {
    context.read<UserCubit>().getUsersToShareStream([
      ...?widget.usersToExclude,
    ]);
    super.initState();
  }

  void selectUser(UserData selectedUserId) {
    if (isSelected(selectedUserId)) {
      selectedUsers.remove(selectedUserId);
    } else {
      selectedUsers.add(selectedUserId);
    }
    setState(() {});
  }

  bool isSelected(UserData selectedUserId) {
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
                    if (userListResults.isNotEmpty)
                      ...userListResults.map(
                        (user) {
                          return GestureDetector(
                            onTap: () {
                              selectUser(user);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 8),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .tertiaryContainer,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${user.firstName} '
                                        '${user.lastName}',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onTertiaryContainer,
                                        ),
                                      ),
                                      Text(
                                        user.email,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onTertiaryContainer,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(child: Container()),
                                  Column(
                                    children: [
                                      Checkbox(
                                        value: isSelected(user),
                                        onChanged: (_) {
                                          selectUser(user);
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    if (userListResults.isEmpty)
                      Column(
                        children: [
                          Assets.icons.noResults.image(width: 128, height: 128),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'There are no users that you can share this list with.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
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
