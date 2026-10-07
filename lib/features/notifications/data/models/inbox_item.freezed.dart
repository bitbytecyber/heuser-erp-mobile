// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inbox_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InboxItem {

 int get id;@JsonKey(name: 'category_key') String get categoryKey;@JsonKey(name: 'category_label') String get categoryLabel; String get title; String get body; Map<String, dynamic> get payload; String get priority;@JsonKey(name: 'is_read') bool get isRead;@JsonKey(name: 'is_dismissed') bool get isDismissed;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of InboxItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxItemCopyWith<InboxItem> get copyWith => _$InboxItemCopyWithImpl<InboxItem>(this as InboxItem, _$identity);

  /// Serializes this InboxItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as InboxItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxItem&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.categoryKey, _this.categoryKey) || other.categoryKey == _this.categoryKey)&&(identical(other.categoryLabel, _this.categoryLabel) || other.categoryLabel == _this.categoryLabel)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.body, _this.body) || other.body == _this.body)&&const DeepCollectionEquality().equals(other.payload, _this.payload)&&(identical(other.priority, _this.priority) || other.priority == _this.priority)&&(identical(other.isRead, _this.isRead) || other.isRead == _this.isRead)&&(identical(other.isDismissed, _this.isDismissed) || other.isDismissed == _this.isDismissed)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as InboxItem;
  return Object.hash(runtimeType,_this.id,_this.categoryKey,_this.categoryLabel,_this.title,_this.body,const DeepCollectionEquality().hash(_this.payload),_this.priority,_this.isRead,_this.isDismissed,_this.createdAt);
}

@override
String toString() {
  final _this = this as InboxItem;
  return 'InboxItem(id: ${_this.id}, categoryKey: ${_this.categoryKey}, categoryLabel: ${_this.categoryLabel}, title: ${_this.title}, body: ${_this.body}, payload: ${_this.payload}, priority: ${_this.priority}, isRead: ${_this.isRead}, isDismissed: ${_this.isDismissed}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $InboxItemCopyWith<$Res>  {
  factory $InboxItemCopyWith(InboxItem value, $Res Function(InboxItem) _then) = _$InboxItemCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'category_key') String categoryKey,@JsonKey(name: 'category_label') String categoryLabel, String title, String body, Map<String, dynamic> payload, String priority,@JsonKey(name: 'is_read') bool isRead,@JsonKey(name: 'is_dismissed') bool isDismissed,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$InboxItemCopyWithImpl<$Res>
    implements $InboxItemCopyWith<$Res> {
  _$InboxItemCopyWithImpl(this._self, this._then);

  final InboxItem _self;
  final $Res Function(InboxItem) _then;

/// Create a copy of InboxItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? categoryKey = null,Object? categoryLabel = null,Object? title = null,Object? body = null,Object? payload = null,Object? priority = null,Object? isRead = null,Object? isDismissed = null,Object? createdAt = null,}) {
  return _then(InboxItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,categoryKey: null == categoryKey ? _self.categoryKey : categoryKey // ignore: cast_nullable_to_non_nullable
as String,categoryLabel: null == categoryLabel ? _self.categoryLabel : categoryLabel // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,isDismissed: null == isDismissed ? _self.isDismissed : isDismissed // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [InboxItem].
extension InboxItemPatterns on InboxItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InboxItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InboxItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InboxItem value)  $default,){
final _that = this;
switch (_that) {
case _InboxItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InboxItem value)?  $default,){
final _that = this;
switch (_that) {
case _InboxItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'category_key')  String categoryKey, @JsonKey(name: 'category_label')  String categoryLabel,  String title,  String body,  Map<String, dynamic> payload,  String priority, @JsonKey(name: 'is_read')  bool isRead, @JsonKey(name: 'is_dismissed')  bool isDismissed, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InboxItem() when $default != null:
return $default(_that.id,_that.categoryKey,_that.categoryLabel,_that.title,_that.body,_that.payload,_that.priority,_that.isRead,_that.isDismissed,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'category_key')  String categoryKey, @JsonKey(name: 'category_label')  String categoryLabel,  String title,  String body,  Map<String, dynamic> payload,  String priority, @JsonKey(name: 'is_read')  bool isRead, @JsonKey(name: 'is_dismissed')  bool isDismissed, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _InboxItem():
return $default(_that.id,_that.categoryKey,_that.categoryLabel,_that.title,_that.body,_that.payload,_that.priority,_that.isRead,_that.isDismissed,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'category_key')  String categoryKey, @JsonKey(name: 'category_label')  String categoryLabel,  String title,  String body,  Map<String, dynamic> payload,  String priority, @JsonKey(name: 'is_read')  bool isRead, @JsonKey(name: 'is_dismissed')  bool isDismissed, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _InboxItem() when $default != null:
return $default(_that.id,_that.categoryKey,_that.categoryLabel,_that.title,_that.body,_that.payload,_that.priority,_that.isRead,_that.isDismissed,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InboxItem extends InboxItem {
  const _InboxItem({required this.id, @JsonKey(name: 'category_key') this.categoryKey = '', @JsonKey(name: 'category_label') this.categoryLabel = '', this.title = '', this.body = '',  Map<String, dynamic> payload = const <String, dynamic>{}, this.priority = 'normal', @JsonKey(name: 'is_read') this.isRead = false, @JsonKey(name: 'is_dismissed') this.isDismissed = false, @JsonKey(name: 'created_at') this.createdAt = ''}): _payload = payload,super._();
  factory _InboxItem.fromJson(Map<String, dynamic> json) => _$InboxItemFromJson(json);

@override final  int id;
@override@JsonKey(name: 'category_key') final  String categoryKey;
@override@JsonKey(name: 'category_label') final  String categoryLabel;
@override@JsonKey() final  String title;
@override@JsonKey() final  String body;
 final  Map<String, dynamic> _payload;
@override@JsonKey() Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}

@override@JsonKey() final  String priority;
@override@JsonKey(name: 'is_read') final  bool isRead;
@override@JsonKey(name: 'is_dismissed') final  bool isDismissed;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of InboxItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InboxItemCopyWith<_InboxItem> get copyWith => __$InboxItemCopyWithImpl<_InboxItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InboxItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _InboxItem&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryKey, categoryKey) || other.categoryKey == categoryKey)&&(identical(other.categoryLabel, categoryLabel) || other.categoryLabel == categoryLabel)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&const DeepCollectionEquality().equals(other.payload, _payload)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isDismissed, isDismissed) || other.isDismissed == isDismissed)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,categoryKey,categoryLabel,title,body,const DeepCollectionEquality().hash(_payload),priority,isRead,isDismissed,createdAt);
}

@override
String toString() {
    return 'InboxItem(id: $id, categoryKey: $categoryKey, categoryLabel: $categoryLabel, title: $title, body: $body, payload: $payload, priority: $priority, isRead: $isRead, isDismissed: $isDismissed, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$InboxItemCopyWith<$Res> implements $InboxItemCopyWith<$Res> {
  factory _$InboxItemCopyWith(_InboxItem value, $Res Function(_InboxItem) _then) = __$InboxItemCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'category_key') String categoryKey,@JsonKey(name: 'category_label') String categoryLabel, String title, String body, Map<String, dynamic> payload, String priority,@JsonKey(name: 'is_read') bool isRead,@JsonKey(name: 'is_dismissed') bool isDismissed,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$InboxItemCopyWithImpl<$Res>
    implements _$InboxItemCopyWith<$Res> {
  __$InboxItemCopyWithImpl(this._self, this._then);

  final _InboxItem _self;
  final $Res Function(_InboxItem) _then;

/// Create a copy of InboxItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryKey = null,Object? categoryLabel = null,Object? title = null,Object? body = null,Object? payload = null,Object? priority = null,Object? isRead = null,Object? isDismissed = null,Object? createdAt = null,}) {
  return _then(_InboxItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,categoryKey: null == categoryKey ? _self.categoryKey : categoryKey // ignore: cast_nullable_to_non_nullable
as String,categoryLabel: null == categoryLabel ? _self.categoryLabel : categoryLabel // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,isDismissed: null == isDismissed ? _self.isDismissed : isDismissed // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
