import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:homelist/models/list/list_item.dart';

part 'list.freezed.dart';
part 'list.g.dart';

@freezed
class SharedList with _$SharedList {
  factory SharedList({
    String? id,
    required String userId,
    required String title,
    required List<ListItem?> items,
    required ListType type,
  }) = _SharedList;

  factory SharedList.fromJson(Map<String, Object?> json) =>
      _$SharedListFromJson(json);
}

@JsonEnum()
enum ListType {
  @JsonValue(0)
  todo,
  @JsonValue(1)
  shopping,
}
