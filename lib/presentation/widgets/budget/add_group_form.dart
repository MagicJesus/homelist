import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homelist/application/shared_lists/shared_list_cubit.dart';
import 'package:homelist/application/shared_lists/shared_list_cubit_state.dart';
import 'package:homelist/application/status.dart';
import 'package:homelist/models/list/list_item.dart';
import 'package:homelist/presentation/constants.dart';

class AddGroupForm extends StatefulWidget {
  const AddGroupForm({super.key});

  @override
  State<AddGroupForm> createState() => _AddGroupFormState();
}

class _AddGroupFormState extends State<AddGroupForm> {
  IconNames iconName = IconNames.vegetables;

  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController.fromValue(
    const TextEditingValue(text: ''),
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create a new group'),
      contentPadding:
          const EdgeInsets.only(left: 32, top: 32, right: 32, bottom: 16),
      alignment: Alignment.center,
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              autofocus: true,
              controller: titleController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                label: const Text('Name the group'),
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
                  // Add creating group functionality
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
          },
        ),
      ],
    );
  }
}
