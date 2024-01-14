import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homelist/application/shared_lists/shared_list_cubit.dart';
import 'package:homelist/application/shared_lists/shared_list_cubit_state.dart';
import 'package:homelist/application/status.dart';
import 'package:homelist/helpers/icons_helper.dart';
import 'package:homelist/models/list/list_item.dart';
import 'package:homelist/presentation/constants.dart';
import 'package:uuid/uuid.dart';

class AddListItemForm extends StatefulWidget {
  const AddListItemForm({super.key});

  @override
  State<AddListItemForm> createState() => _AddListItemFormState();
}

class _AddListItemFormState extends State<AddListItemForm> {
  IconNames iconName = IconNames.vegetables;

  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController.fromValue(
    const TextEditingValue(text: ''),
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add a new item'),
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
                label: const Text('Icon'),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              value: iconName,
              items: [
                DropdownMenuItem<IconNames>(
                  value: IconNames.vegetables,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 50,
                      maxWidth: 50,
                    ),
                    child: IconsHelper.getIcon(IconNames.vegetables),
                  ),
                ),
                DropdownMenuItem<IconNames>(
                  value: IconNames.fruits,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 50,
                      maxWidth: 50,
                    ),
                    child: IconsHelper.getIcon(IconNames.fruits),
                  ),
                ),
                DropdownMenuItem<IconNames>(
                  value: IconNames.dairy,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 50,
                      maxWidth: 50,
                    ),
                    child: IconsHelper.getIcon(IconNames.dairy),
                  ),
                ),
                DropdownMenuItem<IconNames>(
                  value: IconNames.todo,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 50,
                      maxWidth: 50,
                    ),
                    child: IconsHelper.getIcon(IconNames.todo),
                  ),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  iconName = value;
                }
              },
            ),
            const SizedBox(
              height: 12,
            ),
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
                label: const Text('What do you need?'),
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
                  final newItem = ListItem(
                    id: const Uuid().v1(),
                    title: titleController.text,
                    completed: false,
                    iconName: iconName,
                  );
                  context.read<SharedListCubit>().addNewListItem(newItem);
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
