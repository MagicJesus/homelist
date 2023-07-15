import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homelist/application/auth/auth_cubit.dart';
import 'package:homelist/application/auth/auth_state.dart';
import 'package:homelist/application/bottom_nav/bottom_nav_cubit.dart';
import 'package:homelist/application/bottom_nav/bottom_nav_cubit_state.dart';
import 'package:homelist/application/status.dart';
import 'package:homelist/application/user/user_cubit.dart';
import 'package:homelist/application/user/user_cubit_state.dart';
import 'package:homelist/presentation/constants.dart';

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
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state.authStatus == Status.initial) {
        GoRouter.of(context).refresh();
      }
    }, builder: (context, state) {
      return BlocBuilder<UserCubit, UserCubitState>(
          builder: (context, userState) {
        return Scaffold(
          appBar: AppBar(
            titleTextStyle:
                Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: AppColors.textWhite,
                    ),
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            title: Text(widget.title),
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
          ),
          body: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
                color: Colors.amber,
                height: 75,
                child: const Center(
                  child: Text("Home"),
                ),
              ),
              const Center(
                child: Text("Lists"),
              ),
              const Center(
                child: Text("Budget"),
              ),
              const Center(
                child: Text("Calendar"),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniEndFloat,
          bottomNavigationBar: BlocBuilder<BottomNavCubit, BottomNavCubitState>(
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
              onDestinationSelected: (index) {
                pageController.jumpToPage(
                  index,
                );
                context.read<BottomNavCubit>().changeIndex(
                      index,
                    );
              },
            );
          }),
        );
      });
    });
  }
}
