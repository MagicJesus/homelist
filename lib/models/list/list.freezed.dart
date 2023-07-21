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
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<ListItem?> get items => throw _privateConstructorUsedError;
  ListType get type => throw _privateConstructorUsedError;

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
  $Res call({String id, String title, List<ListItem?> items, ListType type});
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
    Object? id = null,
    Object? title = null,
    Object? items = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
  $Res call({String id, String title, List<ListItem?> items, ListType type});
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
    Object? id = null,
    Object? title = null,
    Object? items = null,
    Object? type = null,
  }) {
    return _then(_$_SharedList(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SharedList implements _SharedList {
  _$_SharedList(
      {required this.id,
      required this.title,
      required final List<ListItem?> items,
      required this.type})
      : _items = items;

  factory _$_SharedList.fromJson(Map<String, dynamic> json) =>
      _$$_SharedListFromJson(json);

  @override
  final String id;
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

  @override
  String toString() {
    return 'SharedList(id: $id, title: $title, items: $items, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SharedList &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title,
      const DeepCollectionEquality().hash(_items), type);

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
      {required final String id,
      required final String title,
      required final List<ListItem?> items,
      required final ListType type}) = _$_SharedList;

  factory _SharedList.fromJson(Map<String, dynamic> json) =
      _$_SharedList.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  List<ListItem?> get items;
  @override
  ListType get type;
  @override
  @JsonKey(ignore: true)
  _$$_SharedListCopyWith<_$_SharedList> get copyWith =>
      throw _privateConstructorUsedError;
}
