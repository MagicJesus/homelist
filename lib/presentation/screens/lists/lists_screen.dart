import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homelist/application/shared_lists/shared_list_cubit.dart';
import 'package:homelist/models/list/list.dart';
import 'package:homelist/models/list/list_item.dart';
import 'package:homelist/presentation/constants.dart';
import 'package:homelist/presentation/screens/lists/list_details_screen.dart';

part 'package:homelist/presentation/widgets/lists/lists_screen_widgets.dart';

final shoppingListItems = <ListItem>[
  ListItem(
    title: 'Tomato',
    completed: false,
    iconName: IconNames.vegetables,
  ),
  ListItem(
    title: 'Celery',
    completed: false,
    iconName: IconNames.vegetables,
  ),
  ListItem(
    title: 'Apples',
    completed: false,
    iconName: IconNames.fruits,
  ),
  ListItem(
    title: 'Milk',
    completed: false,
    iconName: IconNames.dairy,
  ),
];

final todoListItems = <ListItem>[
  ListItem(
    title: 'Do homework',
    completed: false,
    iconName: IconNames.todo,
  ),
  ListItem(
    title: 'Implement Home screen',
    completed: false,
    iconName: IconNames.todo,
  ),
  ListItem(
    title: 'Design calendar screen',
    completed: false,
    iconName: IconNames.todo,
  ),
  ListItem(
    title: 'Eat sleep code repeat',
    completed: false,
    iconName: IconNames.todo,
  ),
];

final globalListData = <SharedList>[
  SharedList(
    id: "shoppind_adsad",
    title: 'Breakfast ingredients',
    items: shoppingListItems,
    type: ListType.shopping,
  ),
  SharedList(
    id: "shoppind_adsad",
    title: 'Breakfast ingredients',
    items: shoppingListItems,
    type: ListType.shopping,
  ),
  SharedList(
    id: "shoppind_adsad",
    title: 'Breakfast ingredients',
    items: shoppingListItems,
    type: ListType.shopping,
  ),
  SharedList(
    id: "shoppind_adsad",
    title: 'Breakfast ingredients',
    items: shoppingListItems,
    type: ListType.shopping,
  ),
  SharedList(
    id: "shoppind_adsad",
    title: 'Breakfast ingredients',
    items: shoppingListItems,
    type: ListType.shopping,
  ),
  SharedList(
    id: "shoppind_adsad",
    title: 'Breakfast ingredients',
    items: shoppingListItems,
    type: ListType.shopping,
  ),
  SharedList(
    id: "shoppind_adsad",
    title: 'Breakfast ingredients',
    items: shoppingListItems,
    type: ListType.shopping,
  ),
  SharedList(
    id: "shoppind_adsad",
    title: 'Breakfast ingredients',
    items: shoppingListItems,
    type: ListType.shopping,
  ),
  SharedList(
    id: "shoppind_adsad",
    title: 'Breakfast ingredients',
    items: shoppingListItems,
    type: ListType.shopping,
  ),
  SharedList(
    id: "Todos",
    title: 'Today\'s Work',
    items: todoListItems,
    type: ListType.todo,
  ),
  SharedList(
    id: "Todos",
    title: 'Today\'s Work',
    items: todoListItems,
    type: ListType.todo,
  ),
  SharedList(
    id: "Todos",
    title: 'Today\'s Work',
    items: todoListItems,
    type: ListType.todo,
  ),
  SharedList(
    id: "Todos",
    title: 'Today\'s Work',
    items: todoListItems,
    type: ListType.todo,
  ),
  SharedList(
    id: "Todos",
    title: 'Today\'s Work',
    items: todoListItems,
    type: ListType.todo,
  ),
  SharedList(
    id: "Todos",
    title: 'Today\'s Work',
    items: todoListItems,
    type: ListType.todo,
  ),
];

class ListsScreen extends StatelessWidget {
  ListsScreen({
    super.key,
  });

  final List<SharedList> listData = globalListData;

  List<SharedList>? _getSpecificLists(
    List<SharedList> list,
    ListType type,
  ) {
    if (list.isEmpty) {
      return [];
    }
    if (type == ListType.shopping) {
      return list
          .where(
            (element) => element.type == ListType.shopping,
          )
          .toList();
    }
    if (type == ListType.todo) {
      return list
          .where(
            (element) => element.type == ListType.todo,
          )
          .toList();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final todoLists = _getSpecificLists(listData, ListType.todo);
    final shoppingLists = _getSpecificLists(listData, ListType.shopping);

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          _TodoLists(todoLists: todoLists ?? []),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            indent: 12,
            endIndent: 12,
          ),
          const SizedBox(
            height: 8,
          ),
          _ShoppingLists(todoLists: shoppingLists ?? []),
        ],
      ),
    );
  }
}
