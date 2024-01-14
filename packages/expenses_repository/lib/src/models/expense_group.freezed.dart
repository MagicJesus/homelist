// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExpenseGroup _$ExpenseGroupFromJson(Map<String, dynamic> json) {
  return _ExpenseGroup.fromJson(json);
}

/// @nodoc
mixin _$ExpenseGroup {
  String get id => throw _privateConstructorUsedError;
  String get groupName => throw _privateConstructorUsedError;
  List<UserData> get members => throw _privateConstructorUsedError;
  List<Expense> get expenses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpenseGroupCopyWith<ExpenseGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseGroupCopyWith<$Res> {
  factory $ExpenseGroupCopyWith(
          ExpenseGroup value, $Res Function(ExpenseGroup) then) =
      _$ExpenseGroupCopyWithImpl<$Res, ExpenseGroup>;
  @useResult
  $Res call(
      {String id,
      String groupName,
      List<UserData> members,
      List<Expense> expenses});
}

/// @nodoc
class _$ExpenseGroupCopyWithImpl<$Res, $Val extends ExpenseGroup>
    implements $ExpenseGroupCopyWith<$Res> {
  _$ExpenseGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupName = null,
    Object? members = null,
    Object? expenses = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
      expenses: null == expenses
          ? _value.expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<Expense>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpenseGroupImplCopyWith<$Res>
    implements $ExpenseGroupCopyWith<$Res> {
  factory _$$ExpenseGroupImplCopyWith(
          _$ExpenseGroupImpl value, $Res Function(_$ExpenseGroupImpl) then) =
      __$$ExpenseGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String groupName,
      List<UserData> members,
      List<Expense> expenses});
}

/// @nodoc
class __$$ExpenseGroupImplCopyWithImpl<$Res>
    extends _$ExpenseGroupCopyWithImpl<$Res, _$ExpenseGroupImpl>
    implements _$$ExpenseGroupImplCopyWith<$Res> {
  __$$ExpenseGroupImplCopyWithImpl(
      _$ExpenseGroupImpl _value, $Res Function(_$ExpenseGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupName = null,
    Object? members = null,
    Object? expenses = null,
  }) {
    return _then(_$ExpenseGroupImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
      expenses: null == expenses
          ? _value._expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<Expense>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseGroupImpl implements _ExpenseGroup {
  _$ExpenseGroupImpl(
      {required this.id,
      required this.groupName,
      required final List<UserData> members,
      required final List<Expense> expenses})
      : _members = members,
        _expenses = expenses;

  factory _$ExpenseGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseGroupImplFromJson(json);

  @override
  final String id;
  @override
  final String groupName;
  final List<UserData> _members;
  @override
  List<UserData> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  final List<Expense> _expenses;
  @override
  List<Expense> get expenses {
    if (_expenses is EqualUnmodifiableListView) return _expenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenses);
  }

  @override
  String toString() {
    return 'ExpenseGroup(id: $id, groupName: $groupName, members: $members, expenses: $expenses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality().equals(other._expenses, _expenses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      groupName,
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(_expenses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseGroupImplCopyWith<_$ExpenseGroupImpl> get copyWith =>
      __$$ExpenseGroupImplCopyWithImpl<_$ExpenseGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseGroupImplToJson(
      this,
    );
  }
}

abstract class _ExpenseGroup implements ExpenseGroup {
  factory _ExpenseGroup(
      {required final String id,
      required final String groupName,
      required final List<UserData> members,
      required final List<Expense> expenses}) = _$ExpenseGroupImpl;

  factory _ExpenseGroup.fromJson(Map<String, dynamic> json) =
      _$ExpenseGroupImpl.fromJson;

  @override
  String get id;
  @override
  String get groupName;
  @override
  List<UserData> get members;
  @override
  List<Expense> get expenses;
  @override
  @JsonKey(ignore: true)
  _$$ExpenseGroupImplCopyWith<_$ExpenseGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
