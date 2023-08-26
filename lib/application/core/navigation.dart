import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homelist/presentation/constants.dart';
import 'package:homelist/presentation/screens/budget/expense_group_screen.dart';
import 'package:homelist/presentation/screens/home/home_screen.dart';
import 'package:homelist/presentation/screens/lists/list_details_screen.dart';
import 'package:homelist/presentation/screens/login/log_in_screen.dart';
import 'package:homelist/presentation/screens/login/sign_up_screen.dart';

class NavigationService {
  NavigationService._();

  static GoRouter get router => _router;

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static late GoRouter _router;

  static void initRouter({
    required auth,
    required signUp,
  }) {
    _router = _createRouter(auth: auth, signUp: signUp);
  }

  static FutureOr<String?> _redirect(
    BuildContext context,
    GoRouterState state, {
    required bool auth,
    required bool signUp,
  }) {
    if (signUp) {
      return SignUpScreen.routeName;
    }
    if (auth) {
      return null;
    } else {
      return LoginScreen.routeName;
    }
  }

  static GoRouter _createRouter({
    required bool auth,
    required bool signUp,
  }) {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      redirect: (context, state) {
        return _redirect(
          context,
          state,
          auth: auth,
          signUp: signUp,
        );
      },
      routes: allRoutes,
    );
  }

  static final allRoutes = [
    GoRoute(
      name: 'Login',
      path: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: 'Home',
      path: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(
        title: Labels.homePageTitle,
      ),
    ),
    GoRoute(
      name: 'ListDetails',
      path: ListDetailsScreen.routeName,
      builder: (context, state) => const ListDetailsScreen(),
    ),
    GoRoute(
      name: 'SignUp',
      path: SignUpScreen.routeName,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      name: 'ExpenseGroup',
      path: ExpenseGroupScreen.routeName,
      builder: (context, state) => const ExpenseGroupScreen(),
    ),
  ];
}
