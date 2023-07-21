part of 'package:homelist/presentation/screens/lists/lists_screen.dart';

class _ListsWidget extends StatelessWidget {
  const _ListsWidget({
    required this.lists,
    required this.title,
    required this.isTodo,
  });

  final List<SharedList> lists;
  final String title;
  final bool isTodo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w900),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        if (lists.isEmpty)
          _EmptyWidget(
            isTodo: isTodo,
          ),
        if (lists.isNotEmpty)
          ...lists.map((todoList) {
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

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget({
    required this.isTodo,
  });

  final bool isTodo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(),
                shape: BoxShape.circle,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              isTodo ? "No Todo Lists Yet :C" : "No Shopping Lists Yet :C",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Icon(
              isTodo ? Icons.task : Icons.shopping_bag_outlined,
              size: 64,
            ),
          ),
        ],
      ),
    );
  }
}

// class _ShoppingLists extends StatelessWidget {
//   const _ShoppingLists({
//     required this.shoppingLists,
//   });

//   final List<SharedList> shoppingLists;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Text(
//             "Your Shopping Lists",
//             style: Theme.of(context)
//                 .textTheme
//                 .headlineSmall!
//                 .copyWith(fontWeight: FontWeight.w900),
//           ),
//         ),
//         const SizedBox(
//           height: 12,
//         ),
//         if (shoppingLists.isEmpty) const Text('data'),
//         ...shoppingLists.map((todoList) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//             child: InkWell(
//               onTap: () {
//                 context.read<SharedListCubit>().changeCurrentList(todoList);
//                 context.push(ListDetailsScreen.routeName);
//               },
//               borderRadius: BorderRadius.circular(16),
//               splashColor: Colors.amber,
//               child: Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: AppColors.borderGrey,
//                   ),
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Row(
//                   children: [
//                     Text(todoList.title),
//                     Expanded(child: Container()),
//                     const Icon(Icons.arrow_right),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }).toList(),
//       ],
//     );
//   }
// }
