import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/shared_lists/shared_list_cubit.dart';
import 'package:homelist/helpers/icons_helper.dart';
import 'package:homelist/models/list/list_item.dart';

class ListItemWidget extends StatefulWidget {
  const ListItemWidget(
      {super.key, required this.listItem, required this.onChecked});

  final ListItem listItem;
  final void Function(bool?) onChecked;

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  late bool isCompleted;

  @override
  void initState() {
    super.initState();
    isCompleted = widget.listItem.completed;
  }

  @override
  void didUpdateWidget(covariant ListItemWidget oldWidget) {
    isCompleted = widget.listItem.completed;
    super.didUpdateWidget(oldWidget);
  }

  void _deleteItem(BuildContext context) {
    context.read<SharedListCubit>().removeListItem(widget.listItem);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChecked(!widget.listItem.completed);
        setState(() {
          isCompleted = !isCompleted;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            value: isCompleted,
            onChanged: (value) {
              widget.onChecked(value);
              setState(() {
                isCompleted = value!;
              });
            },
          ),
          SizedBox(
            width: 32,
            height: 32,
            child: IconsHelper.getIcon(widget.listItem.iconName),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(widget.listItem.title.toString()),
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
