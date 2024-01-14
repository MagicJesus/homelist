import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/shared_lists/shared_list_cubit_state.dart';
import 'package:homelist/application/status.dart';
import 'package:homelist/models/list/list.dart';
import 'package:homelist/models/list/list_item.dart';
import 'package:homelist/repositories/firestore/firestore_repository.dart';
import 'package:user_repository/user_repository.dart';

class SharedListCubit extends Cubit<SharedListCubitState> {
  SharedListCubit(this._firestoreRepository)
      : super(
          SharedListCubitState.initialState(),
        );

  final FirestoreRepository _firestoreRepository;
  StreamSubscription<List<SharedList>>? _allListsSubscription;
  StreamSubscription<List<SharedList>>? _sharedListsSubscription;
  StreamSubscription<SharedList?>? _currentListSubscription;
  StreamSubscription<List<UserData>>? _usersToShareSubscription;

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
      await _allListsSubscription!.cancel();
    }

    final Stream<List<SharedList>> listsStream =
        await _firestoreRepository.getUserListsStream(userId);

    _allListsSubscription = listsStream.listen(
      (List<SharedList> event) {
        emit(
          state.copyWith(
            allListsStatus: Status.loaded,
            allLists: event,
          ),
        );
      },
    );
  }

  Future<void> loadListsSharedWithUserStream(String userId) async {
    emit(state.copyWith(sharedListsStatus: Status.loading));

    if (_sharedListsSubscription != null) {
      await _sharedListsSubscription!.cancel();
    }

    final Stream<List<SharedList>> sharedListsStream =
        await _firestoreRepository.getSharedListsStream(userId);

    _sharedListsSubscription =
        sharedListsStream.listen((List<SharedList> event) {
      emit(
        state.copyWith(
          sharedListsStatus: Status.loaded,
          sharedLists: event,
        ),
      );
    });
  }

  Future<void> loadCurrentListStream() async {
    emit(state.copyWith(currentListStatus: Status.loading));
    if (_currentListSubscription != null) {
      await _currentListSubscription!.cancel();
    }

    final Stream<SharedList?> currentListStream =
        _firestoreRepository.getCurrentListStream(
      state.currentList!.id!,
    );

    _currentListSubscription = currentListStream.listen(
      (SharedList? event) {
        emit(
          state.copyWith(
            currentListStatus: Status.loaded,
            currentList: event,
          ),
        );
      },
    );
  }

  Future<void> loadUsersToShareStream(String currentUserId) async {
    if (_usersToShareSubscription != null) {
      await _usersToShareSubscription!.cancel();
    }

    final Stream<List<UserData>> usersToShareStream =
        _firestoreRepository.getUsersToShareStream(
      currentUserId,
      state.currentList!,
    );

    _usersToShareSubscription = usersToShareStream.listen(
      (List<UserData> event) {
        emit(
          state.copyWith(
            usersToShare: event,
          ),
        );
      },
    );
  }

  Future<void> shareListToUsers(List<UserData> usersToShareWith) async {
    await _firestoreRepository.shareListToUsers(
      state.currentList!,
      usersToShareWith,
    );
  }

  Future<void> addNewList(
    String title,
    ListType listType,
    String ownerId,
  ) async {
    emit(
      state.copyWith(allListsStatus: Status.loading),
    );
    final SharedList newList = SharedList(
      ownerId: ownerId,
      title: title,
      items: <ListItem>[],
      type: listType,
      allowedUsersIds: <String>[],
    );
    await _firestoreRepository.createList(newList);
  }

  Future<void> addNewListItem(ListItem newItem) async {
    await _firestoreRepository.addListItem(
      state.currentList!,
      newItem,
    );
  }

  Future<void> editListItem(ListItem editedItem) async {
    await _firestoreRepository.editListItem(
      state.currentList!,
      editedItem,
    );
  }

  Future<void> removeListItem(ListItem itemToDelete) async {
    await _firestoreRepository.removeListItem(
      state.currentList!,
      itemToDelete,
    );
  }
}
