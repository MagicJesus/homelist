import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/user/user_cubit_state.dart';
import 'package:homelist/models/user/user.dart';
import 'package:homelist/repositories/firestore/firestore_repository.dart';

class UserCubit extends Cubit<UserCubitState> {
  final FirestoreRepository _firestoreRepository;

  late StreamSubscription firebaseUserStreamSubscription;

  UserCubit(this._firestoreRepository) : super(UserCubitState.initial()) {
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

  Future<void> createUser(User firebaseUser) async {
    final userData = UserData(
      id: firebaseUser.uid,
      firstName: firebaseUser.displayName ?? 'John',
      lastName: firebaseUser.displayName ?? 'Doe',
    );

    await _firestoreRepository.createUser(userData);
  }
}
