// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slot_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SlotListState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SlotListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SlotListState()';
}


}

/// @nodoc
class $SlotListStateCopyWith<$Res>  {
$SlotListStateCopyWith(SlotListState _, $Res Function(SlotListState) __);
}


/// Adds pattern-matching-related methods to [SlotListState].
extension SlotListStatePatterns on SlotListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SlotListLoading value)?  loading,TResult Function( SlotListLoaded value)?  loaded,TResult Function( SlotListFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SlotListLoading() when loading != null:
return loading(_that);case SlotListLoaded() when loaded != null:
return loaded(_that);case SlotListFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SlotListLoading value)  loading,required TResult Function( SlotListLoaded value)  loaded,required TResult Function( SlotListFailed value)  failed,}){
final _that = this;
switch (_that) {
case SlotListLoading():
return loading(_that);case SlotListLoaded():
return loaded(_that);case SlotListFailed():
return failed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SlotListLoading value)?  loading,TResult? Function( SlotListLoaded value)?  loaded,TResult? Function( SlotListFailed value)?  failed,}){
final _that = this;
switch (_that) {
case SlotListLoading() when loading != null:
return loading(_that);case SlotListLoaded() when loaded != null:
return loaded(_that);case SlotListFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<SlotItem> items)?  loaded,TResult Function( Failure failure)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SlotListLoading() when loading != null:
return loading();case SlotListLoaded() when loaded != null:
return loaded(_that.items);case SlotListFailed() when failed != null:
return failed(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<SlotItem> items)  loaded,required TResult Function( Failure failure)  failed,}) {final _that = this;
switch (_that) {
case SlotListLoading():
return loading();case SlotListLoaded():
return loaded(_that.items);case SlotListFailed():
return failed(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<SlotItem> items)?  loaded,TResult? Function( Failure failure)?  failed,}) {final _that = this;
switch (_that) {
case SlotListLoading() when loading != null:
return loading();case SlotListLoaded() when loaded != null:
return loaded(_that.items);case SlotListFailed() when failed != null:
return failed(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class SlotListLoading implements SlotListState {
  const SlotListLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SlotListLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SlotListState.loading()';
}


}




/// @nodoc


class SlotListLoaded implements SlotListState {
  const SlotListLoaded( List<SlotItem> items): _items = items;
  

 final  List<SlotItem> _items;
 List<SlotItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of SlotListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SlotListLoadedCopyWith<SlotListLoaded> get copyWith => _$SlotListLoadedCopyWithImpl<SlotListLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SlotListLoaded&&const DeepCollectionEquality().equals(other.items, _items));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));
}

@override
String toString() {
    return 'SlotListState.loaded(items: $items)';
}


}

/// @nodoc
abstract mixin class $SlotListLoadedCopyWith<$Res> implements $SlotListStateCopyWith<$Res> {
  factory $SlotListLoadedCopyWith(SlotListLoaded value, $Res Function(SlotListLoaded) _then) = _$SlotListLoadedCopyWithImpl;
@useResult
$Res call({
 List<SlotItem> items
});




}
/// @nodoc
class _$SlotListLoadedCopyWithImpl<$Res>
    implements $SlotListLoadedCopyWith<$Res> {
  _$SlotListLoadedCopyWithImpl(this._self, this._then);

  final SlotListLoaded _self;
  final $Res Function(SlotListLoaded) _then;

/// Create a copy of SlotListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(SlotListLoaded(
null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SlotItem>,
  ));
}


}

/// @nodoc


class SlotListFailed implements SlotListState {
  const SlotListFailed(this.failure);
  

 final  Failure failure;

/// Create a copy of SlotListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SlotListFailedCopyWith<SlotListFailed> get copyWith => _$SlotListFailedCopyWithImpl<SlotListFailed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SlotListFailed&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,failure);
}

@override
String toString() {
    return 'SlotListState.failed(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $SlotListFailedCopyWith<$Res> implements $SlotListStateCopyWith<$Res> {
  factory $SlotListFailedCopyWith(SlotListFailed value, $Res Function(SlotListFailed) _then) = _$SlotListFailedCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$SlotListFailedCopyWithImpl<$Res>
    implements $SlotListFailedCopyWith<$Res> {
  _$SlotListFailedCopyWithImpl(this._self, this._then);

  final SlotListFailed _self;
  final $Res Function(SlotListFailed) _then;

/// Create a copy of SlotListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(SlotListFailed(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of SlotListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res> get failure {
  
  return $FailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
