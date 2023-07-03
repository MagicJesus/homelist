import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/auth/auth_state.dart';
import 'package:homelist/application/core/preferences.dart';
import 'package:homelist/application/status.dart';
import 'package:homelist/repositories/auth/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final String _staySignedInPrefsKey = 'staySignedIn';

  AuthCubit()
      : super(
          const AuthState(
            isAuthenticated: false,
            authStatus: Status.initial,
            staySignedIn: false,
            userCredential: null,
          ),
        ) {
    _firebaseUserStreamSubscription =
        FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          print("User is not signed in");
        } else {
          emit(
            state.copyWith(isAuthenticated: true, authStatus: Status.loaded),
          );
        }
      },
    );
    initialiseStaySignedIn();
  }

  final _authRepository = AuthRepository();
  late final StreamSubscription _firebaseUserStreamSubscription;

  Future<void> authenticate({
    required String email,
    required String password,
  }) async {
    emit(
      state.copyWith(authStatus: Status.loading),
    );
    final result = await _authRepository.logIn(
      email: email,
      password: password,
    );

    if (result != null) {
      emit(
        state.copyWith(
          isAuthenticated: true,
          userCredential: result,
        ),
      );
    } else {
      emit(
        state.copyWith(authStatus: Status.error),
      );
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    emit(state.copyWith(authStatus: Status.initial));
  }

  void initialiseStaySignedIn() {
    final prefs = PreferencesController.preferencesInstance;
    final ssi = prefs.getBool('staySignedIn');
    if (ssi == null) {
      prefs.setBool(_staySignedInPrefsKey, false);
    } else {
      emit(state.copyWith(staySignedIn: ssi));
    }
  }

  void setStaySignedIn(bool value) {
    final prefs = PreferencesController.preferencesInstance;
    prefs.setBool(_staySignedInPrefsKey, value);
    emit(state.copyWith(staySignedIn: value));
  }

  void logOut() {
    emit(state.copyWith(
      isAuthenticated: false,
    ));
  }
}
