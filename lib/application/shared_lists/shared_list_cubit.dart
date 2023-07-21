import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/shared_lists/shared_list_cubit_state.dart';
import 'package:homelist/models/list/list.dart';

class SharedListCubit extends Cubit<SharedListCubitCubitState> {
  SharedListCubit()
      : super(
          SharedListCubitCubitState.initialState(),
        );

  void changeCurrentList(SharedList newList) {
    emit(
      state.copyWith(currentList: newList),
    );
  }

  void clearCurrentList() {
    emit(
      state.copyWith(currentList: null),
    );
  }
}
