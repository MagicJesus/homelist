import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/auth/auth_cubit.dart';
import 'package:homelist/presentation/constants.dart';

class HomeListAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeListAppBar({
    super.key,
    required this.title,
    this.smallTitle = false,
  });

  final String title;
  final bool smallTitle;

  TextStyle _getTitleStyle(BuildContext context) {
    return smallTitle
        ? Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.textWhite,
            )
        : Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: AppColors.textWhite,
            );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleTextStyle: _getTitleStyle(context),
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      title: Text(title),
      actions: [
        IconButton(
          onPressed: () async {
            await context.read<AuthCubit>().signOut();
          },
          icon: const Icon(
            Icons.account_circle_rounded,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
