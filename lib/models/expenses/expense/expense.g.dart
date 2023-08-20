// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Expense _$$_ExpenseFromJson(Map<String, dynamic> json) => _$_Expense(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      lenderId: json['lenderId'] as String,
      borrowerId: json['borrowerId'] as String,
      expenseGroupId: json['expenseGroupId'] as String,
    );

Map<String, dynamic> _$$_ExpenseToJson(_$_Expense instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'lenderId': instance.lenderId,
      'borrowerId': instance.borrowerId,
      'expenseGroupId': instance.expenseGroupId,
    };
