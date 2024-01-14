import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:homelist/models/expenses/expense/expense.dart';
import 'package:user_repository/user_repository.dart';

part 'expense_group.freezed.dart';
part 'expense_group.g.dart';

@freezed
class ExpenseGroup with _$ExpenseGroup {
  factory ExpenseGroup({
    required String id,
    required String groupName,
    required List<UserData> members,
    required List<Expense> expenses,
  }) = _ExpenseGroup;

  factory ExpenseGroup.fromJson(Map<String, Object?> json) =>
      _$ExpenseGroupFromJson(json);
}
