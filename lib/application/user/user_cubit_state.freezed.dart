// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_cubit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserCubitState {
  UserData? get userData => throw _privateConstructorUsedError;
  List<UserData> get usersToShare => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCubitStateCopyWith<UserCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCubitStateCopyWith<$Res> {
  factory $UserCubitStateCopyWith(
          UserCubitState value, $Res Function(UserCubitState) then) =
      _$UserCubitStateCopyWithImpl<$Res, UserCubitState>;
  @useResult
  $Res call({UserData? userData, List<UserData> usersToShare});

  $UserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class _$UserCubitStateCopyWithImpl<$Res, $Val extends UserCubitState>
    implements $UserCubitStateCopyWith<$Res> {
  _$UserCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userData = freezed,
    Object? usersToShare = null,
  }) {
    return _then(_value.copyWith(
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData?,
      usersToShare: null == usersToShare
          ? _value.usersToShare
          : usersToShare // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res>? get userData {
    if (_value.userData == null) {
      return null;
    }

    return $UserDataCopyWith<$Res>(_value.userData!, (value) {
      return _then(_value.copyWith(userData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserCubitStateCopyWith<$Res>
    implements $UserCubitStateCopyWith<$Res> {
  factory _$$_UserCubitStateCopyWith(
          _$_UserCubitState value, $Res Function(_$_UserCubitState) then) =
      __$$_UserCubitStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserData? userData, List<UserData> usersToShare});

  @override
  $UserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class __$$_UserCubitStateCopyWithImpl<$Res>
    extends _$UserCubitStateCopyWithImpl<$Res, _$_UserCubitState>
    implements _$$_UserCubitStateCopyWith<$Res> {
  __$$_UserCubitStateCopyWithImpl(
      _$_UserCubitState _value, $Res Function(_$_UserCubitState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userData = freezed,
    Object? usersToShare = null,
  }) {
    return _then(_$_UserCubitState(
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData?,
      usersToShare: null == usersToShare
          ? _value._usersToShare
          : usersToShare // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
    ));
  }
}

/// @nodoc

class _$_UserCubitState implements _UserCubitState {
  _$_UserCubitState(
      {required this.userData, required final List<UserData> usersToShare})
      : _usersToShare = usersToShare;

  @override
  final UserData? userData;
  final List<UserData> _usersToShare;
  @override
  List<UserData> get usersToShare {
    if (_usersToShare is EqualUnmodifiableListView) return _usersToShare;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usersToShare);
  }

  @override
  String toString() {
    return 'UserCubitState(userData: $userData, usersToShare: $usersToShare)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserCubitState &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            const DeepCollectionEquality()
                .equals(other._usersToShare, _usersToShare));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userData,
      const DeepCollectionEquality().hash(_usersToShare));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCubitStateCopyWith<_$_UserCubitState> get copyWith =>
      __$$_UserCubitStateCopyWithImpl<_$_UserCubitState>(this, _$identity);
}

abstract class _UserCubitState implements UserCubitState {
  factory _UserCubitState(
      {required final UserData? userData,
      required final List<UserData> usersToShare}) = _$_UserCubitState;

  @override
  UserData? get userData;
  @override
  List<UserData> get usersToShare;
  @override
  @JsonKey(ignore: true)
  _$$_UserCubitStateCopyWith<_$_UserCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}
