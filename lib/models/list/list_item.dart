import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_item.freezed.dart';
part 'list_item.g.dart';

@freezed
class ListItem with _$ListItem {
  factory ListItem({
    required String title,
    required bool completed,
    IconNames? iconName,
  }) = _ListItem;

  factory ListItem.fromJson(Map<String, Object?> json) =>
      _$ListItemFromJson(json);
}

enum IconNames {
  vegetables,
  fruits,
  dairy,
  todo,
}
