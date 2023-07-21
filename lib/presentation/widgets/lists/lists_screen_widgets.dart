part of 'package:homelist/presentation/screens/lists/lists_screen.dart';

class _TodoLists extends StatelessWidget {
  const _TodoLists({
    required this.todoLists,
  });

  final List<SharedList> todoLists;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Your Todo Lists",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w900),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        ...todoLists.map((todoList) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(16),
              splashColor: Colors.amber,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: AppColors.borderGrey,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Text(todoList.title),
                    Expanded(child: Container()),
                    const Icon(Icons.arrow_right),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}

class _ShoppingLists extends StatelessWidget {
  const _ShoppingLists({
    required this.todoLists,
  });

  final List<SharedList> todoLists;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Your Shopping Lists",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w900),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        ...todoLists.map((todoList) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: InkWell(
              onTap: () {
                context.read<SharedListCubit>().changeCurrentList(todoList);
                context.push(ListDetailsScreen.routeName);
              },
              borderRadius: BorderRadius.circular(16),
              splashColor: Colors.amber,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.borderGrey,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Text(todoList.title),
                    Expanded(child: Container()),
                    const Icon(Icons.arrow_right),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}
