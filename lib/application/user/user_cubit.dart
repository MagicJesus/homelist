import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/user/user_cubit_state.dart';
import 'package:user_repository/user_repository.dart';

class UserCubit extends Cubit<UserCubitState> {
  UserCubit(
    this._usersRepository,
  ) : super(UserCubitState.initial()) {
    _firebaseUserStreamSubscription =
        _usersRepository.userDataStream.stream.listen(
      (UserData? userData) {
        if (userData != null) {
          emit(
            state.copyWith(
              userData: userData,
            ),
          );
        }
      },
      onError: (Object e) {
        log(e.toString());
      },
    );
  }

  final UsersRepository _usersRepository;

  late StreamSubscription<UserData?> _firebaseUserStreamSubscription;

  Future<void> getUserData(String uid) async {
    await _usersRepository.getUserData(uid);
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

  @override
  Future<void> close() {
    _firebaseUserStreamSubscription.cancel();
    return super.close();
  }
}
