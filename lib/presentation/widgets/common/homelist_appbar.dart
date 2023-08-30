import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/auth/auth_cubit.dart';
import 'package:homelist/application/bottom_nav/bottom_nav_cubit.dart';
import 'package:homelist/presentation/constants.dart';

class HomeListAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeListAppBar({
    super.key,
    required this.title,
    this.smallTitle = false,
    this.leading,
    this.actions,
  });

  final String title;
  final bool smallTitle;
  final Widget? leading;
  final List<Widget>? actions;

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
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
      centerTitle: true,
      leading: leading,
      actions: actions ??
          [
            IconButton(
              onPressed: () async {
                context.read<BottomNavCubit>().initialState();
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
