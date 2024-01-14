import 'package:get_it/get_it.dart';
import 'package:homelist/repositories/auth/auth_repository.dart';
import 'package:homelist/repositories/firestore/expenses_repository.dart';
import 'package:homelist/repositories/firestore/firestore_repository.dart';
import 'package:user_repository/user_repository.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt
    ..registerSingleton<FirestoreRepository>(FirestoreRepository())
    ..registerSingleton<AuthRepository>(AuthRepository())
    ..registerSingleton<ExpensesRepository>(ExpensesRepository())
    ..registerSingleton<UsersRepository>(UsersRepository());
}
