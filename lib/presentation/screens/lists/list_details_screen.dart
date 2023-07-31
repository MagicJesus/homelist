import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/shared_lists/shared_list_cubit.dart';
import 'package:homelist/application/shared_lists/shared_list_cubit_state.dart';
import 'package:homelist/presentation/widgets/common/homelist_appbar.dart';
import 'package:homelist/presentation/widgets/lists/list_item_widget.dart';
import 'package:homelist/presentation/widgets/lists/share_list_widget.dart';

class ListDetailsScreen extends StatefulWidget {
  const ListDetailsScreen({
    super.key,
  });

  static const routeName = '/list_details';

  @override
  State<ListDetailsScreen> createState() => _ListDetailsScreenState();
}

class _ListDetailsScreenState extends State<ListDetailsScreen> {
  @override
  void initState() {
    context.read<SharedListCubit>().loadCurrentListStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SharedListCubit, SharedListCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: HomeListAppBar(
            title: state.currentList!.title,
            smallTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ShareListWidget();
                    },
                  );
                },
                icon: const Icon(Icons.share),
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListItemWidget(
                      listItem: state.currentList!.items[index]!,
                      onChecked: (value) {
                        if (value != null) {
                          context.read<SharedListCubit>().editListItem(
                                state.currentList!.items[index]!
                                    .copyWith(completed: value),
                              );
                        }
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      indent: 8,
                      endIndent: 12,
                    );
                  },
                  itemCount: state.currentList!.items.length,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<SharedListCubit>().addNewListItem();
                      },
                      child: const Text("Add item"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
