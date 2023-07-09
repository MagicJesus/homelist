// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottom_nav_cubit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BottomNavCubitState {
  int get currentPageIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BottomNavCubitStateCopyWith<BottomNavCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomNavCubitStateCopyWith<$Res> {
  factory $BottomNavCubitStateCopyWith(
          BottomNavCubitState value, $Res Function(BottomNavCubitState) then) =
      _$BottomNavCubitStateCopyWithImpl<$Res, BottomNavCubitState>;
  @useResult
  $Res call({int currentPageIndex});
}

/// @nodoc
class _$BottomNavCubitStateCopyWithImpl<$Res, $Val extends BottomNavCubitState>
    implements $BottomNavCubitStateCopyWith<$Res> {
  _$BottomNavCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPageIndex = null,
  }) {
    return _then(_value.copyWith(
      currentPageIndex: null == currentPageIndex
          ? _value.currentPageIndex
          : currentPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BottomNavCubitStateCopyWith<$Res>
    implements $BottomNavCubitStateCopyWith<$Res> {
  factory _$$_BottomNavCubitStateCopyWith(_$_BottomNavCubitState value,
          $Res Function(_$_BottomNavCubitState) then) =
      __$$_BottomNavCubitStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentPageIndex});
}

/// @nodoc
class __$$_BottomNavCubitStateCopyWithImpl<$Res>
    extends _$BottomNavCubitStateCopyWithImpl<$Res, _$_BottomNavCubitState>
    implements _$$_BottomNavCubitStateCopyWith<$Res> {
  __$$_BottomNavCubitStateCopyWithImpl(_$_BottomNavCubitState _value,
      $Res Function(_$_BottomNavCubitState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPageIndex = null,
  }) {
    return _then(_$_BottomNavCubitState(
      currentPageIndex: null == currentPageIndex
          ? _value.currentPageIndex
          : currentPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_BottomNavCubitState implements _BottomNavCubitState {
  _$_BottomNavCubitState({required this.currentPageIndex});

  @override
  final int currentPageIndex;

  @override
  String toString() {
    return 'BottomNavCubitState(currentPageIndex: $currentPageIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BottomNavCubitState &&
            (identical(other.currentPageIndex, currentPageIndex) ||
                other.currentPageIndex == currentPageIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentPageIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BottomNavCubitStateCopyWith<_$_BottomNavCubitState> get copyWith =>
      __$$_BottomNavCubitStateCopyWithImpl<_$_BottomNavCubitState>(
          this, _$identity);
}

abstract class _BottomNavCubitState implements BottomNavCubitState {
  factory _BottomNavCubitState({required final int currentPageIndex}) =
      _$_BottomNavCubitState;

  @override
  int get currentPageIndex;
  @override
  @JsonKey(ignore: true)
  _$$_BottomNavCubitStateCopyWith<_$_BottomNavCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}
