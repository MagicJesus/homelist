import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/shared_lists/shared_list_cubit.dart';
import 'package:homelist/application/shared_lists/shared_list_cubit_state.dart';
import 'package:homelist/application/status.dart';
import 'package:homelist/models/list/list.dart';
import 'package:homelist/presentation/widgets/lists/shared_list_tile.dart';

part 'package:homelist/presentation/widgets/lists/lists_screen_widgets.dart';

class ListsScreen extends StatelessWidget {
  const ListsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<SharedListCubit, SharedListCubitState>(
        builder: (context, listsState) {
          return listsState.allListsStatus == Status.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        _ListsWidget(
                          lists: listsState.todoLists,
                          title: "Your Todo Lists",
                          listsType: ListsType.todo,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Divider(
                          indent: 48,
                          endIndent: 48,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        _ListsWidget(
                          lists: listsState.shoppingLists,
                          title: "Your Shopping Lists",
                          listsType: ListsType.shopping,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Divider(
                          indent: 48,
                          endIndent: 48,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        _ListsWidget(
                          lists: listsState.sharedLists,
                          title: "Lists Shared with You",
                          listsType: ListsType.shared,
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
