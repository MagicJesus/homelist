import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/auth/auth_cubit.dart';
import 'package:homelist/application/auth/auth_state.dart';
import 'package:homelist/application/bottom_nav/bottom_nav_cubit.dart';
import 'package:homelist/application/bottom_nav/bottom_nav_cubit_state.dart';
import 'package:homelist/application/shared_lists/shared_list_cubit.dart';
import 'package:homelist/application/user/user_cubit.dart';
import 'package:homelist/application/user/user_cubit_state.dart';
import 'package:homelist/presentation/constants.dart';
import 'package:homelist/presentation/screens/lists/lists_screen.dart';
import 'package:homelist/presentation/widgets/common/homelist_appbar.dart';
import 'package:homelist/presentation/widgets/lists/add_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  static const routeName = '/';

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();

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
                  Container(
                    color: Colors.amber,
                    height: 75,
                    child: Center(
                      child: Text(userState.userData?.id ?? ''),
                    ),
                  ),
                  const ListsScreen(),
                  const Center(
                    child: Text("Budget"),
                  ),
                  const Center(
                    child: Text("Calendar"),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  final currentIndex =
                      context.read<BottomNavCubit>().state.currentPageIndex;
                  if (currentIndex == 1) {
                    showDialog<AddListForm>(
                        context: context,
                        builder: (context) {
                          return const AddListForm();
                        });
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
                        icon: Icon(Icons.home),
                        label: "Home",
                      ),
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
                      if (index == 1) {
                        context.read<SharedListCubit>().loadUserListsStream(
                            context.read<UserCubit>().state.userData!.id);
                      }
                      if (context.mounted) {
                        await context.read<BottomNavCubit>().changeIndex(
                              index,
                            );
                      }
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
