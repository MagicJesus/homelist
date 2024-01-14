// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseGroupImpl _$$ExpenseGroupImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseGroupImpl(
      id: json['id'] as String,
      groupName: json['groupName'] as String,
      members: (json['members'] as List<dynamic>)
          .map((e) => UserData.fromJson(e as Map<String, dynamic>))
          .toList(),
      expenses: (json['expenses'] as List<dynamic>)
          .map((e) => Expense.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ExpenseGroupImplToJson(_$ExpenseGroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'groupName': instance.groupName,
      'members': instance.members,
      'expenses': instance.expenses,
    };
