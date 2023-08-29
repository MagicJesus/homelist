// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Expense _$ExpenseFromJson(Map<String, dynamic> json) {
  return _Expense.fromJson(json);
}

/// @nodoc
mixin _$Expense {
  String get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get lenderId => throw _privateConstructorUsedError;
  List<String> get borrowerIds => throw _privateConstructorUsedError;
  String get expenseGroupId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpenseCopyWith<Expense> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseCopyWith<$Res> {
  factory $ExpenseCopyWith(Expense value, $Res Function(Expense) then) =
      _$ExpenseCopyWithImpl<$Res, Expense>;
  @useResult
  $Res call(
      {String id,
      double amount,
      String lenderId,
      List<String> borrowerIds,
      String expenseGroupId});
}

/// @nodoc
class _$ExpenseCopyWithImpl<$Res, $Val extends Expense>
    implements $ExpenseCopyWith<$Res> {
  _$ExpenseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? lenderId = null,
    Object? borrowerIds = null,
    Object? expenseGroupId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      lenderId: null == lenderId
          ? _value.lenderId
          : lenderId // ignore: cast_nullable_to_non_nullable
              as String,
      borrowerIds: null == borrowerIds
          ? _value.borrowerIds
          : borrowerIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      expenseGroupId: null == expenseGroupId
          ? _value.expenseGroupId
          : expenseGroupId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExpenseCopyWith<$Res> implements $ExpenseCopyWith<$Res> {
  factory _$$_ExpenseCopyWith(
          _$_Expense value, $Res Function(_$_Expense) then) =
      __$$_ExpenseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double amount,
      String lenderId,
      List<String> borrowerIds,
      String expenseGroupId});
}

/// @nodoc
class __$$_ExpenseCopyWithImpl<$Res>
    extends _$ExpenseCopyWithImpl<$Res, _$_Expense>
    implements _$$_ExpenseCopyWith<$Res> {
  __$$_ExpenseCopyWithImpl(_$_Expense _value, $Res Function(_$_Expense) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? lenderId = null,
    Object? borrowerIds = null,
    Object? expenseGroupId = null,
  }) {
    return _then(_$_Expense(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      lenderId: null == lenderId
          ? _value.lenderId
          : lenderId // ignore: cast_nullable_to_non_nullable
              as String,
      borrowerIds: null == borrowerIds
          ? _value._borrowerIds
          : borrowerIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      expenseGroupId: null == expenseGroupId
          ? _value.expenseGroupId
          : expenseGroupId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Expense implements _Expense {
  _$_Expense(
      {required this.id,
      required this.amount,
      required this.lenderId,
      required final List<String> borrowerIds,
      required this.expenseGroupId})
      : _borrowerIds = borrowerIds;

  factory _$_Expense.fromJson(Map<String, dynamic> json) =>
      _$$_ExpenseFromJson(json);

  @override
  final String id;
  @override
  final double amount;
  @override
  final String lenderId;
  final List<String> _borrowerIds;
  @override
  List<String> get borrowerIds {
    if (_borrowerIds is EqualUnmodifiableListView) return _borrowerIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_borrowerIds);
  }

  @override
  final String expenseGroupId;

  @override
  String toString() {
    return 'Expense(id: $id, amount: $amount, lenderId: $lenderId, borrowerIds: $borrowerIds, expenseGroupId: $expenseGroupId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Expense &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.lenderId, lenderId) ||
                other.lenderId == lenderId) &&
            const DeepCollectionEquality()
                .equals(other._borrowerIds, _borrowerIds) &&
            (identical(other.expenseGroupId, expenseGroupId) ||
                other.expenseGroupId == expenseGroupId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, amount, lenderId,
      const DeepCollectionEquality().hash(_borrowerIds), expenseGroupId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExpenseCopyWith<_$_Expense> get copyWith =>
      __$$_ExpenseCopyWithImpl<_$_Expense>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExpenseToJson(
      this,
    );
  }
}

abstract class _Expense implements Expense {
  factory _Expense(
      {required final String id,
      required final double amount,
      required final String lenderId,
      required final List<String> borrowerIds,
      required final String expenseGroupId}) = _$_Expense;

  factory _Expense.fromJson(Map<String, dynamic> json) = _$_Expense.fromJson;

  @override
  String get id;
  @override
  double get amount;
  @override
  String get lenderId;
  @override
  List<String> get borrowerIds;
  @override
  String get expenseGroupId;
  @override
  @JsonKey(ignore: true)
  _$$_ExpenseCopyWith<_$_Expense> get copyWith =>
      throw _privateConstructorUsedError;
}
