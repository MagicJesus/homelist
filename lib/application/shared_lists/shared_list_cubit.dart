import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/shared_lists/shared_list_cubit_state.dart';
import 'package:homelist/application/status.dart';
import 'package:homelist/models/list/list.dart';
import 'package:homelist/models/list/list_item.dart';
import 'package:homelist/repositories/firestore/firestore_repository.dart';
import 'package:uuid/uuid.dart';

class SharedListCubit extends Cubit<SharedListCubitState> {
  SharedListCubit(this._firestoreRepository)
      : super(
          SharedListCubitState.initialState(),
        );

  final FirestoreRepository _firestoreRepository;
  StreamSubscription? _allListsSubscription;
  StreamSubscription? _currentListSubscription;

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

  Future<void> loadUserListsStream(String userId) async {
    emit(state.copyWith(allListsStatus: Status.loading));
    if (_allListsSubscription != null) {
      _allListsSubscription!.cancel();
    }

    final listStream = await _firestoreRepository.getUserListsStream(userId);
    _allListsSubscription = listStream.listen(
      (event) {
        emit(state.copyWith(
          allListsStatus: Status.loaded,
          allLists: event,
        ));
      },
    );
  }

  Future<void> loadCurrentListStream() async {
    emit(state.copyWith(currentListStatus: Status.loading));
    if (_currentListSubscription != null) {
      _currentListSubscription!.cancel();
    }

    final currentListStream = _firestoreRepository.getCurrentListStream(
      state.currentList!.id!,
    );

    _currentListSubscription = currentListStream.listen(
      (event) {
        emit(
          state.copyWith(
            currentListStatus: Status.loaded,
            currentList: event,
          ),
        );
      },
    );
  }

  Future<void> addNewList(
    String title,
    ListType listType,
    String userId,
  ) async {
    emit(
      state.copyWith(allListsStatus: Status.loading),
    );
    final newList = SharedList(
      userId: userId,
      title: title,
      items: [],
      type: listType,
    );
    await _firestoreRepository.createList(newList);
  }

  Future<void> addNewListItem() async {
    await _firestoreRepository.addListItem(
      state.currentList!,
      ListItem(
        id: const Uuid().v1(),
        title: 'NewItem',
        completed: false,
        iconName: IconNames.fruits,
      ),
    );
  }

  Future<void> editListItem(ListItem editedItem) async {
    await _firestoreRepository.editListItem(
      state.currentList!,
      editedItem,
    );
  }
}
