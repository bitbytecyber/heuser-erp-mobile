// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'documents.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DocVersion {

 int get id; String? get file;@JsonKey(unknownEnumValue: VersionState.unknown) VersionState get state; String get reason;@JsonKey(name: 'uploaded_at') String get uploadedAt;@JsonKey(name: 'reviewed_by') String? get reviewedBy;@JsonKey(name: 'reviewed_at') String? get reviewedAt;
/// Create a copy of DocVersion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocVersionCopyWith<DocVersion> get copyWith => _$DocVersionCopyWithImpl<DocVersion>(this as DocVersion, _$identity);

  /// Serializes this DocVersion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DocVersion;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocVersion&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.file, _this.file) || other.file == _this.file)&&(identical(other.state, _this.state) || other.state == _this.state)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.uploadedAt, _this.uploadedAt) || other.uploadedAt == _this.uploadedAt)&&(identical(other.reviewedBy, _this.reviewedBy) || other.reviewedBy == _this.reviewedBy)&&(identical(other.reviewedAt, _this.reviewedAt) || other.reviewedAt == _this.reviewedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DocVersion;
  return Object.hash(runtimeType,_this.id,_this.file,_this.state,_this.reason,_this.uploadedAt,_this.reviewedBy,_this.reviewedAt);
}

@override
String toString() {
  final _this = this as DocVersion;
  return 'DocVersion(id: ${_this.id}, file: ${_this.file}, state: ${_this.state}, reason: ${_this.reason}, uploadedAt: ${_this.uploadedAt}, reviewedBy: ${_this.reviewedBy}, reviewedAt: ${_this.reviewedAt})';
}


}

/// @nodoc
abstract mixin class $DocVersionCopyWith<$Res>  {
  factory $DocVersionCopyWith(DocVersion value, $Res Function(DocVersion) _then) = _$DocVersionCopyWithImpl;
@useResult
$Res call({
 int id, String? file,@JsonKey(unknownEnumValue: VersionState.unknown) VersionState state, String reason,@JsonKey(name: 'uploaded_at') String uploadedAt,@JsonKey(name: 'reviewed_by') String? reviewedBy,@JsonKey(name: 'reviewed_at') String? reviewedAt
});




}
/// @nodoc
class _$DocVersionCopyWithImpl<$Res>
    implements $DocVersionCopyWith<$Res> {
  _$DocVersionCopyWithImpl(this._self, this._then);

  final DocVersion _self;
  final $Res Function(DocVersion) _then;

/// Create a copy of DocVersion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? file = freezed,Object? state = null,Object? reason = null,Object? uploadedAt = null,Object? reviewedBy = freezed,Object? reviewedAt = freezed,}) {
  return _then(DocVersion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,file: freezed == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as String?,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as VersionState,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,uploadedAt: null == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as String,reviewedBy: freezed == reviewedBy ? _self.reviewedBy : reviewedBy // ignore: cast_nullable_to_non_nullable
as String?,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DocVersion].
extension DocVersionPatterns on DocVersion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocVersion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocVersion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocVersion value)  $default,){
final _that = this;
switch (_that) {
case _DocVersion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocVersion value)?  $default,){
final _that = this;
switch (_that) {
case _DocVersion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? file, @JsonKey(unknownEnumValue: VersionState.unknown)  VersionState state,  String reason, @JsonKey(name: 'uploaded_at')  String uploadedAt, @JsonKey(name: 'reviewed_by')  String? reviewedBy, @JsonKey(name: 'reviewed_at')  String? reviewedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocVersion() when $default != null:
return $default(_that.id,_that.file,_that.state,_that.reason,_that.uploadedAt,_that.reviewedBy,_that.reviewedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? file, @JsonKey(unknownEnumValue: VersionState.unknown)  VersionState state,  String reason, @JsonKey(name: 'uploaded_at')  String uploadedAt, @JsonKey(name: 'reviewed_by')  String? reviewedBy, @JsonKey(name: 'reviewed_at')  String? reviewedAt)  $default,) {final _that = this;
switch (_that) {
case _DocVersion():
return $default(_that.id,_that.file,_that.state,_that.reason,_that.uploadedAt,_that.reviewedBy,_that.reviewedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? file, @JsonKey(unknownEnumValue: VersionState.unknown)  VersionState state,  String reason, @JsonKey(name: 'uploaded_at')  String uploadedAt, @JsonKey(name: 'reviewed_by')  String? reviewedBy, @JsonKey(name: 'reviewed_at')  String? reviewedAt)?  $default,) {final _that = this;
switch (_that) {
case _DocVersion() when $default != null:
return $default(_that.id,_that.file,_that.state,_that.reason,_that.uploadedAt,_that.reviewedBy,_that.reviewedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DocVersion implements DocVersion {
  const _DocVersion({required this.id, this.file, @JsonKey(unknownEnumValue: VersionState.unknown) this.state = VersionState.pending, this.reason = '', @JsonKey(name: 'uploaded_at') this.uploadedAt = '', @JsonKey(name: 'reviewed_by') this.reviewedBy, @JsonKey(name: 'reviewed_at') this.reviewedAt});
  factory _DocVersion.fromJson(Map<String, dynamic> json) => _$DocVersionFromJson(json);

@override final  int id;
@override final  String? file;
@override@JsonKey(unknownEnumValue: VersionState.unknown) final  VersionState state;
@override@JsonKey() final  String reason;
@override@JsonKey(name: 'uploaded_at') final  String uploadedAt;
@override@JsonKey(name: 'reviewed_by') final  String? reviewedBy;
@override@JsonKey(name: 'reviewed_at') final  String? reviewedAt;

/// Create a copy of DocVersion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocVersionCopyWith<_DocVersion> get copyWith => __$DocVersionCopyWithImpl<_DocVersion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocVersionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocVersion&&(identical(other.id, id) || other.id == id)&&(identical(other.file, file) || other.file == file)&&(identical(other.state, state) || other.state == state)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt)&&(identical(other.reviewedBy, reviewedBy) || other.reviewedBy == reviewedBy)&&(identical(other.reviewedAt, reviewedAt) || other.reviewedAt == reviewedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,file,state,reason,uploadedAt,reviewedBy,reviewedAt);
}

@override
String toString() {
    return 'DocVersion(id: $id, file: $file, state: $state, reason: $reason, uploadedAt: $uploadedAt, reviewedBy: $reviewedBy, reviewedAt: $reviewedAt)';
}


}

/// @nodoc
abstract mixin class _$DocVersionCopyWith<$Res> implements $DocVersionCopyWith<$Res> {
  factory _$DocVersionCopyWith(_DocVersion value, $Res Function(_DocVersion) _then) = __$DocVersionCopyWithImpl;
@override @useResult
$Res call({
 int id, String? file,@JsonKey(unknownEnumValue: VersionState.unknown) VersionState state, String reason,@JsonKey(name: 'uploaded_at') String uploadedAt,@JsonKey(name: 'reviewed_by') String? reviewedBy,@JsonKey(name: 'reviewed_at') String? reviewedAt
});




}
/// @nodoc
class __$DocVersionCopyWithImpl<$Res>
    implements _$DocVersionCopyWith<$Res> {
  __$DocVersionCopyWithImpl(this._self, this._then);

  final _DocVersion _self;
  final $Res Function(_DocVersion) _then;

/// Create a copy of DocVersion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? file = freezed,Object? state = null,Object? reason = null,Object? uploadedAt = null,Object? reviewedBy = freezed,Object? reviewedAt = freezed,}) {
  return _then(_DocVersion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,file: freezed == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as String?,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as VersionState,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,uploadedAt: null == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as String,reviewedBy: freezed == reviewedBy ? _self.reviewedBy : reviewedBy // ignore: cast_nullable_to_non_nullable
as String?,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DocSlot {

 int get id;@JsonKey(name: 'doc_type') int get docType; String get code; String get name; String get hint;@JsonKey(unknownEnumValue: DocStage.unknown) DocStage get stage; int? get result; String get activity; bool get later;@JsonKey(unknownEnumValue: DocSlotState.unknown) DocSlotState get state; String get reason; List<DocVersion> get versions;
/// Create a copy of DocSlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocSlotCopyWith<DocSlot> get copyWith => _$DocSlotCopyWithImpl<DocSlot>(this as DocSlot, _$identity);

  /// Serializes this DocSlot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DocSlot;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocSlot&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.docType, _this.docType) || other.docType == _this.docType)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.hint, _this.hint) || other.hint == _this.hint)&&(identical(other.stage, _this.stage) || other.stage == _this.stage)&&(identical(other.result, _this.result) || other.result == _this.result)&&(identical(other.activity, _this.activity) || other.activity == _this.activity)&&(identical(other.later, _this.later) || other.later == _this.later)&&(identical(other.state, _this.state) || other.state == _this.state)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&const DeepCollectionEquality().equals(other.versions, _this.versions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DocSlot;
  return Object.hash(runtimeType,_this.id,_this.docType,_this.code,_this.name,_this.hint,_this.stage,_this.result,_this.activity,_this.later,_this.state,_this.reason,const DeepCollectionEquality().hash(_this.versions));
}

@override
String toString() {
  final _this = this as DocSlot;
  return 'DocSlot(id: ${_this.id}, docType: ${_this.docType}, code: ${_this.code}, name: ${_this.name}, hint: ${_this.hint}, stage: ${_this.stage}, result: ${_this.result}, activity: ${_this.activity}, later: ${_this.later}, state: ${_this.state}, reason: ${_this.reason}, versions: ${_this.versions})';
}


}

/// @nodoc
abstract mixin class $DocSlotCopyWith<$Res>  {
  factory $DocSlotCopyWith(DocSlot value, $Res Function(DocSlot) _then) = _$DocSlotCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'doc_type') int docType, String code, String name, String hint,@JsonKey(unknownEnumValue: DocStage.unknown) DocStage stage, int? result, String activity, bool later,@JsonKey(unknownEnumValue: DocSlotState.unknown) DocSlotState state, String reason, List<DocVersion> versions
});




}
/// @nodoc
class _$DocSlotCopyWithImpl<$Res>
    implements $DocSlotCopyWith<$Res> {
  _$DocSlotCopyWithImpl(this._self, this._then);

  final DocSlot _self;
  final $Res Function(DocSlot) _then;

/// Create a copy of DocSlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? docType = null,Object? code = null,Object? name = null,Object? hint = null,Object? stage = null,Object? result = freezed,Object? activity = null,Object? later = null,Object? state = null,Object? reason = null,Object? versions = null,}) {
  return _then(DocSlot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,docType: null == docType ? _self.docType : docType // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hint: null == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as DocStage,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as int?,activity: null == activity ? _self.activity : activity // ignore: cast_nullable_to_non_nullable
as String,later: null == later ? _self.later : later // ignore: cast_nullable_to_non_nullable
as bool,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as DocSlotState,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,versions: null == versions ? _self.versions : versions // ignore: cast_nullable_to_non_nullable
as List<DocVersion>,
  ));
}

}


/// Adds pattern-matching-related methods to [DocSlot].
extension DocSlotPatterns on DocSlot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocSlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocSlot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocSlot value)  $default,){
final _that = this;
switch (_that) {
case _DocSlot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocSlot value)?  $default,){
final _that = this;
switch (_that) {
case _DocSlot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'doc_type')  int docType,  String code,  String name,  String hint, @JsonKey(unknownEnumValue: DocStage.unknown)  DocStage stage,  int? result,  String activity,  bool later, @JsonKey(unknownEnumValue: DocSlotState.unknown)  DocSlotState state,  String reason,  List<DocVersion> versions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocSlot() when $default != null:
return $default(_that.id,_that.docType,_that.code,_that.name,_that.hint,_that.stage,_that.result,_that.activity,_that.later,_that.state,_that.reason,_that.versions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'doc_type')  int docType,  String code,  String name,  String hint, @JsonKey(unknownEnumValue: DocStage.unknown)  DocStage stage,  int? result,  String activity,  bool later, @JsonKey(unknownEnumValue: DocSlotState.unknown)  DocSlotState state,  String reason,  List<DocVersion> versions)  $default,) {final _that = this;
switch (_that) {
case _DocSlot():
return $default(_that.id,_that.docType,_that.code,_that.name,_that.hint,_that.stage,_that.result,_that.activity,_that.later,_that.state,_that.reason,_that.versions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'doc_type')  int docType,  String code,  String name,  String hint, @JsonKey(unknownEnumValue: DocStage.unknown)  DocStage stage,  int? result,  String activity,  bool later, @JsonKey(unknownEnumValue: DocSlotState.unknown)  DocSlotState state,  String reason,  List<DocVersion> versions)?  $default,) {final _that = this;
switch (_that) {
case _DocSlot() when $default != null:
return $default(_that.id,_that.docType,_that.code,_that.name,_that.hint,_that.stage,_that.result,_that.activity,_that.later,_that.state,_that.reason,_that.versions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DocSlot extends DocSlot {
  const _DocSlot({required this.id, @JsonKey(name: 'doc_type') required this.docType, this.code = '', this.name = '', this.hint = '', @JsonKey(unknownEnumValue: DocStage.unknown) this.stage = DocStage.optional, this.result, this.activity = '', this.later = false, @JsonKey(unknownEnumValue: DocSlotState.unknown) this.state = DocSlotState.missing, this.reason = '',  List<DocVersion> versions = const <DocVersion>[]}): _versions = versions,super._();
  factory _DocSlot.fromJson(Map<String, dynamic> json) => _$DocSlotFromJson(json);

@override final  int id;
@override@JsonKey(name: 'doc_type') final  int docType;
@override@JsonKey() final  String code;
@override@JsonKey() final  String name;
@override@JsonKey() final  String hint;
@override@JsonKey(unknownEnumValue: DocStage.unknown) final  DocStage stage;
@override final  int? result;
@override@JsonKey() final  String activity;
@override@JsonKey() final  bool later;
@override@JsonKey(unknownEnumValue: DocSlotState.unknown) final  DocSlotState state;
@override@JsonKey() final  String reason;
 final  List<DocVersion> _versions;
@override@JsonKey() List<DocVersion> get versions {
  if (_versions is EqualUnmodifiableListView) return _versions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_versions);
}


/// Create a copy of DocSlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocSlotCopyWith<_DocSlot> get copyWith => __$DocSlotCopyWithImpl<_DocSlot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocSlotToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocSlot&&(identical(other.id, id) || other.id == id)&&(identical(other.docType, docType) || other.docType == docType)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.hint, hint) || other.hint == hint)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.result, result) || other.result == result)&&(identical(other.activity, activity) || other.activity == activity)&&(identical(other.later, later) || other.later == later)&&(identical(other.state, state) || other.state == state)&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other.versions, _versions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,docType,code,name,hint,stage,result,activity,later,state,reason,const DeepCollectionEquality().hash(_versions));
}

@override
String toString() {
    return 'DocSlot(id: $id, docType: $docType, code: $code, name: $name, hint: $hint, stage: $stage, result: $result, activity: $activity, later: $later, state: $state, reason: $reason, versions: $versions)';
}


}

/// @nodoc
abstract mixin class _$DocSlotCopyWith<$Res> implements $DocSlotCopyWith<$Res> {
  factory _$DocSlotCopyWith(_DocSlot value, $Res Function(_DocSlot) _then) = __$DocSlotCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'doc_type') int docType, String code, String name, String hint,@JsonKey(unknownEnumValue: DocStage.unknown) DocStage stage, int? result, String activity, bool later,@JsonKey(unknownEnumValue: DocSlotState.unknown) DocSlotState state, String reason, List<DocVersion> versions
});




}
/// @nodoc
class __$DocSlotCopyWithImpl<$Res>
    implements _$DocSlotCopyWith<$Res> {
  __$DocSlotCopyWithImpl(this._self, this._then);

  final _DocSlot _self;
  final $Res Function(_DocSlot) _then;

/// Create a copy of DocSlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? docType = null,Object? code = null,Object? name = null,Object? hint = null,Object? stage = null,Object? result = freezed,Object? activity = null,Object? later = null,Object? state = null,Object? reason = null,Object? versions = null,}) {
  return _then(_DocSlot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,docType: null == docType ? _self.docType : docType // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hint: null == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as DocStage,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as int?,activity: null == activity ? _self.activity : activity // ignore: cast_nullable_to_non_nullable
as String,later: null == later ? _self.later : later // ignore: cast_nullable_to_non_nullable
as bool,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as DocSlotState,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,versions: null == versions ? _self._versions : versions // ignore: cast_nullable_to_non_nullable
as List<DocVersion>,
  ));
}


}


/// @nodoc
mixin _$DocumentType {

 int get id; String get code; String get name; String get hint;@JsonKey(unknownEnumValue: DocStage.unknown) DocStage get stage;@JsonKey(name: 'per_subject') bool get perSubject;@JsonKey(name: 'blocks_interview') bool? get blocksInterview;
/// Create a copy of DocumentType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentTypeCopyWith<DocumentType> get copyWith => _$DocumentTypeCopyWithImpl<DocumentType>(this as DocumentType, _$identity);

  /// Serializes this DocumentType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DocumentType;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentType&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.hint, _this.hint) || other.hint == _this.hint)&&(identical(other.stage, _this.stage) || other.stage == _this.stage)&&(identical(other.perSubject, _this.perSubject) || other.perSubject == _this.perSubject)&&(identical(other.blocksInterview, _this.blocksInterview) || other.blocksInterview == _this.blocksInterview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DocumentType;
  return Object.hash(runtimeType,_this.id,_this.code,_this.name,_this.hint,_this.stage,_this.perSubject,_this.blocksInterview);
}

@override
String toString() {
  final _this = this as DocumentType;
  return 'DocumentType(id: ${_this.id}, code: ${_this.code}, name: ${_this.name}, hint: ${_this.hint}, stage: ${_this.stage}, perSubject: ${_this.perSubject}, blocksInterview: ${_this.blocksInterview})';
}


}

/// @nodoc
abstract mixin class $DocumentTypeCopyWith<$Res>  {
  factory $DocumentTypeCopyWith(DocumentType value, $Res Function(DocumentType) _then) = _$DocumentTypeCopyWithImpl;
@useResult
$Res call({
 int id, String code, String name, String hint,@JsonKey(unknownEnumValue: DocStage.unknown) DocStage stage,@JsonKey(name: 'per_subject') bool perSubject,@JsonKey(name: 'blocks_interview') bool? blocksInterview
});




}
/// @nodoc
class _$DocumentTypeCopyWithImpl<$Res>
    implements $DocumentTypeCopyWith<$Res> {
  _$DocumentTypeCopyWithImpl(this._self, this._then);

  final DocumentType _self;
  final $Res Function(DocumentType) _then;

/// Create a copy of DocumentType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? name = null,Object? hint = null,Object? stage = null,Object? perSubject = null,Object? blocksInterview = freezed,}) {
  return _then(DocumentType(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hint: null == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as DocStage,perSubject: null == perSubject ? _self.perSubject : perSubject // ignore: cast_nullable_to_non_nullable
as bool,blocksInterview: freezed == blocksInterview ? _self.blocksInterview : blocksInterview // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [DocumentType].
extension DocumentTypePatterns on DocumentType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentType value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentType() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentType value)  $default,){
final _that = this;
switch (_that) {
case _DocumentType():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentType value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentType() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String code,  String name,  String hint, @JsonKey(unknownEnumValue: DocStage.unknown)  DocStage stage, @JsonKey(name: 'per_subject')  bool perSubject, @JsonKey(name: 'blocks_interview')  bool? blocksInterview)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentType() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.hint,_that.stage,_that.perSubject,_that.blocksInterview);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String code,  String name,  String hint, @JsonKey(unknownEnumValue: DocStage.unknown)  DocStage stage, @JsonKey(name: 'per_subject')  bool perSubject, @JsonKey(name: 'blocks_interview')  bool? blocksInterview)  $default,) {final _that = this;
switch (_that) {
case _DocumentType():
return $default(_that.id,_that.code,_that.name,_that.hint,_that.stage,_that.perSubject,_that.blocksInterview);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String code,  String name,  String hint, @JsonKey(unknownEnumValue: DocStage.unknown)  DocStage stage, @JsonKey(name: 'per_subject')  bool perSubject, @JsonKey(name: 'blocks_interview')  bool? blocksInterview)?  $default,) {final _that = this;
switch (_that) {
case _DocumentType() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.hint,_that.stage,_that.perSubject,_that.blocksInterview);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DocumentType implements DocumentType {
  const _DocumentType({required this.id, required this.code, this.name = '', this.hint = '', @JsonKey(unknownEnumValue: DocStage.unknown) this.stage = DocStage.optional, @JsonKey(name: 'per_subject') this.perSubject = false, @JsonKey(name: 'blocks_interview') this.blocksInterview});
  factory _DocumentType.fromJson(Map<String, dynamic> json) => _$DocumentTypeFromJson(json);

@override final  int id;
@override final  String code;
@override@JsonKey() final  String name;
@override@JsonKey() final  String hint;
@override@JsonKey(unknownEnumValue: DocStage.unknown) final  DocStage stage;
@override@JsonKey(name: 'per_subject') final  bool perSubject;
@override@JsonKey(name: 'blocks_interview') final  bool? blocksInterview;

/// Create a copy of DocumentType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentTypeCopyWith<_DocumentType> get copyWith => __$DocumentTypeCopyWithImpl<_DocumentType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocumentTypeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentType&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.hint, hint) || other.hint == hint)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.perSubject, perSubject) || other.perSubject == perSubject)&&(identical(other.blocksInterview, blocksInterview) || other.blocksInterview == blocksInterview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,code,name,hint,stage,perSubject,blocksInterview);
}

@override
String toString() {
    return 'DocumentType(id: $id, code: $code, name: $name, hint: $hint, stage: $stage, perSubject: $perSubject, blocksInterview: $blocksInterview)';
}


}

/// @nodoc
abstract mixin class _$DocumentTypeCopyWith<$Res> implements $DocumentTypeCopyWith<$Res> {
  factory _$DocumentTypeCopyWith(_DocumentType value, $Res Function(_DocumentType) _then) = __$DocumentTypeCopyWithImpl;
@override @useResult
$Res call({
 int id, String code, String name, String hint,@JsonKey(unknownEnumValue: DocStage.unknown) DocStage stage,@JsonKey(name: 'per_subject') bool perSubject,@JsonKey(name: 'blocks_interview') bool? blocksInterview
});




}
/// @nodoc
class __$DocumentTypeCopyWithImpl<$Res>
    implements _$DocumentTypeCopyWith<$Res> {
  __$DocumentTypeCopyWithImpl(this._self, this._then);

  final _DocumentType _self;
  final $Res Function(_DocumentType) _then;

/// Create a copy of DocumentType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? name = null,Object? hint = null,Object? stage = null,Object? perSubject = null,Object? blocksInterview = freezed,}) {
  return _then(_DocumentType(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hint: null == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as DocStage,perSubject: null == perSubject ? _self.perSubject : perSubject // ignore: cast_nullable_to_non_nullable
as bool,blocksInterview: freezed == blocksInterview ? _self.blocksInterview : blocksInterview // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
