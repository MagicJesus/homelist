// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListItem _$$_ListItemFromJson(Map<String, dynamic> json) => _$_ListItem(
      title: json['title'] as String,
      completed: json['completed'] as bool,
      iconName: $enumDecodeNullable(_$IconNamesEnumMap, json['iconName']),
    );

Map<String, dynamic> _$$_ListItemToJson(_$_ListItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'completed': instance.completed,
      'iconName': _$IconNamesEnumMap[instance.iconName],
    };

const _$IconNamesEnumMap = {
  IconNames.vegetables: 'vegetables',
  IconNames.fruits: 'fruits',
  IconNames.dairy: 'dairy',
  IconNames.todo: 'todo',
};
