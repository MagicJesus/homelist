// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SharedList _$SharedListFromJson(Map<String, dynamic> json) {
  return _SharedList.fromJson(json);
}

/// @nodoc
mixin _$SharedList {
  String? get id => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<ListItem?> get items => throw _privateConstructorUsedError;
  ListType get type => throw _privateConstructorUsedError;
  List<String> get allowedUsersIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SharedListCopyWith<SharedList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SharedListCopyWith<$Res> {
  factory $SharedListCopyWith(
          SharedList value, $Res Function(SharedList) then) =
      _$SharedListCopyWithImpl<$Res, SharedList>;
  @useResult
  $Res call(
      {String? id,
      String ownerId,
      String title,
      List<ListItem?> items,
      ListType type,
      List<String> allowedUsersIds});
}

/// @nodoc
class _$SharedListCopyWithImpl<$Res, $Val extends SharedList>
    implements $SharedListCopyWith<$Res> {
  _$SharedListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? ownerId = null,
    Object? title = null,
    Object? items = null,
    Object? type = null,
    Object? allowedUsersIds = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ListItem?>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ListType,
      allowedUsersIds: null == allowedUsersIds
          ? _value.allowedUsersIds
          : allowedUsersIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SharedListCopyWith<$Res>
    implements $SharedListCopyWith<$Res> {
  factory _$$_SharedListCopyWith(
          _$_SharedList value, $Res Function(_$_SharedList) then) =
      __$$_SharedListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String ownerId,
      String title,
      List<ListItem?> items,
      ListType type,
      List<String> allowedUsersIds});
}

/// @nodoc
class __$$_SharedListCopyWithImpl<$Res>
    extends _$SharedListCopyWithImpl<$Res, _$_SharedList>
    implements _$$_SharedListCopyWith<$Res> {
  __$$_SharedListCopyWithImpl(
      _$_SharedList _value, $Res Function(_$_SharedList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? ownerId = null,
    Object? title = null,
    Object? items = null,
    Object? type = null,
    Object? allowedUsersIds = null,
  }) {
    return _then(_$_SharedList(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ListItem?>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ListType,
      allowedUsersIds: null == allowedUsersIds
          ? _value._allowedUsersIds
          : allowedUsersIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SharedList implements _SharedList {
  _$_SharedList(
      {this.id,
      required this.ownerId,
      required this.title,
      required final List<ListItem?> items,
      required this.type,
      required final List<String> allowedUsersIds})
      : _items = items,
        _allowedUsersIds = allowedUsersIds;

  factory _$_SharedList.fromJson(Map<String, dynamic> json) =>
      _$$_SharedListFromJson(json);

  @override
  final String? id;
  @override
  final String ownerId;
  @override
  final String title;
  final List<ListItem?> _items;
  @override
  List<ListItem?> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final ListType type;
  final List<String> _allowedUsersIds;
  @override
  List<String> get allowedUsersIds {
    if (_allowedUsersIds is EqualUnmodifiableListView) return _allowedUsersIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allowedUsersIds);
  }

  @override
  String toString() {
    return 'SharedList(id: $id, ownerId: $ownerId, title: $title, items: $items, type: $type, allowedUsersIds: $allowedUsersIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SharedList &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._allowedUsersIds, _allowedUsersIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ownerId,
      title,
      const DeepCollectionEquality().hash(_items),
      type,
      const DeepCollectionEquality().hash(_allowedUsersIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SharedListCopyWith<_$_SharedList> get copyWith =>
      __$$_SharedListCopyWithImpl<_$_SharedList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SharedListToJson(
      this,
    );
  }
}

abstract class _SharedList implements SharedList {
  factory _SharedList(
      {final String? id,
      required final String ownerId,
      required final String title,
      required final List<ListItem?> items,
      required final ListType type,
      required final List<String> allowedUsersIds}) = _$_SharedList;

  factory _SharedList.fromJson(Map<String, dynamic> json) =
      _$_SharedList.fromJson;

  @override
  String? get id;
  @override
  String get ownerId;
  @override
  String get title;
  @override
  List<ListItem?> get items;
  @override
  ListType get type;
  @override
  List<String> get allowedUsersIds;
  @override
  @JsonKey(ignore: true)
  _$$_SharedListCopyWith<_$_SharedList> get copyWith =>
      throw _privateConstructorUsedError;
}
