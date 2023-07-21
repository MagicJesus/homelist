import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/bottom_nav/bottom_nav_cubit_state.dart';

class BottomNavCubit extends Cubit<BottomNavCubitState> {
  BottomNavCubit()
      : super(
          BottomNavCubitState.initialState(),
        );

  Future<void> changeIndex(int newIndex) async {
    emit(
      state.copyWith(currentPageIndex: newIndex),
    );
  }
}
