// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shared_list_cubit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SharedListCubitState {
  List<SharedList> get allLists => throw _privateConstructorUsedError;
  SharedList? get currentList => throw _privateConstructorUsedError;
  Status get allListsStatus => throw _privateConstructorUsedError;
  Status get currentListStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SharedListCubitStateCopyWith<SharedListCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SharedListCubitStateCopyWith<$Res> {
  factory $SharedListCubitStateCopyWith(SharedListCubitState value,
          $Res Function(SharedListCubitState) then) =
      _$SharedListCubitStateCopyWithImpl<$Res, SharedListCubitState>;
  @useResult
  $Res call(
      {List<SharedList> allLists,
      SharedList? currentList,
      Status allListsStatus,
      Status currentListStatus});

  $SharedListCopyWith<$Res>? get currentList;
}

/// @nodoc
class _$SharedListCubitStateCopyWithImpl<$Res,
        $Val extends SharedListCubitState>
    implements $SharedListCubitStateCopyWith<$Res> {
  _$SharedListCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allLists = null,
    Object? currentList = freezed,
    Object? allListsStatus = null,
    Object? currentListStatus = null,
  }) {
    return _then(_value.copyWith(
      allLists: null == allLists
          ? _value.allLists
          : allLists // ignore: cast_nullable_to_non_nullable
              as List<SharedList>,
      currentList: freezed == currentList
          ? _value.currentList
          : currentList // ignore: cast_nullable_to_non_nullable
              as SharedList?,
      allListsStatus: null == allListsStatus
          ? _value.allListsStatus
          : allListsStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      currentListStatus: null == currentListStatus
          ? _value.currentListStatus
          : currentListStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SharedListCopyWith<$Res>? get currentList {
    if (_value.currentList == null) {
      return null;
    }

    return $SharedListCopyWith<$Res>(_value.currentList!, (value) {
      return _then(_value.copyWith(currentList: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SharedListCubitStateCopyWith<$Res>
    implements $SharedListCubitStateCopyWith<$Res> {
  factory _$$_SharedListCubitStateCopyWith(_$_SharedListCubitState value,
          $Res Function(_$_SharedListCubitState) then) =
      __$$_SharedListCubitStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SharedList> allLists,
      SharedList? currentList,
      Status allListsStatus,
      Status currentListStatus});

  @override
  $SharedListCopyWith<$Res>? get currentList;
}

/// @nodoc
class __$$_SharedListCubitStateCopyWithImpl<$Res>
    extends _$SharedListCubitStateCopyWithImpl<$Res, _$_SharedListCubitState>
    implements _$$_SharedListCubitStateCopyWith<$Res> {
  __$$_SharedListCubitStateCopyWithImpl(_$_SharedListCubitState _value,
      $Res Function(_$_SharedListCubitState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allLists = null,
    Object? currentList = freezed,
    Object? allListsStatus = null,
    Object? currentListStatus = null,
  }) {
    return _then(_$_SharedListCubitState(
      allLists: null == allLists
          ? _value._allLists
          : allLists // ignore: cast_nullable_to_non_nullable
              as List<SharedList>,
      currentList: freezed == currentList
          ? _value.currentList
          : currentList // ignore: cast_nullable_to_non_nullable
              as SharedList?,
      allListsStatus: null == allListsStatus
          ? _value.allListsStatus
          : allListsStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      currentListStatus: null == currentListStatus
          ? _value.currentListStatus
          : currentListStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$_SharedListCubitState extends _SharedListCubitState {
  _$_SharedListCubitState(
      {required final List<SharedList> allLists,
      required this.currentList,
      required this.allListsStatus,
      required this.currentListStatus})
      : _allLists = allLists,
        super._();

  final List<SharedList> _allLists;
  @override
  List<SharedList> get allLists {
    if (_allLists is EqualUnmodifiableListView) return _allLists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allLists);
  }

  @override
  final SharedList? currentList;
  @override
  final Status allListsStatus;
  @override
  final Status currentListStatus;

  @override
  String toString() {
    return 'SharedListCubitState(allLists: $allLists, currentList: $currentList, allListsStatus: $allListsStatus, currentListStatus: $currentListStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SharedListCubitState &&
            const DeepCollectionEquality().equals(other._allLists, _allLists) &&
            (identical(other.currentList, currentList) ||
                other.currentList == currentList) &&
            (identical(other.allListsStatus, allListsStatus) ||
                other.allListsStatus == allListsStatus) &&
            (identical(other.currentListStatus, currentListStatus) ||
                other.currentListStatus == currentListStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allLists),
      currentList,
      allListsStatus,
      currentListStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SharedListCubitStateCopyWith<_$_SharedListCubitState> get copyWith =>
      __$$_SharedListCubitStateCopyWithImpl<_$_SharedListCubitState>(
          this, _$identity);
}

abstract class _SharedListCubitState extends SharedListCubitState {
  factory _SharedListCubitState(
      {required final List<SharedList> allLists,
      required final SharedList? currentList,
      required final Status allListsStatus,
      required final Status currentListStatus}) = _$_SharedListCubitState;
  _SharedListCubitState._() : super._();

  @override
  List<SharedList> get allLists;
  @override
  SharedList? get currentList;
  @override
  Status get allListsStatus;
  @override
  Status get currentListStatus;
  @override
  @JsonKey(ignore: true)
  _$$_SharedListCubitStateCopyWith<_$_SharedListCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}
