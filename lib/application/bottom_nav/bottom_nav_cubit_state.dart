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

enum BottomNavPage {
  lists,
  budget,
  calendar,
}

extension BottomPageIndex on BottomNavPage {
  int getPageIndex() {
    switch (this) {
      case BottomNavPage.lists:
        return 1;
      case BottomNavPage.budget:
        return 2;
      case BottomNavPage.calendar:
        return 3;
      default:
        return 0;
    }
  }
}
