// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_cubit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BudgetCubitState {
  List<ExpenseGroup> get allExpenseGroups => throw _privateConstructorUsedError;
  List<Expense> get allCurrentUserExpenses =>
      throw _privateConstructorUsedError;
  Status get allExpenseGroupsStatus => throw _privateConstructorUsedError;
  ExpenseGroup? get currentExpenseGroup => throw _privateConstructorUsedError;
  Expense? get currentExpense => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BudgetCubitStateCopyWith<BudgetCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetCubitStateCopyWith<$Res> {
  factory $BudgetCubitStateCopyWith(
          BudgetCubitState value, $Res Function(BudgetCubitState) then) =
      _$BudgetCubitStateCopyWithImpl<$Res, BudgetCubitState>;
  @useResult
  $Res call(
      {List<ExpenseGroup> allExpenseGroups,
      List<Expense> allCurrentUserExpenses,
      Status allExpenseGroupsStatus,
      ExpenseGroup? currentExpenseGroup,
      Expense? currentExpense});

  $ExpenseGroupCopyWith<$Res>? get currentExpenseGroup;
  $ExpenseCopyWith<$Res>? get currentExpense;
}

/// @nodoc
class _$BudgetCubitStateCopyWithImpl<$Res, $Val extends BudgetCubitState>
    implements $BudgetCubitStateCopyWith<$Res> {
  _$BudgetCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allExpenseGroups = null,
    Object? allCurrentUserExpenses = null,
    Object? allExpenseGroupsStatus = null,
    Object? currentExpenseGroup = freezed,
    Object? currentExpense = freezed,
  }) {
    return _then(_value.copyWith(
      allExpenseGroups: null == allExpenseGroups
          ? _value.allExpenseGroups
          : allExpenseGroups // ignore: cast_nullable_to_non_nullable
              as List<ExpenseGroup>,
      allCurrentUserExpenses: null == allCurrentUserExpenses
          ? _value.allCurrentUserExpenses
          : allCurrentUserExpenses // ignore: cast_nullable_to_non_nullable
              as List<Expense>,
      allExpenseGroupsStatus: null == allExpenseGroupsStatus
          ? _value.allExpenseGroupsStatus
          : allExpenseGroupsStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      currentExpenseGroup: freezed == currentExpenseGroup
          ? _value.currentExpenseGroup
          : currentExpenseGroup // ignore: cast_nullable_to_non_nullable
              as ExpenseGroup?,
      currentExpense: freezed == currentExpense
          ? _value.currentExpense
          : currentExpense // ignore: cast_nullable_to_non_nullable
              as Expense?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExpenseGroupCopyWith<$Res>? get currentExpenseGroup {
    if (_value.currentExpenseGroup == null) {
      return null;
    }

    return $ExpenseGroupCopyWith<$Res>(_value.currentExpenseGroup!, (value) {
      return _then(_value.copyWith(currentExpenseGroup: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ExpenseCopyWith<$Res>? get currentExpense {
    if (_value.currentExpense == null) {
      return null;
    }

    return $ExpenseCopyWith<$Res>(_value.currentExpense!, (value) {
      return _then(_value.copyWith(currentExpense: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BudgetCubitStateCopyWith<$Res>
    implements $BudgetCubitStateCopyWith<$Res> {
  factory _$$_BudgetCubitStateCopyWith(
          _$_BudgetCubitState value, $Res Function(_$_BudgetCubitState) then) =
      __$$_BudgetCubitStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ExpenseGroup> allExpenseGroups,
      List<Expense> allCurrentUserExpenses,
      Status allExpenseGroupsStatus,
      ExpenseGroup? currentExpenseGroup,
      Expense? currentExpense});

  @override
  $ExpenseGroupCopyWith<$Res>? get currentExpenseGroup;
  @override
  $ExpenseCopyWith<$Res>? get currentExpense;
}

/// @nodoc
class __$$_BudgetCubitStateCopyWithImpl<$Res>
    extends _$BudgetCubitStateCopyWithImpl<$Res, _$_BudgetCubitState>
    implements _$$_BudgetCubitStateCopyWith<$Res> {
  __$$_BudgetCubitStateCopyWithImpl(
      _$_BudgetCubitState _value, $Res Function(_$_BudgetCubitState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allExpenseGroups = null,
    Object? allCurrentUserExpenses = null,
    Object? allExpenseGroupsStatus = null,
    Object? currentExpenseGroup = freezed,
    Object? currentExpense = freezed,
  }) {
    return _then(_$_BudgetCubitState(
      allExpenseGroups: null == allExpenseGroups
          ? _value._allExpenseGroups
          : allExpenseGroups // ignore: cast_nullable_to_non_nullable
              as List<ExpenseGroup>,
      allCurrentUserExpenses: null == allCurrentUserExpenses
          ? _value._allCurrentUserExpenses
          : allCurrentUserExpenses // ignore: cast_nullable_to_non_nullable
              as List<Expense>,
      allExpenseGroupsStatus: null == allExpenseGroupsStatus
          ? _value.allExpenseGroupsStatus
          : allExpenseGroupsStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      currentExpenseGroup: freezed == currentExpenseGroup
          ? _value.currentExpenseGroup
          : currentExpenseGroup // ignore: cast_nullable_to_non_nullable
              as ExpenseGroup?,
      currentExpense: freezed == currentExpense
          ? _value.currentExpense
          : currentExpense // ignore: cast_nullable_to_non_nullable
              as Expense?,
    ));
  }
}

/// @nodoc

class _$_BudgetCubitState implements _BudgetCubitState {
  _$_BudgetCubitState(
      {required final List<ExpenseGroup> allExpenseGroups,
      required final List<Expense> allCurrentUserExpenses,
      required this.allExpenseGroupsStatus,
      this.currentExpenseGroup,
      this.currentExpense})
      : _allExpenseGroups = allExpenseGroups,
        _allCurrentUserExpenses = allCurrentUserExpenses;

  final List<ExpenseGroup> _allExpenseGroups;
  @override
  List<ExpenseGroup> get allExpenseGroups {
    if (_allExpenseGroups is EqualUnmodifiableListView)
      return _allExpenseGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allExpenseGroups);
  }

  final List<Expense> _allCurrentUserExpenses;
  @override
  List<Expense> get allCurrentUserExpenses {
    if (_allCurrentUserExpenses is EqualUnmodifiableListView)
      return _allCurrentUserExpenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allCurrentUserExpenses);
  }

  @override
  final Status allExpenseGroupsStatus;
  @override
  final ExpenseGroup? currentExpenseGroup;
  @override
  final Expense? currentExpense;

  @override
  String toString() {
    return 'BudgetCubitState(allExpenseGroups: $allExpenseGroups, allCurrentUserExpenses: $allCurrentUserExpenses, allExpenseGroupsStatus: $allExpenseGroupsStatus, currentExpenseGroup: $currentExpenseGroup, currentExpense: $currentExpense)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BudgetCubitState &&
            const DeepCollectionEquality()
                .equals(other._allExpenseGroups, _allExpenseGroups) &&
            const DeepCollectionEquality().equals(
                other._allCurrentUserExpenses, _allCurrentUserExpenses) &&
            (identical(other.allExpenseGroupsStatus, allExpenseGroupsStatus) ||
                other.allExpenseGroupsStatus == allExpenseGroupsStatus) &&
            (identical(other.currentExpenseGroup, currentExpenseGroup) ||
                other.currentExpenseGroup == currentExpenseGroup) &&
            (identical(other.currentExpense, currentExpense) ||
                other.currentExpense == currentExpense));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allExpenseGroups),
      const DeepCollectionEquality().hash(_allCurrentUserExpenses),
      allExpenseGroupsStatus,
      currentExpenseGroup,
      currentExpense);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BudgetCubitStateCopyWith<_$_BudgetCubitState> get copyWith =>
      __$$_BudgetCubitStateCopyWithImpl<_$_BudgetCubitState>(this, _$identity);
}

abstract class _BudgetCubitState implements BudgetCubitState {
  factory _BudgetCubitState(
      {required final List<ExpenseGroup> allExpenseGroups,
      required final List<Expense> allCurrentUserExpenses,
      required final Status allExpenseGroupsStatus,
      final ExpenseGroup? currentExpenseGroup,
      final Expense? currentExpense}) = _$_BudgetCubitState;

  @override
  List<ExpenseGroup> get allExpenseGroups;
  @override
  List<Expense> get allCurrentUserExpenses;
  @override
  Status get allExpenseGroupsStatus;
  @override
  ExpenseGroup? get currentExpenseGroup;
  @override
  Expense? get currentExpense;
  @override
  @JsonKey(ignore: true)
  _$$_BudgetCubitStateCopyWith<_$_BudgetCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}
