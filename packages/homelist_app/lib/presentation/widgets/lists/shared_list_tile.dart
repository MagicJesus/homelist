import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homelist/application/shared_lists/shared_list_cubit.dart';
import 'package:homelist/models/list/list.dart';
import 'package:homelist/presentation/screens/lists/list_details_screen.dart';

class SharedListTile extends StatelessWidget {
  const SharedListTile({
    super.key,
    required this.list,
  });

  final SharedList list;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          context.read<SharedListCubit>().changeCurrentList(list);
          context.push(ListDetailsScreen.routeName);
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: Text(
                      list.title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ),
                  ),
                  Text('${list.items.length.toString()} items'),
                ],
              ),
              Expanded(
                child: Container(),
              ),
              const Icon(Icons.arrow_right),
            ],
          ),
        ),
      ),
    );
  }
}
