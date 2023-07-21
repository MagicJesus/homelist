// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SharedList _$$_SharedListFromJson(Map<String, dynamic> json) =>
    _$_SharedList(
      id: json['id'] as String?,
      userId: json['userId'] as String,
      title: json['title'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) =>
              e == null ? null : ListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: $enumDecode(_$ListTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_SharedListToJson(_$_SharedList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'items': instance.items,
      'type': _$ListTypeEnumMap[instance.type]!,
    };

const _$ListTypeEnumMap = {
  ListType.todo: 0,
  ListType.shopping: 1,
};
