// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseImpl _$$ExpenseImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      lenderId: json['lenderId'] as String,
      borrowerIds: (json['borrowerIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      expenseGroupId: json['expenseGroupId'] as String,
    );

Map<String, dynamic> _$$ExpenseImplToJson(_$ExpenseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'amount': instance.amount,
      'lenderId': instance.lenderId,
      'borrowerIds': instance.borrowerIds,
      'expenseGroupId': instance.expenseGroupId,
    };
