import 'package:flutter/material.dart';
import 'package:homelist/helpers/icons_helper.dart';
import 'package:homelist/models/list/list_item.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget(
      {super.key, required this.listItem, required this.onChecked});

  final ListItem listItem;
  final void Function(bool?) onChecked;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 64,
          height: 64,
          padding: const EdgeInsets.all(16),
          child: IconsHelper.getIcon(listItem.iconName),
        ),
        Text(listItem.title.toString()),
        Expanded(child: Container()),
        Checkbox(
          value: listItem.completed,
          onChanged: onChecked,
        ),
      ],
    );
  }
}
