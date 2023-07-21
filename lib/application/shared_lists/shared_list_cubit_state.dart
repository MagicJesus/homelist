import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:homelist/models/list/list.dart';

part 'shared_list_cubit_state.freezed.dart';

@freezed
class SharedListCubitCubitState with _$SharedListCubitCubitState {
  factory SharedListCubitCubitState({
    required SharedList? currentList,
  }) = _SharedListCubitCubitState;

  factory SharedListCubitCubitState.initialState() {
    return SharedListCubitCubitState(
      currentList: null,
    );
  }
}
