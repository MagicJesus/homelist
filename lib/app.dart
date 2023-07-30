import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/auth/auth_cubit.dart';
import 'package:homelist/application/bottom_nav/bottom_nav_cubit.dart';
import 'package:homelist/application/core/navigation.dart';
import 'package:homelist/application/shared_lists/shared_list_cubit.dart';
import 'package:homelist/application/status.dart';
import 'package:homelist/application/user/user_cubit.dart';
import 'package:homelist/getit_config.dart';
import 'package:homelist/presentation/constants.dart';
import 'package:homelist/repositories/auth/auth_repository.dart';
import 'package:homelist/repositories/firestore/firestore_repository.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(
            getIt<FirestoreRepository>(),
            getIt<AuthRepository>(),
          ),
        ),
        BlocProvider<BottomNavCubit>(
          create: (context) => BottomNavCubit(),
          lazy: false,
        ),
        BlocProvider<UserCubit>(
          create: (context) => UserCubit(
            getIt<FirestoreRepository>(),
          ),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => SharedListCubit(
            getIt<FirestoreRepository>(),
          ),
        ),
      ],
      child: Builder(builder: (context) {
        log("BuuldingApp");
        NavigationService.initRouter(
          auth: context.select<AuthCubit, bool>(
            (cubit) => cubit.state.authStatus == Status.loaded,
          ),
          signUp: context.select<AuthCubit, bool>(
            (cubit) => cubit.state.signUp,
          ),
        );
        final router = NavigationService.router;
        return MaterialApp.router(
          title: 'HomeList',
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
          routerDelegate: router.routerDelegate,
        );
      }),
    );
  }
}
