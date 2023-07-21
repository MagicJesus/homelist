import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/shared_lists/shared_list_cubit.dart';
import 'package:homelist/models/list/list.dart';
import 'package:homelist/presentation/widgets/common/homelist_appbar.dart';

class ListDetailsScreen extends StatefulWidget {
  const ListDetailsScreen({
    super.key,
  });

  static const routeName = '/list_details';

  @override
  State<ListDetailsScreen> createState() => _ListDetailsScreenState();
}

class _ListDetailsScreenState extends State<ListDetailsScreen> {
  late final SharedList listData;

  @override
  void initState() {
    listData = context.read<SharedListCubit>().state.currentList!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeListAppBar(
        title: listData.title,
        smallTitle: true,
      ),
      body: Column(children: [
        ...listData.items
            .map(
              (item) => Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Checkbox(value: item!.completed, onChanged: (value) {}),
                    Container(
                      child: Text(item.title),
                    ),
                  ],
                ),
              ),
            )
            .toList()
      ]),
    );
  }
}
