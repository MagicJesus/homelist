// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListItem _$$_ListItemFromJson(Map<String, dynamic> json) => _$_ListItem(
      id: json['id'] as String,
      title: json['title'] as String,
      completed: json['completed'] as bool,
      iconName: $enumDecodeNullable(_$IconNamesEnumMap, json['iconName']),
    );

Map<String, dynamic> _$$_ListItemToJson(_$_ListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
      'iconName': _$IconNamesEnumMap[instance.iconName],
    };

const _$IconNamesEnumMap = {
  IconNames.vegetables: 0,
  IconNames.fruits: 1,
  IconNames.dairy: 2,
  IconNames.todo: 3,
};
