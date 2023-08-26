import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/user/user_cubit_state.dart';
import 'package:homelist/models/user/user.dart';
import 'package:homelist/repositories/firestore/firestore_repository.dart';
import 'package:homelist/repositories/firestore/users_repository.dart';

class UserCubit extends Cubit<UserCubitState> {
  final FirestoreRepository _firestoreRepository;
  final UsersRepository _usersRepository;

  late StreamSubscription firebaseUserStreamSubscription;

  UserCubit(
    this._firestoreRepository,
    this._usersRepository,
  ) : super(UserCubitState.initial()) {
    firebaseUserStreamSubscription =
        _firestoreRepository.userDataStream.stream.listen((UserData? userData) {
      if (userData != null) {
        emit(
          state.copyWith(
            userData: userData,
          ),
        );
      }
    }, onError: (e) {
      log(e.toString());
    });
  }

  Future<void> getUserData(String uid) async {
    await _firestoreRepository.getUserData(uid);
  }

  Future<void> getUsersToShareStream(List<String> usersToExclude) async {
    final usersToShareStream = await _usersRepository.getUsersToShareStream(
      state.userData!.id,
      usersToExclude,
    );

    usersToShareStream.listen((event) {
      emit(
        state.copyWith(usersToShare: event),
      );
    });
  }
}
