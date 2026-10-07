// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationsEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'NotificationsEvent()';
}


}

/// @nodoc
class $NotificationsEventCopyWith<$Res>  {
$NotificationsEventCopyWith(NotificationsEvent _, $Res Function(NotificationsEvent) __);
}


/// Adds pattern-matching-related methods to [NotificationsEvent].
extension NotificationsEventPatterns on NotificationsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NotificationsStarted value)?  started,TResult Function( NotificationsRefreshed value)?  refreshed,TResult Function( NotificationsMoreRequested value)?  moreRequested,TResult Function( NotificationsOpened value)?  opened,TResult Function( NotificationsDismissed value)?  dismissed,TResult Function( NotificationsAllRead value)?  allRead,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NotificationsStarted() when started != null:
return started(_that);case NotificationsRefreshed() when refreshed != null:
return refreshed(_that);case NotificationsMoreRequested() when moreRequested != null:
return moreRequested(_that);case NotificationsOpened() when opened != null:
return opened(_that);case NotificationsDismissed() when dismissed != null:
return dismissed(_that);case NotificationsAllRead() when allRead != null:
return allRead(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NotificationsStarted value)  started,required TResult Function( NotificationsRefreshed value)  refreshed,required TResult Function( NotificationsMoreRequested value)  moreRequested,required TResult Function( NotificationsOpened value)  opened,required TResult Function( NotificationsDismissed value)  dismissed,required TResult Function( NotificationsAllRead value)  allRead,}){
final _that = this;
switch (_that) {
case NotificationsStarted():
return started(_that);case NotificationsRefreshed():
return refreshed(_that);case NotificationsMoreRequested():
return moreRequested(_that);case NotificationsOpened():
return opened(_that);case NotificationsDismissed():
return dismissed(_that);case NotificationsAllRead():
return allRead(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NotificationsStarted value)?  started,TResult? Function( NotificationsRefreshed value)?  refreshed,TResult? Function( NotificationsMoreRequested value)?  moreRequested,TResult? Function( NotificationsOpened value)?  opened,TResult? Function( NotificationsDismissed value)?  dismissed,TResult? Function( NotificationsAllRead value)?  allRead,}){
final _that = this;
switch (_that) {
case NotificationsStarted() when started != null:
return started(_that);case NotificationsRefreshed() when refreshed != null:
return refreshed(_that);case NotificationsMoreRequested() when moreRequested != null:
return moreRequested(_that);case NotificationsOpened() when opened != null:
return opened(_that);case NotificationsDismissed() when dismissed != null:
return dismissed(_that);case NotificationsAllRead() when allRead != null:
return allRead(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  refreshed,TResult Function()?  moreRequested,TResult Function( InboxItem item)?  opened,TResult Function( int id)?  dismissed,TResult Function()?  allRead,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NotificationsStarted() when started != null:
return started();case NotificationsRefreshed() when refreshed != null:
return refreshed();case NotificationsMoreRequested() when moreRequested != null:
return moreRequested();case NotificationsOpened() when opened != null:
return opened(_that.item);case NotificationsDismissed() when dismissed != null:
return dismissed(_that.id);case NotificationsAllRead() when allRead != null:
return allRead();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  refreshed,required TResult Function()  moreRequested,required TResult Function( InboxItem item)  opened,required TResult Function( int id)  dismissed,required TResult Function()  allRead,}) {final _that = this;
switch (_that) {
case NotificationsStarted():
return started();case NotificationsRefreshed():
return refreshed();case NotificationsMoreRequested():
return moreRequested();case NotificationsOpened():
return opened(_that.item);case NotificationsDismissed():
return dismissed(_that.id);case NotificationsAllRead():
return allRead();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  refreshed,TResult? Function()?  moreRequested,TResult? Function( InboxItem item)?  opened,TResult? Function( int id)?  dismissed,TResult? Function()?  allRead,}) {final _that = this;
switch (_that) {
case NotificationsStarted() when started != null:
return started();case NotificationsRefreshed() when refreshed != null:
return refreshed();case NotificationsMoreRequested() when moreRequested != null:
return moreRequested();case NotificationsOpened() when opened != null:
return opened(_that.item);case NotificationsDismissed() when dismissed != null:
return dismissed(_that.id);case NotificationsAllRead() when allRead != null:
return allRead();case _:
  return null;

}
}

}

/// @nodoc


class NotificationsStarted implements NotificationsEvent {
  const NotificationsStarted();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'NotificationsEvent.started()';
}


}




/// @nodoc


class NotificationsRefreshed implements NotificationsEvent {
  const NotificationsRefreshed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'NotificationsEvent.refreshed()';
}


}




/// @nodoc


class NotificationsMoreRequested implements NotificationsEvent {
  const NotificationsMoreRequested();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsMoreRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'NotificationsEvent.moreRequested()';
}


}




/// @nodoc


class NotificationsOpened implements NotificationsEvent {
  const NotificationsOpened(this.item);
  

 final  InboxItem item;

/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsOpenedCopyWith<NotificationsOpened> get copyWith => _$NotificationsOpenedCopyWithImpl<NotificationsOpened>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsOpened&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode {
    return Object.hash(runtimeType,item);
}

@override
String toString() {
    return 'NotificationsEvent.opened(item: $item)';
}


}

/// @nodoc
abstract mixin class $NotificationsOpenedCopyWith<$Res> implements $NotificationsEventCopyWith<$Res> {
  factory $NotificationsOpenedCopyWith(NotificationsOpened value, $Res Function(NotificationsOpened) _then) = _$NotificationsOpenedCopyWithImpl;
@useResult
$Res call({
 InboxItem item
});


$InboxItemCopyWith<$Res> get item;

}
/// @nodoc
class _$NotificationsOpenedCopyWithImpl<$Res>
    implements $NotificationsOpenedCopyWith<$Res> {
  _$NotificationsOpenedCopyWithImpl(this._self, this._then);

  final NotificationsOpened _self;
  final $Res Function(NotificationsOpened) _then;

/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(NotificationsOpened(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as InboxItem,
  ));
}

/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InboxItemCopyWith<$Res> get item {
  
  return $InboxItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

/// @nodoc


class NotificationsDismissed implements NotificationsEvent {
  const NotificationsDismissed(this.id);
  

 final  int id;

/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsDismissedCopyWith<NotificationsDismissed> get copyWith => _$NotificationsDismissedCopyWithImpl<NotificationsDismissed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsDismissed&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id);
}

@override
String toString() {
    return 'NotificationsEvent.dismissed(id: $id)';
}


}

/// @nodoc
abstract mixin class $NotificationsDismissedCopyWith<$Res> implements $NotificationsEventCopyWith<$Res> {
  factory $NotificationsDismissedCopyWith(NotificationsDismissed value, $Res Function(NotificationsDismissed) _then) = _$NotificationsDismissedCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$NotificationsDismissedCopyWithImpl<$Res>
    implements $NotificationsDismissedCopyWith<$Res> {
  _$NotificationsDismissedCopyWithImpl(this._self, this._then);

  final NotificationsDismissed _self;
  final $Res Function(NotificationsDismissed) _then;

/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(NotificationsDismissed(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class NotificationsAllRead implements NotificationsEvent {
  const NotificationsAllRead();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsAllRead);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'NotificationsEvent.allRead()';
}


}




/// @nodoc
mixin _$NotificationsState {

 List<InboxItem> get items; bool get loading; bool get loadingMore; bool get hasMore; int get page; Failure? get failure;
/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsStateCopyWith<NotificationsState> get copyWith => _$NotificationsStateCopyWithImpl<NotificationsState>(this as NotificationsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as NotificationsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsState&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.loading, _this.loading) || other.loading == _this.loading)&&(identical(other.loadingMore, _this.loadingMore) || other.loadingMore == _this.loadingMore)&&(identical(other.hasMore, _this.hasMore) || other.hasMore == _this.hasMore)&&(identical(other.page, _this.page) || other.page == _this.page)&&(identical(other.failure, _this.failure) || other.failure == _this.failure));
}


@override
int get hashCode {
  final _this = this as NotificationsState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.items),_this.loading,_this.loadingMore,_this.hasMore,_this.page,_this.failure);
}

@override
String toString() {
  final _this = this as NotificationsState;
  return 'NotificationsState(items: ${_this.items}, loading: ${_this.loading}, loadingMore: ${_this.loadingMore}, hasMore: ${_this.hasMore}, page: ${_this.page}, failure: ${_this.failure})';
}


}

/// @nodoc
abstract mixin class $NotificationsStateCopyWith<$Res>  {
  factory $NotificationsStateCopyWith(NotificationsState value, $Res Function(NotificationsState) _then) = _$NotificationsStateCopyWithImpl;
@useResult
$Res call({
 List<InboxItem> items, bool loading, bool loadingMore, bool hasMore, int page, Failure? failure
});


$FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._self, this._then);

  final NotificationsState _self;
  final $Res Function(NotificationsState) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? loading = null,Object? loadingMore = null,Object? hasMore = null,Object? page = null,Object? failure = freezed,}) {
  return _then(NotificationsState(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<InboxItem>,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,loadingMore: null == loadingMore ? _self.loadingMore : loadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}


/// Adds pattern-matching-related methods to [NotificationsState].
extension NotificationsStatePatterns on NotificationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationsState value)  $default,){
final _that = this;
switch (_that) {
case _NotificationsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationsState value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<InboxItem> items,  bool loading,  bool loadingMore,  bool hasMore,  int page,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
return $default(_that.items,_that.loading,_that.loadingMore,_that.hasMore,_that.page,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<InboxItem> items,  bool loading,  bool loadingMore,  bool hasMore,  int page,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _NotificationsState():
return $default(_that.items,_that.loading,_that.loadingMore,_that.hasMore,_that.page,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<InboxItem> items,  bool loading,  bool loadingMore,  bool hasMore,  int page,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
return $default(_that.items,_that.loading,_that.loadingMore,_that.hasMore,_that.page,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationsState extends NotificationsState {
  const _NotificationsState({ List<InboxItem> items = const <InboxItem>[], this.loading = true, this.loadingMore = false, this.hasMore = false, this.page = 1, this.failure}): _items = items,super._();
  

 final  List<InboxItem> _items;
@override@JsonKey() List<InboxItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool loading;
@override@JsonKey() final  bool loadingMore;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  int page;
@override final  Failure? failure;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationsStateCopyWith<_NotificationsState> get copyWith => __$NotificationsStateCopyWithImpl<_NotificationsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationsState&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.loadingMore, loadingMore) || other.loadingMore == loadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.page, page) || other.page == page)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),loading,loadingMore,hasMore,page,failure);
}

@override
String toString() {
    return 'NotificationsState(items: $items, loading: $loading, loadingMore: $loadingMore, hasMore: $hasMore, page: $page, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$NotificationsStateCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory _$NotificationsStateCopyWith(_NotificationsState value, $Res Function(_NotificationsState) _then) = __$NotificationsStateCopyWithImpl;
@override @useResult
$Res call({
 List<InboxItem> items, bool loading, bool loadingMore, bool hasMore, int page, Failure? failure
});


@override $FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class __$NotificationsStateCopyWithImpl<$Res>
    implements _$NotificationsStateCopyWith<$Res> {
  __$NotificationsStateCopyWithImpl(this._self, this._then);

  final _NotificationsState _self;
  final $Res Function(_NotificationsState) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? loading = null,Object? loadingMore = null,Object? hasMore = null,Object? page = null,Object? failure = freezed,}) {
  return _then(_NotificationsState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<InboxItem>,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,loadingMore: null == loadingMore ? _self.loadingMore : loadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
