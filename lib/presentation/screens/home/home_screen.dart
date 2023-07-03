import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homelist/application/auth/auth_cubit.dart';
import 'package:homelist/application/auth/auth_state.dart';
import 'package:homelist/application/status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  static const routeName = '/';

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state.authStatus == Status.initial) {
        GoRouter.of(context).refresh();
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Wellcome ${state.userCredential?.user?.email}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await context.read<AuthCubit>().signOut();
          },
          tooltip: 'Logout',
          child: const Icon(Icons.logout),
        ),
      );
    });
  }
}
