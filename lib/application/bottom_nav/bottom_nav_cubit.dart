import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/bottom_nav/bottom_nav_cubit_state.dart';

class BottomNavCubit extends Cubit<BottomNavCubitState> {
  BottomNavCubit()
      : super(
          BottomNavCubitState.initialState(),
        );

  void changeIndex(int newIndex) {
    emit(
      state.copyWith(currentPageIndex: newIndex),
    );
  }
}
