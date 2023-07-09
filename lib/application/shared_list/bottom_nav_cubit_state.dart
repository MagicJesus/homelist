import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_nav_cubit_state.freezed.dart';

@freezed
class BottomNavCubitState with _$BottomNavCubitState {
  factory BottomNavCubitState({
    required int currentPageIndex,
  }) = _BottomNavCubitState;

  factory BottomNavCubitState.initialState() {
    return BottomNavCubitState(
      currentPageIndex: 0,
    );
  }
}
