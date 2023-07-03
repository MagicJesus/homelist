import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homelist/application/auth/auth_cubit.dart';
import 'package:homelist/application/status.dart';
import 'package:homelist/presentation/constants.dart';
import 'package:homelist/presentation/screens/home/home_screen.dart';
import 'package:homelist/presentation/screens/login/log_in_screen.dart';

class NavigationService {
  NavigationService._();

  static GoRouter get router => _router;

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static FutureOr<String?> _redirect(
    BuildContext context,
    GoRouterState state,
  ) {
    if (context.read<AuthCubit>().state.authStatus == Status.loaded) {
      return HomeScreen.routeName;
    } else {
      return LoginScreen.routeName;
    }
  }

  static final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    redirect: _redirect,
    routes: [
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
      )
    ],
  );
}
