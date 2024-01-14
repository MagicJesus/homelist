// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'expense_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExpenseGroup _$$_ExpenseGroupFromJson(Map<String, dynamic> json) =>
    _$_ExpenseGroup(
      id: json['id'] as String,
      groupName: json['groupName'] as String,
      members: (json['members'] as List<dynamic>)
          .map((e) => UserData.fromJson(e as Map<String, dynamic>))
          .toList(),
      expenses: (json['expenses'] as List<dynamic>)
          .map((e) => Expense.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ExpenseGroupToJson(_$_ExpenseGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'groupName': instance.groupName,
      'members': instance.members,
      'expenses': instance.expenses,
    };
