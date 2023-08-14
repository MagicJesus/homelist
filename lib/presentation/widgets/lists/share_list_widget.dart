import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homelist/application/shared_lists/shared_list_cubit.dart';
import 'package:homelist/application/shared_lists/shared_list_cubit_state.dart';
import 'package:homelist/application/user/user_cubit.dart';

class ShareListWidget extends StatefulWidget {
  const ShareListWidget({super.key});

  @override
  State<ShareListWidget> createState() => _ShareListWidgetState();
}

class _ShareListWidgetState extends State<ShareListWidget> {
  List<String> selectedUsers = [];

  @override
  void initState() {
    final currentUserId = context.read<UserCubit>().state.userData!.id;
    context.read<SharedListCubit>().loadUsersToShareStream(currentUserId);
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
                  context
                      .read<SharedListCubit>()
                      .shareListToUsers(selectedUsers);
                  context.pop();
                },
          child: const Text('Share'),
        )
      ],
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //TODO Add user searching logic
          const TextField(),
          BlocBuilder<SharedListCubit, SharedListCubitState>(
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
