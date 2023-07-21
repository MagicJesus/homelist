import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homelist/application/shared_lists/shared_list_cubit.dart';
import 'package:homelist/application/shared_lists/shared_list_cubit_state.dart';
import 'package:homelist/application/status.dart';
import 'package:homelist/application/user/user_cubit.dart';
import 'package:homelist/models/list/list.dart';
import 'package:homelist/presentation/constants.dart';

class AddListForm extends StatefulWidget {
  const AddListForm({super.key});

  @override
  State<AddListForm> createState() => _AddListFormState();
}

class _AddListFormState extends State<AddListForm> {
  ListType listType = ListType.todo;

  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController.fromValue(
    const TextEditingValue(text: ''),
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add a new List'),
      contentPadding:
          const EdgeInsets.only(left: 32, top: 32, right: 32, bottom: 16),
      alignment: Alignment.center,
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              value: listType,
              items: const [
                DropdownMenuItem<ListType>(
                  value: ListType.todo,
                  child: Text('To-Do'),
                ),
                DropdownMenuItem<ListType>(
                  value: ListType.shopping,
                  child: Text('Shopping'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  listType = value;
                }
              },
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              controller: titleController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                label: const Text('Title'),
                hintText: 'Enter a list title',
                hintStyle: const TextStyle(color: AppColors.hintTextColor),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            context.pop();
          },
          child: const Text("Cancel"),
        ),
        BlocBuilder<SharedListCubit, SharedListCubitState>(
            builder: (context, state) {
          return ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                await context.read<SharedListCubit>().addNewList(
                      titleController.value.text,
                      listType,
                      context.read<UserCubit>().state.userData!.id,
                    );
                if (context.mounted) {
                  context.pop();
                }
              }
            },
            child: state.allListsStatus == Status.loading
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  )
                : const Text("Add"),
          );
        }),
      ],
    );
  }
}
