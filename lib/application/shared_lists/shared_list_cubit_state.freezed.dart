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
mixin _$SharedListCubitCubitState {
  SharedList? get currentList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SharedListCubitCubitStateCopyWith<SharedListCubitCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SharedListCubitCubitStateCopyWith<$Res> {
  factory $SharedListCubitCubitStateCopyWith(SharedListCubitCubitState value,
          $Res Function(SharedListCubitCubitState) then) =
      _$SharedListCubitCubitStateCopyWithImpl<$Res, SharedListCubitCubitState>;
  @useResult
  $Res call({SharedList? currentList});

  $SharedListCopyWith<$Res>? get currentList;
}

/// @nodoc
class _$SharedListCubitCubitStateCopyWithImpl<$Res,
        $Val extends SharedListCubitCubitState>
    implements $SharedListCubitCubitStateCopyWith<$Res> {
  _$SharedListCubitCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentList = freezed,
  }) {
    return _then(_value.copyWith(
      currentList: freezed == currentList
          ? _value.currentList
          : currentList // ignore: cast_nullable_to_non_nullable
              as SharedList?,
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
abstract class _$$_SharedListCubitCubitStateCopyWith<$Res>
    implements $SharedListCubitCubitStateCopyWith<$Res> {
  factory _$$_SharedListCubitCubitStateCopyWith(
          _$_SharedListCubitCubitState value,
          $Res Function(_$_SharedListCubitCubitState) then) =
      __$$_SharedListCubitCubitStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SharedList? currentList});

  @override
  $SharedListCopyWith<$Res>? get currentList;
}

/// @nodoc
class __$$_SharedListCubitCubitStateCopyWithImpl<$Res>
    extends _$SharedListCubitCubitStateCopyWithImpl<$Res,
        _$_SharedListCubitCubitState>
    implements _$$_SharedListCubitCubitStateCopyWith<$Res> {
  __$$_SharedListCubitCubitStateCopyWithImpl(
      _$_SharedListCubitCubitState _value,
      $Res Function(_$_SharedListCubitCubitState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentList = freezed,
  }) {
    return _then(_$_SharedListCubitCubitState(
      currentList: freezed == currentList
          ? _value.currentList
          : currentList // ignore: cast_nullable_to_non_nullable
              as SharedList?,
    ));
  }
}

/// @nodoc

class _$_SharedListCubitCubitState implements _SharedListCubitCubitState {
  _$_SharedListCubitCubitState({required this.currentList});

  @override
  final SharedList? currentList;

  @override
  String toString() {
    return 'SharedListCubitCubitState(currentList: $currentList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SharedListCubitCubitState &&
            (identical(other.currentList, currentList) ||
                other.currentList == currentList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentList);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SharedListCubitCubitStateCopyWith<_$_SharedListCubitCubitState>
      get copyWith => __$$_SharedListCubitCubitStateCopyWithImpl<
          _$_SharedListCubitCubitState>(this, _$identity);
}

abstract class _SharedListCubitCubitState implements SharedListCubitCubitState {
  factory _SharedListCubitCubitState({required final SharedList? currentList}) =
      _$_SharedListCubitCubitState;

  @override
  SharedList? get currentList;
  @override
  @JsonKey(ignore: true)
  _$$_SharedListCubitCubitStateCopyWith<_$_SharedListCubitCubitState>
      get copyWith => throw _privateConstructorUsedError;
}
