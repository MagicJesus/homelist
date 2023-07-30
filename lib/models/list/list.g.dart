// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SharedList _$$_SharedListFromJson(Map<String, dynamic> json) =>
    _$_SharedList(
      id: json['id'] as String?,
      ownerId: json['ownerId'] as String,
      title: json['title'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) =>
              e == null ? null : ListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: $enumDecode(_$ListTypeEnumMap, json['type']),
      allowedUsersIds: (json['allowedUsersIds'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$$_SharedListToJson(_$_SharedList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'title': instance.title,
      'items': instance.items,
      'type': _$ListTypeEnumMap[instance.type]!,
      'allowedUsersIds': instance.allowedUsersIds,
    };

const _$ListTypeEnumMap = {
  ListType.todo: 0,
  ListType.shopping: 1,
};
