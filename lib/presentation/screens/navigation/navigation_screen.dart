import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/auth/auth_cubit.dart';
import 'package:homelist/application/auth/auth_state.dart';
import 'package:homelist/application/bottom_nav/bottom_nav_cubit.dart';
import 'package:homelist/application/bottom_nav/bottom_nav_cubit_state.dart';
import 'package:homelist/application/budget/budget_cubit.dart';
import 'package:homelist/application/shared_lists/shared_list_cubit.dart';
import 'package:homelist/application/user/user_cubit.dart';
import 'package:homelist/application/user/user_cubit_state.dart';
import 'package:homelist/presentation/constants.dart';
import 'package:homelist/presentation/screens/budget/budget_screen.dart';
import 'package:homelist/presentation/screens/calendar/calendar_screen.dart';
import 'package:homelist/presentation/screens/lists/lists_screen.dart';
import 'package:homelist/presentation/widgets/budget/add_group_form.dart';
import 'package:homelist/presentation/widgets/common/homelist_appbar.dart';
import 'package:homelist/presentation/widgets/lists/add_list_widget.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key, required this.title});

  static const routeName = '/';

  final String title;

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    context.read<SharedListCubit>().loadUserListsStream(
          context.read<UserCubit>().state.userData!.id,
        );
    context.read<SharedListCubit>().loadListsSharedWithUserStream(
          context.read<UserCubit>().state.userData!.id,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return BlocBuilder<UserCubit, UserCubitState>(
          builder: (context, userState) {
            return Scaffold(
              appBar: const HomeListAppBar(
                title: Labels.homePageTitle,
              ),
              body: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const ListsScreen(),
                  BudgetScreen(),
                  const CalendarScreen(),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  final currentIndex =
                      context.read<BottomNavCubit>().state.currentPageIndex;
                  if (currentIndex == 0) {
                    showDialog<AddListForm>(
                      context: context,
                      builder: (context) {
                        return const AddListForm();
                      },
                    );
                  }
                  if (currentIndex == 1) {
                    showDialog<AddGroupForm>(
                      context: context,
                      builder: (context) {
                        return const AddGroupForm();
                      },
                    );
                  }
                },
                shape: const CircleBorder(),
                child: const Icon(Icons.add),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.miniEndFloat,
              bottomNavigationBar:
                  BlocBuilder<BottomNavCubit, BottomNavCubitState>(
                builder: (context, navState) {
                  return NavigationBar(
                    destinations: const [
                      NavigationDestination(
                        icon: Icon(Icons.list),
                        label: "Lists",
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.attach_money),
                        label: "Budget",
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.calendar_month_outlined),
                        label: "Calendar",
                      ),
                    ],
                    selectedIndex: navState.currentPageIndex,
                    onDestinationSelected: (index) async {
                      pageController.jumpToPage(
                        index,
                      );
                      if (index == BottomNavPage.lists.getPageIndex()) {
                        context.read<SharedListCubit>().loadUserListsStream(
                              context.read<UserCubit>().state.userData!.id,
                            );
                        context
                            .read<SharedListCubit>()
                            .loadListsSharedWithUserStream(
                              context.read<UserCubit>().state.userData!.id,
                            );
                      }
                      if (index == BottomNavPage.budget.getPageIndex()) {
                        await context
                            .read<BudgetCubit>()
                            .listenToAllExpenseGroupsStream(
                              context.read<UserCubit>().state.userData!,
                            );
                      }
                      if (context.mounted) {
                        await context.read<BottomNavCubit>().changeIndex(
                              index,
                            );
                      }
                      setState(() {});
                    },
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
