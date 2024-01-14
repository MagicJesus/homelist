import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_repository/user_repository.dart';

part 'user_cubit_state.freezed.dart';

@freezed
class UserCubitState with _$UserCubitState {
  factory UserCubitState({
    required UserData? userData,
    required List<UserData> usersToShare,
  }) = _UserCubitState;

  factory UserCubitState.initial() {
    return UserCubitState(
      userData: null,
      usersToShare: [],
    );
  }
}
