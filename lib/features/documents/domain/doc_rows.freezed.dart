// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doc_rows.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EarlierCopy {

 VersionState get state; String get at; String? get file;
/// Create a copy of EarlierCopy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EarlierCopyCopyWith<EarlierCopy> get copyWith => _$EarlierCopyCopyWithImpl<EarlierCopy>(this as EarlierCopy, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EarlierCopy;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EarlierCopy&&(identical(other.state, _this.state) || other.state == _this.state)&&(identical(other.at, _this.at) || other.at == _this.at)&&(identical(other.file, _this.file) || other.file == _this.file));
}


@override
int get hashCode {
  final _this = this as EarlierCopy;
  return Object.hash(runtimeType,_this.state,_this.at,_this.file);
}

@override
String toString() {
  final _this = this as EarlierCopy;
  return 'EarlierCopy(state: ${_this.state}, at: ${_this.at}, file: ${_this.file})';
}


}

/// @nodoc
abstract mixin class $EarlierCopyCopyWith<$Res>  {
  factory $EarlierCopyCopyWith(EarlierCopy value, $Res Function(EarlierCopy) _then) = _$EarlierCopyCopyWithImpl;
@useResult
$Res call({
 VersionState state, String at, String? file
});




}
/// @nodoc
class _$EarlierCopyCopyWithImpl<$Res>
    implements $EarlierCopyCopyWith<$Res> {
  _$EarlierCopyCopyWithImpl(this._self, this._then);

  final EarlierCopy _self;
  final $Res Function(EarlierCopy) _then;

/// Create a copy of EarlierCopy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,Object? at = null,Object? file = freezed,}) {
  return _then(EarlierCopy(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as VersionState,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as String,file: freezed == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EarlierCopy].
extension EarlierCopyPatterns on EarlierCopy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EarlierCopy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EarlierCopy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EarlierCopy value)  $default,){
final _that = this;
switch (_that) {
case _EarlierCopy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EarlierCopy value)?  $default,){
final _that = this;
switch (_that) {
case _EarlierCopy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VersionState state,  String at,  String? file)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EarlierCopy() when $default != null:
return $default(_that.state,_that.at,_that.file);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VersionState state,  String at,  String? file)  $default,) {final _that = this;
switch (_that) {
case _EarlierCopy():
return $default(_that.state,_that.at,_that.file);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VersionState state,  String at,  String? file)?  $default,) {final _that = this;
switch (_that) {
case _EarlierCopy() when $default != null:
return $default(_that.state,_that.at,_that.file);case _:
  return null;

}
}

}

/// @nodoc


class _EarlierCopy implements EarlierCopy {
  const _EarlierCopy({required this.state, required this.at, this.file});
  

@override final  VersionState state;
@override final  String at;
@override final  String? file;

/// Create a copy of EarlierCopy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EarlierCopyCopyWith<_EarlierCopy> get copyWith => __$EarlierCopyCopyWithImpl<_EarlierCopy>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EarlierCopy&&(identical(other.state, state) || other.state == state)&&(identical(other.at, at) || other.at == at)&&(identical(other.file, file) || other.file == file));
}


@override
int get hashCode {
    return Object.hash(runtimeType,state,at,file);
}

@override
String toString() {
    return 'EarlierCopy(state: $state, at: $at, file: $file)';
}


}

/// @nodoc
abstract mixin class _$EarlierCopyCopyWith<$Res> implements $EarlierCopyCopyWith<$Res> {
  factory _$EarlierCopyCopyWith(_EarlierCopy value, $Res Function(_EarlierCopy) _then) = __$EarlierCopyCopyWithImpl;
@override @useResult
$Res call({
 VersionState state, String at, String? file
});




}
/// @nodoc
class __$EarlierCopyCopyWithImpl<$Res>
    implements _$EarlierCopyCopyWith<$Res> {
  __$EarlierCopyCopyWithImpl(this._self, this._then);

  final _EarlierCopy _self;
  final $Res Function(_EarlierCopy) _then;

/// Create a copy of EarlierCopy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? at = null,Object? file = freezed,}) {
  return _then(_EarlierCopy(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as VersionState,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as String,file: freezed == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$DocRow {

 String get key; String get code; int get docType; String get title; String get sub; DocStage get stage; DocGroup get group; DocState get state; int? get docId; int? get result; String get activity; bool get early; String get reason; String? get file; String? get url; bool get actionable; bool get isResult; bool get removable; List<EarlierCopy> get earlier;
/// Create a copy of DocRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocRowCopyWith<DocRow> get copyWith => _$DocRowCopyWithImpl<DocRow>(this as DocRow, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DocRow;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocRow&&(identical(other.key, _this.key) || other.key == _this.key)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.docType, _this.docType) || other.docType == _this.docType)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.sub, _this.sub) || other.sub == _this.sub)&&(identical(other.stage, _this.stage) || other.stage == _this.stage)&&(identical(other.group, _this.group) || other.group == _this.group)&&(identical(other.state, _this.state) || other.state == _this.state)&&(identical(other.docId, _this.docId) || other.docId == _this.docId)&&(identical(other.result, _this.result) || other.result == _this.result)&&(identical(other.activity, _this.activity) || other.activity == _this.activity)&&(identical(other.early, _this.early) || other.early == _this.early)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.file, _this.file) || other.file == _this.file)&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.actionable, _this.actionable) || other.actionable == _this.actionable)&&(identical(other.isResult, _this.isResult) || other.isResult == _this.isResult)&&(identical(other.removable, _this.removable) || other.removable == _this.removable)&&const DeepCollectionEquality().equals(other.earlier, _this.earlier));
}


@override
int get hashCode {
  final _this = this as DocRow;
  return Object.hashAll([runtimeType,_this.key,_this.code,_this.docType,_this.title,_this.sub,_this.stage,_this.group,_this.state,_this.docId,_this.result,_this.activity,_this.early,_this.reason,_this.file,_this.url,_this.actionable,_this.isResult,_this.removable,const DeepCollectionEquality().hash(_this.earlier)]);
}

@override
String toString() {
  final _this = this as DocRow;
  return 'DocRow(key: ${_this.key}, code: ${_this.code}, docType: ${_this.docType}, title: ${_this.title}, sub: ${_this.sub}, stage: ${_this.stage}, group: ${_this.group}, state: ${_this.state}, docId: ${_this.docId}, result: ${_this.result}, activity: ${_this.activity}, early: ${_this.early}, reason: ${_this.reason}, file: ${_this.file}, url: ${_this.url}, actionable: ${_this.actionable}, isResult: ${_this.isResult}, removable: ${_this.removable}, earlier: ${_this.earlier})';
}


}

/// @nodoc
abstract mixin class $DocRowCopyWith<$Res>  {
  factory $DocRowCopyWith(DocRow value, $Res Function(DocRow) _then) = _$DocRowCopyWithImpl;
@useResult
$Res call({
 String key, String code, int docType, String title, String sub, DocStage stage, DocGroup group, DocState state, int? docId, int? result, String activity, bool early, String reason, String? file, String? url, bool actionable, bool isResult, bool removable, List<EarlierCopy> earlier
});




}
/// @nodoc
class _$DocRowCopyWithImpl<$Res>
    implements $DocRowCopyWith<$Res> {
  _$DocRowCopyWithImpl(this._self, this._then);

  final DocRow _self;
  final $Res Function(DocRow) _then;

/// Create a copy of DocRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? code = null,Object? docType = null,Object? title = null,Object? sub = null,Object? stage = null,Object? group = null,Object? state = null,Object? docId = freezed,Object? result = freezed,Object? activity = null,Object? early = null,Object? reason = null,Object? file = freezed,Object? url = freezed,Object? actionable = null,Object? isResult = null,Object? removable = null,Object? earlier = null,}) {
  return _then(DocRow(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,docType: null == docType ? _self.docType : docType // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,sub: null == sub ? _self.sub : sub // ignore: cast_nullable_to_non_nullable
as String,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as DocStage,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as DocGroup,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as DocState,docId: freezed == docId ? _self.docId : docId // ignore: cast_nullable_to_non_nullable
as int?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as int?,activity: null == activity ? _self.activity : activity // ignore: cast_nullable_to_non_nullable
as String,early: null == early ? _self.early : early // ignore: cast_nullable_to_non_nullable
as bool,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,file: freezed == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,actionable: null == actionable ? _self.actionable : actionable // ignore: cast_nullable_to_non_nullable
as bool,isResult: null == isResult ? _self.isResult : isResult // ignore: cast_nullable_to_non_nullable
as bool,removable: null == removable ? _self.removable : removable // ignore: cast_nullable_to_non_nullable
as bool,earlier: null == earlier ? _self.earlier : earlier // ignore: cast_nullable_to_non_nullable
as List<EarlierCopy>,
  ));
}

}


/// Adds pattern-matching-related methods to [DocRow].
extension DocRowPatterns on DocRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocRow value)  $default,){
final _that = this;
switch (_that) {
case _DocRow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocRow value)?  $default,){
final _that = this;
switch (_that) {
case _DocRow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String code,  int docType,  String title,  String sub,  DocStage stage,  DocGroup group,  DocState state,  int? docId,  int? result,  String activity,  bool early,  String reason,  String? file,  String? url,  bool actionable,  bool isResult,  bool removable,  List<EarlierCopy> earlier)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocRow() when $default != null:
return $default(_that.key,_that.code,_that.docType,_that.title,_that.sub,_that.stage,_that.group,_that.state,_that.docId,_that.result,_that.activity,_that.early,_that.reason,_that.file,_that.url,_that.actionable,_that.isResult,_that.removable,_that.earlier);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String code,  int docType,  String title,  String sub,  DocStage stage,  DocGroup group,  DocState state,  int? docId,  int? result,  String activity,  bool early,  String reason,  String? file,  String? url,  bool actionable,  bool isResult,  bool removable,  List<EarlierCopy> earlier)  $default,) {final _that = this;
switch (_that) {
case _DocRow():
return $default(_that.key,_that.code,_that.docType,_that.title,_that.sub,_that.stage,_that.group,_that.state,_that.docId,_that.result,_that.activity,_that.early,_that.reason,_that.file,_that.url,_that.actionable,_that.isResult,_that.removable,_that.earlier);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String code,  int docType,  String title,  String sub,  DocStage stage,  DocGroup group,  DocState state,  int? docId,  int? result,  String activity,  bool early,  String reason,  String? file,  String? url,  bool actionable,  bool isResult,  bool removable,  List<EarlierCopy> earlier)?  $default,) {final _that = this;
switch (_that) {
case _DocRow() when $default != null:
return $default(_that.key,_that.code,_that.docType,_that.title,_that.sub,_that.stage,_that.group,_that.state,_that.docId,_that.result,_that.activity,_that.early,_that.reason,_that.file,_that.url,_that.actionable,_that.isResult,_that.removable,_that.earlier);case _:
  return null;

}
}

}

/// @nodoc


class _DocRow extends DocRow {
  const _DocRow({required this.key, required this.code, required this.docType, required this.title, required this.sub, required this.stage, required this.group, required this.state, this.docId, this.result, this.activity = '', this.early = false, this.reason = '', this.file, this.url, this.actionable = true, this.isResult = false, this.removable = false,  List<EarlierCopy> earlier = const <EarlierCopy>[]}): _earlier = earlier,super._();
  

@override final  String key;
@override final  String code;
@override final  int docType;
@override final  String title;
@override final  String sub;
@override final  DocStage stage;
@override final  DocGroup group;
@override final  DocState state;
@override final  int? docId;
@override final  int? result;
@override@JsonKey() final  String activity;
@override@JsonKey() final  bool early;
@override@JsonKey() final  String reason;
@override final  String? file;
@override final  String? url;
@override@JsonKey() final  bool actionable;
@override@JsonKey() final  bool isResult;
@override@JsonKey() final  bool removable;
 final  List<EarlierCopy> _earlier;
@override@JsonKey() List<EarlierCopy> get earlier {
  if (_earlier is EqualUnmodifiableListView) return _earlier;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_earlier);
}


/// Create a copy of DocRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocRowCopyWith<_DocRow> get copyWith => __$DocRowCopyWithImpl<_DocRow>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocRow&&(identical(other.key, key) || other.key == key)&&(identical(other.code, code) || other.code == code)&&(identical(other.docType, docType) || other.docType == docType)&&(identical(other.title, title) || other.title == title)&&(identical(other.sub, sub) || other.sub == sub)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.group, group) || other.group == group)&&(identical(other.state, state) || other.state == state)&&(identical(other.docId, docId) || other.docId == docId)&&(identical(other.result, result) || other.result == result)&&(identical(other.activity, activity) || other.activity == activity)&&(identical(other.early, early) || other.early == early)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.file, file) || other.file == file)&&(identical(other.url, url) || other.url == url)&&(identical(other.actionable, actionable) || other.actionable == actionable)&&(identical(other.isResult, isResult) || other.isResult == isResult)&&(identical(other.removable, removable) || other.removable == removable)&&const DeepCollectionEquality().equals(other.earlier, _earlier));
}


@override
int get hashCode {
    return Object.hashAll([runtimeType,key,code,docType,title,sub,stage,group,state,docId,result,activity,early,reason,file,url,actionable,isResult,removable,const DeepCollectionEquality().hash(_earlier)]);
}

@override
String toString() {
    return 'DocRow(key: $key, code: $code, docType: $docType, title: $title, sub: $sub, stage: $stage, group: $group, state: $state, docId: $docId, result: $result, activity: $activity, early: $early, reason: $reason, file: $file, url: $url, actionable: $actionable, isResult: $isResult, removable: $removable, earlier: $earlier)';
}


}

/// @nodoc
abstract mixin class _$DocRowCopyWith<$Res> implements $DocRowCopyWith<$Res> {
  factory _$DocRowCopyWith(_DocRow value, $Res Function(_DocRow) _then) = __$DocRowCopyWithImpl;
@override @useResult
$Res call({
 String key, String code, int docType, String title, String sub, DocStage stage, DocGroup group, DocState state, int? docId, int? result, String activity, bool early, String reason, String? file, String? url, bool actionable, bool isResult, bool removable, List<EarlierCopy> earlier
});




}
/// @nodoc
class __$DocRowCopyWithImpl<$Res>
    implements _$DocRowCopyWith<$Res> {
  __$DocRowCopyWithImpl(this._self, this._then);

  final _DocRow _self;
  final $Res Function(_DocRow) _then;

/// Create a copy of DocRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? code = null,Object? docType = null,Object? title = null,Object? sub = null,Object? stage = null,Object? group = null,Object? state = null,Object? docId = freezed,Object? result = freezed,Object? activity = null,Object? early = null,Object? reason = null,Object? file = freezed,Object? url = freezed,Object? actionable = null,Object? isResult = null,Object? removable = null,Object? earlier = null,}) {
  return _then(_DocRow(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,docType: null == docType ? _self.docType : docType // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,sub: null == sub ? _self.sub : sub // ignore: cast_nullable_to_non_nullable
as String,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as DocStage,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as DocGroup,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as DocState,docId: freezed == docId ? _self.docId : docId // ignore: cast_nullable_to_non_nullable
as int?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as int?,activity: null == activity ? _self.activity : activity // ignore: cast_nullable_to_non_nullable
as String,early: null == early ? _self.early : early // ignore: cast_nullable_to_non_nullable
as bool,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,file: freezed == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,actionable: null == actionable ? _self.actionable : actionable // ignore: cast_nullable_to_non_nullable
as bool,isResult: null == isResult ? _self.isResult : isResult // ignore: cast_nullable_to_non_nullable
as bool,removable: null == removable ? _self.removable : removable // ignore: cast_nullable_to_non_nullable
as bool,earlier: null == earlier ? _self._earlier : earlier // ignore: cast_nullable_to_non_nullable
as List<EarlierCopy>,
  ));
}


}

// dart format on
