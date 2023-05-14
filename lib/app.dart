import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/auth/auth_cubit.dart';
import 'package:homelist/application/core/navigation.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp.router(
        title: 'HomeList',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 182, 226, 81),
          ),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        routeInformationParser: NavigationService.router.routeInformationParser,
        routeInformationProvider:
            NavigationService.router.routeInformationProvider,
        routerDelegate: NavigationService.router.routerDelegate,
      ),
    );
  }
}
