// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draft_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CachedDraft {

 FormDraft get draft; String get baseUpdatedAt; String get savedAt; List<int> get dirtySteps;
/// Create a copy of CachedDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CachedDraftCopyWith<CachedDraft> get copyWith => _$CachedDraftCopyWithImpl<CachedDraft>(this as CachedDraft, _$identity);

  /// Serializes this CachedDraft to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CachedDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CachedDraft&&(identical(other.draft, _this.draft) || other.draft == _this.draft)&&(identical(other.baseUpdatedAt, _this.baseUpdatedAt) || other.baseUpdatedAt == _this.baseUpdatedAt)&&(identical(other.savedAt, _this.savedAt) || other.savedAt == _this.savedAt)&&const DeepCollectionEquality().equals(other.dirtySteps, _this.dirtySteps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CachedDraft;
  return Object.hash(runtimeType,_this.draft,_this.baseUpdatedAt,_this.savedAt,const DeepCollectionEquality().hash(_this.dirtySteps));
}

@override
String toString() {
  final _this = this as CachedDraft;
  return 'CachedDraft(draft: ${_this.draft}, baseUpdatedAt: ${_this.baseUpdatedAt}, savedAt: ${_this.savedAt}, dirtySteps: ${_this.dirtySteps})';
}


}

/// @nodoc
abstract mixin class $CachedDraftCopyWith<$Res>  {
  factory $CachedDraftCopyWith(CachedDraft value, $Res Function(CachedDraft) _then) = _$CachedDraftCopyWithImpl;
@useResult
$Res call({
 FormDraft draft, String baseUpdatedAt, String savedAt, List<int> dirtySteps
});


$FormDraftCopyWith<$Res> get draft;

}
/// @nodoc
class _$CachedDraftCopyWithImpl<$Res>
    implements $CachedDraftCopyWith<$Res> {
  _$CachedDraftCopyWithImpl(this._self, this._then);

  final CachedDraft _self;
  final $Res Function(CachedDraft) _then;

/// Create a copy of CachedDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? draft = null,Object? baseUpdatedAt = null,Object? savedAt = null,Object? dirtySteps = null,}) {
  return _then(CachedDraft(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as FormDraft,baseUpdatedAt: null == baseUpdatedAt ? _self.baseUpdatedAt : baseUpdatedAt // ignore: cast_nullable_to_non_nullable
as String,savedAt: null == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as String,dirtySteps: null == dirtySteps ? _self.dirtySteps : dirtySteps // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}
/// Create a copy of CachedDraft
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FormDraftCopyWith<$Res> get draft {
  
  return $FormDraftCopyWith<$Res>(_self.draft, (value) {
    return _then(_self.copyWith(draft: value));
  });
}
}


/// Adds pattern-matching-related methods to [CachedDraft].
extension CachedDraftPatterns on CachedDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CachedDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CachedDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CachedDraft value)  $default,){
final _that = this;
switch (_that) {
case _CachedDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CachedDraft value)?  $default,){
final _that = this;
switch (_that) {
case _CachedDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FormDraft draft,  String baseUpdatedAt,  String savedAt,  List<int> dirtySteps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CachedDraft() when $default != null:
return $default(_that.draft,_that.baseUpdatedAt,_that.savedAt,_that.dirtySteps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FormDraft draft,  String baseUpdatedAt,  String savedAt,  List<int> dirtySteps)  $default,) {final _that = this;
switch (_that) {
case _CachedDraft():
return $default(_that.draft,_that.baseUpdatedAt,_that.savedAt,_that.dirtySteps);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FormDraft draft,  String baseUpdatedAt,  String savedAt,  List<int> dirtySteps)?  $default,) {final _that = this;
switch (_that) {
case _CachedDraft() when $default != null:
return $default(_that.draft,_that.baseUpdatedAt,_that.savedAt,_that.dirtySteps);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CachedDraft implements CachedDraft {
  const _CachedDraft({required this.draft, required this.baseUpdatedAt, required this.savedAt,  List<int> dirtySteps = const <int>[]}): _dirtySteps = dirtySteps;
  factory _CachedDraft.fromJson(Map<String, dynamic> json) => _$CachedDraftFromJson(json);

@override final  FormDraft draft;
@override final  String baseUpdatedAt;
@override final  String savedAt;
 final  List<int> _dirtySteps;
@override@JsonKey() List<int> get dirtySteps {
  if (_dirtySteps is EqualUnmodifiableListView) return _dirtySteps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dirtySteps);
}


/// Create a copy of CachedDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CachedDraftCopyWith<_CachedDraft> get copyWith => __$CachedDraftCopyWithImpl<_CachedDraft>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CachedDraftToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CachedDraft&&(identical(other.draft, draft) || other.draft == draft)&&(identical(other.baseUpdatedAt, baseUpdatedAt) || other.baseUpdatedAt == baseUpdatedAt)&&(identical(other.savedAt, savedAt) || other.savedAt == savedAt)&&const DeepCollectionEquality().equals(other.dirtySteps, _dirtySteps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,draft,baseUpdatedAt,savedAt,const DeepCollectionEquality().hash(_dirtySteps));
}

@override
String toString() {
    return 'CachedDraft(draft: $draft, baseUpdatedAt: $baseUpdatedAt, savedAt: $savedAt, dirtySteps: $dirtySteps)';
}


}

/// @nodoc
abstract mixin class _$CachedDraftCopyWith<$Res> implements $CachedDraftCopyWith<$Res> {
  factory _$CachedDraftCopyWith(_CachedDraft value, $Res Function(_CachedDraft) _then) = __$CachedDraftCopyWithImpl;
@override @useResult
$Res call({
 FormDraft draft, String baseUpdatedAt, String savedAt, List<int> dirtySteps
});


@override $FormDraftCopyWith<$Res> get draft;

}
/// @nodoc
class __$CachedDraftCopyWithImpl<$Res>
    implements _$CachedDraftCopyWith<$Res> {
  __$CachedDraftCopyWithImpl(this._self, this._then);

  final _CachedDraft _self;
  final $Res Function(_CachedDraft) _then;

/// Create a copy of CachedDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? draft = null,Object? baseUpdatedAt = null,Object? savedAt = null,Object? dirtySteps = null,}) {
  return _then(_CachedDraft(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as FormDraft,baseUpdatedAt: null == baseUpdatedAt ? _self.baseUpdatedAt : baseUpdatedAt // ignore: cast_nullable_to_non_nullable
as String,savedAt: null == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as String,dirtySteps: null == dirtySteps ? _self._dirtySteps : dirtySteps // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

/// Create a copy of CachedDraft
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FormDraftCopyWith<$Res> get draft {
  
  return $FormDraftCopyWith<$Res>(_self.draft, (value) {
    return _then(_self.copyWith(draft: value));
  });
}
}

// dart format on
