// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  bool get isAuthenticated => throw _privateConstructorUsedError;
  bool get staySignedIn => throw _privateConstructorUsedError;
  Status get authStatus => throw _privateConstructorUsedError;
  UserCredential? get userCredential => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {bool isAuthenticated,
      bool staySignedIn,
      Status authStatus,
      UserCredential? userCredential});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuthenticated = null,
    Object? staySignedIn = null,
    Object? authStatus = null,
    Object? userCredential = freezed,
  }) {
    return _then(_value.copyWith(
      isAuthenticated: null == isAuthenticated
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      staySignedIn: null == staySignedIn
          ? _value.staySignedIn
          : staySignedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      authStatus: null == authStatus
          ? _value.authStatus
          : authStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      userCredential: freezed == userCredential
          ? _value.userCredential
          : userCredential // ignore: cast_nullable_to_non_nullable
              as UserCredential?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$_AuthStateCopyWith(
          _$_AuthState value, $Res Function(_$_AuthState) then) =
      __$$_AuthStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isAuthenticated,
      bool staySignedIn,
      Status authStatus,
      UserCredential? userCredential});
}

/// @nodoc
class __$$_AuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthState>
    implements _$$_AuthStateCopyWith<$Res> {
  __$$_AuthStateCopyWithImpl(
      _$_AuthState _value, $Res Function(_$_AuthState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuthenticated = null,
    Object? staySignedIn = null,
    Object? authStatus = null,
    Object? userCredential = freezed,
  }) {
    return _then(_$_AuthState(
      isAuthenticated: null == isAuthenticated
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      staySignedIn: null == staySignedIn
          ? _value.staySignedIn
          : staySignedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      authStatus: null == authStatus
          ? _value.authStatus
          : authStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      userCredential: freezed == userCredential
          ? _value.userCredential
          : userCredential // ignore: cast_nullable_to_non_nullable
              as UserCredential?,
    ));
  }
}

/// @nodoc

class _$_AuthState implements _AuthState {
  const _$_AuthState(
      {required this.isAuthenticated,
      required this.staySignedIn,
      required this.authStatus,
      this.userCredential});

  @override
  final bool isAuthenticated;
  @override
  final bool staySignedIn;
  @override
  final Status authStatus;
  @override
  final UserCredential? userCredential;

  @override
  String toString() {
    return 'AuthState(isAuthenticated: $isAuthenticated, staySignedIn: $staySignedIn, authStatus: $authStatus, userCredential: $userCredential)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthState &&
            (identical(other.isAuthenticated, isAuthenticated) ||
                other.isAuthenticated == isAuthenticated) &&
            (identical(other.staySignedIn, staySignedIn) ||
                other.staySignedIn == staySignedIn) &&
            (identical(other.authStatus, authStatus) ||
                other.authStatus == authStatus) &&
            (identical(other.userCredential, userCredential) ||
                other.userCredential == userCredential));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isAuthenticated, staySignedIn, authStatus, userCredential);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthStateCopyWith<_$_AuthState> get copyWith =>
      __$$_AuthStateCopyWithImpl<_$_AuthState>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {required final bool isAuthenticated,
      required final bool staySignedIn,
      required final Status authStatus,
      final UserCredential? userCredential}) = _$_AuthState;

  @override
  bool get isAuthenticated;
  @override
  bool get staySignedIn;
  @override
  Status get authStatus;
  @override
  UserCredential? get userCredential;
  @override
  @JsonKey(ignore: true)
  _$$_AuthStateCopyWith<_$_AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
