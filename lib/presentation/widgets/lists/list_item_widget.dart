import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/shared_lists/shared_list_cubit.dart';
import 'package:homelist/helpers/icons_helper.dart';
import 'package:homelist/models/list/list_item.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget(
      {super.key, required this.listItem, required this.onChecked});

  final ListItem listItem;
  final void Function(bool?) onChecked;

  void _deleteItem(BuildContext context) {
    context.read<SharedListCubit>().removeListItem(listItem);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChecked(!listItem.completed);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            value: listItem.completed,
            onChanged: onChecked,
          ),
          SizedBox(
            width: 32,
            height: 32,
            child: IconsHelper.getIcon(listItem.iconName),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(listItem.title.toString()),
          Expanded(child: Container()),
          IconButton(
            onPressed: () {
              _deleteItem(context);
            },
            icon: const Icon(Icons.delete),
            color: Colors.redAccent.shade200,
          ),
        ],
      ),
    );
  }
}
