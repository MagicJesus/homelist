import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:homelist/application/status.dart';
import 'package:homelist/models/list/list.dart';

part 'shared_list_cubit_state.freezed.dart';

@freezed
class SharedListCubitState with _$SharedListCubitState {
  SharedListCubitState._();

  factory SharedListCubitState({
    required List<SharedList> allLists,
    required SharedList? currentList,
    required Status allListsStatus,
    required Status currentListStatus,
  }) = _SharedListCubitState;

  factory SharedListCubitState.initialState() {
    return SharedListCubitState(
      currentListStatus: Status.initial,
      currentList: null,
      allListsStatus: Status.initial,
      allLists: [],
    );
  }

  List<SharedList> get todoLists {
    return allLists.where((element) => element.type == ListType.todo).toList();
  }

  List<SharedList> get shoppingLists {
    return allLists
        .where((element) => element.type == ListType.shopping)
        .toList();
  }
}
