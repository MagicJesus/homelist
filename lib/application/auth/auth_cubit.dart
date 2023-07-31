import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/auth/auth_state.dart';
import 'package:homelist/application/core/preferences.dart';
import 'package:homelist/application/status.dart';
import 'package:homelist/models/user/user.dart';
import 'package:homelist/repositories/auth/auth_repository.dart';
import 'package:homelist/repositories/firestore/firestore_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._firestoreRepository, this._authRepository)
      : super(
          const AuthState(
            isAuthenticated: false,
            authStatus: Status.initial,
            staySignedIn: false,
            signUp: false,
          ),
        ) {
    _firebaseUserStreamSubscription = _authRepository.userStream.listen(
      (User? user) async {
        if (user == null) {
          emit(
            state.copyWith(
              isAuthenticated: false,
              signUp: false,
              authStatus: Status.initial,
            ),
          );
        } else {
          // Emit succesful auth state + get user data from firestore
          await _getUserData(user);
        }
      },
    );
    initialiseStaySignedIn();
  }

  final String _staySignedInPrefsKey = 'staySignedIn';
  final FirestoreRepository _firestoreRepository;
  final AuthRepository _authRepository;
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

    if (result?.user != null) {
      emit(
        state.copyWith(
          isAuthenticated: true,
          authStatus: Status.loaded,
        ),
      );
    } else {
      emit(
        state.copyWith(authStatus: Status.error),
      );
    }
  }

  Future<void> _getUserData(User user) async {
    await _firestoreRepository.getUserData(user.uid);
    emit(
      state.copyWith(
        isAuthenticated: true,
        authStatus: Status.loaded,
        signUp: false,
      ),
    );
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

  void setUserData() {}

  void logOut() {
    emit(state.copyWith(
      isAuthenticated: false,
    ));
    _firebaseUserStreamSubscription.cancel();
  }

  void signUp() {
    emit(state.copyWith(signUp: true));
  }

  void removeSignUp() {
    emit(state.copyWith(signUp: false));
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    log('$firstName, $lastName, $email, $password');
    emit(
      state.copyWith(authStatus: Status.loading),
    );
    try {
      final userData =
          await _authRepository.createUserWithEmailAndPassword(email, password);
      final newUser = UserData(
        id: userData!.user!.uid,
        firstName: firstName,
        lastName: lastName,
        email: email,
      );
      await _firestoreRepository.createUser(newUser);
      await authenticate(email: email, password: password);
    } catch (e) {
      log(e.toString());
    }
  }
}
