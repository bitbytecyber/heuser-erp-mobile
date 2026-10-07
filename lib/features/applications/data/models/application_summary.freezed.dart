// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrackerStage {

 String get key; String get label;
/// Create a copy of TrackerStage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackerStageCopyWith<TrackerStage> get copyWith => _$TrackerStageCopyWithImpl<TrackerStage>(this as TrackerStage, _$identity);

  /// Serializes this TrackerStage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TrackerStage;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackerStage&&(identical(other.key, _this.key) || other.key == _this.key)&&(identical(other.label, _this.label) || other.label == _this.label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TrackerStage;
  return Object.hash(runtimeType,_this.key,_this.label);
}

@override
String toString() {
  final _this = this as TrackerStage;
  return 'TrackerStage(key: ${_this.key}, label: ${_this.label})';
}


}

/// @nodoc
abstract mixin class $TrackerStageCopyWith<$Res>  {
  factory $TrackerStageCopyWith(TrackerStage value, $Res Function(TrackerStage) _then) = _$TrackerStageCopyWithImpl;
@useResult
$Res call({
 String key, String label
});




}
/// @nodoc
class _$TrackerStageCopyWithImpl<$Res>
    implements $TrackerStageCopyWith<$Res> {
  _$TrackerStageCopyWithImpl(this._self, this._then);

  final TrackerStage _self;
  final $Res Function(TrackerStage) _then;

/// Create a copy of TrackerStage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? label = null,}) {
  return _then(TrackerStage(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackerStage].
extension TrackerStagePatterns on TrackerStage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackerStage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackerStage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackerStage value)  $default,){
final _that = this;
switch (_that) {
case _TrackerStage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackerStage value)?  $default,){
final _that = this;
switch (_that) {
case _TrackerStage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackerStage() when $default != null:
return $default(_that.key,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String label)  $default,) {final _that = this;
switch (_that) {
case _TrackerStage():
return $default(_that.key,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String label)?  $default,) {final _that = this;
switch (_that) {
case _TrackerStage() when $default != null:
return $default(_that.key,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrackerStage implements TrackerStage {
  const _TrackerStage({required this.key, this.label = ''});
  factory _TrackerStage.fromJson(Map<String, dynamic> json) => _$TrackerStageFromJson(json);

@override final  String key;
@override@JsonKey() final  String label;

/// Create a copy of TrackerStage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackerStageCopyWith<_TrackerStage> get copyWith => __$TrackerStageCopyWithImpl<_TrackerStage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackerStageToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackerStage&&(identical(other.key, key) || other.key == key)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,key,label);
}

@override
String toString() {
    return 'TrackerStage(key: $key, label: $label)';
}


}

/// @nodoc
abstract mixin class _$TrackerStageCopyWith<$Res> implements $TrackerStageCopyWith<$Res> {
  factory _$TrackerStageCopyWith(_TrackerStage value, $Res Function(_TrackerStage) _then) = __$TrackerStageCopyWithImpl;
@override @useResult
$Res call({
 String key, String label
});




}
/// @nodoc
class __$TrackerStageCopyWithImpl<$Res>
    implements _$TrackerStageCopyWith<$Res> {
  __$TrackerStageCopyWithImpl(this._self, this._then);

  final _TrackerStage _self;
  final $Res Function(_TrackerStage) _then;

/// Create a copy of TrackerStage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? label = null,}) {
  return _then(_TrackerStage(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Tracker {

 List<TrackerStage> get stages; String? get current; String? get ended;
/// Create a copy of Tracker
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackerCopyWith<Tracker> get copyWith => _$TrackerCopyWithImpl<Tracker>(this as Tracker, _$identity);

  /// Serializes this Tracker to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Tracker;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tracker&&const DeepCollectionEquality().equals(other.stages, _this.stages)&&(identical(other.current, _this.current) || other.current == _this.current)&&(identical(other.ended, _this.ended) || other.ended == _this.ended));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Tracker;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.stages),_this.current,_this.ended);
}

@override
String toString() {
  final _this = this as Tracker;
  return 'Tracker(stages: ${_this.stages}, current: ${_this.current}, ended: ${_this.ended})';
}


}

/// @nodoc
abstract mixin class $TrackerCopyWith<$Res>  {
  factory $TrackerCopyWith(Tracker value, $Res Function(Tracker) _then) = _$TrackerCopyWithImpl;
@useResult
$Res call({
 List<TrackerStage> stages, String? current, String? ended
});




}
/// @nodoc
class _$TrackerCopyWithImpl<$Res>
    implements $TrackerCopyWith<$Res> {
  _$TrackerCopyWithImpl(this._self, this._then);

  final Tracker _self;
  final $Res Function(Tracker) _then;

/// Create a copy of Tracker
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stages = null,Object? current = freezed,Object? ended = freezed,}) {
  return _then(Tracker(
stages: null == stages ? _self.stages : stages // ignore: cast_nullable_to_non_nullable
as List<TrackerStage>,current: freezed == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as String?,ended: freezed == ended ? _self.ended : ended // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Tracker].
extension TrackerPatterns on Tracker {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tracker value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tracker() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tracker value)  $default,){
final _that = this;
switch (_that) {
case _Tracker():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tracker value)?  $default,){
final _that = this;
switch (_that) {
case _Tracker() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TrackerStage> stages,  String? current,  String? ended)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tracker() when $default != null:
return $default(_that.stages,_that.current,_that.ended);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TrackerStage> stages,  String? current,  String? ended)  $default,) {final _that = this;
switch (_that) {
case _Tracker():
return $default(_that.stages,_that.current,_that.ended);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TrackerStage> stages,  String? current,  String? ended)?  $default,) {final _that = this;
switch (_that) {
case _Tracker() when $default != null:
return $default(_that.stages,_that.current,_that.ended);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Tracker extends Tracker {
  const _Tracker({ List<TrackerStage> stages = const <TrackerStage>[], this.current, this.ended}): _stages = stages,super._();
  factory _Tracker.fromJson(Map<String, dynamic> json) => _$TrackerFromJson(json);

 final  List<TrackerStage> _stages;
@override@JsonKey() List<TrackerStage> get stages {
  if (_stages is EqualUnmodifiableListView) return _stages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stages);
}

@override final  String? current;
@override final  String? ended;

/// Create a copy of Tracker
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackerCopyWith<_Tracker> get copyWith => __$TrackerCopyWithImpl<_Tracker>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackerToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tracker&&const DeepCollectionEquality().equals(other.stages, _stages)&&(identical(other.current, current) || other.current == current)&&(identical(other.ended, ended) || other.ended == ended));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_stages),current,ended);
}

@override
String toString() {
    return 'Tracker(stages: $stages, current: $current, ended: $ended)';
}


}

/// @nodoc
abstract mixin class _$TrackerCopyWith<$Res> implements $TrackerCopyWith<$Res> {
  factory _$TrackerCopyWith(_Tracker value, $Res Function(_Tracker) _then) = __$TrackerCopyWithImpl;
@override @useResult
$Res call({
 List<TrackerStage> stages, String? current, String? ended
});




}
/// @nodoc
class __$TrackerCopyWithImpl<$Res>
    implements _$TrackerCopyWith<$Res> {
  __$TrackerCopyWithImpl(this._self, this._then);

  final _Tracker _self;
  final $Res Function(_Tracker) _then;

/// Create a copy of Tracker
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stages = null,Object? current = freezed,Object? ended = freezed,}) {
  return _then(_Tracker(
stages: null == stages ? _self._stages : stages // ignore: cast_nullable_to_non_nullable
as List<TrackerStage>,current: freezed == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as String?,ended: freezed == ended ? _self.ended : ended // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AppSummary {

 int get id; String? get reference;@JsonKey(name: 'full_name') String get fullName;@JsonKey(unknownEnumValue: Level.as_) Level get level;@JsonKey(unknownEnumValue: AppStatus.unknown) AppStatus get status;@JsonKey(name: 'status_label') String get statusLabel;@JsonKey(name: 'form_step') int get formStep;@JsonKey(name: 'updated_at') String get updatedAt; Tracker get tracker;
/// Create a copy of AppSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSummaryCopyWith<AppSummary> get copyWith => _$AppSummaryCopyWithImpl<AppSummary>(this as AppSummary, _$identity);

  /// Serializes this AppSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AppSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSummary&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.reference, _this.reference) || other.reference == _this.reference)&&(identical(other.fullName, _this.fullName) || other.fullName == _this.fullName)&&(identical(other.level, _this.level) || other.level == _this.level)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.statusLabel, _this.statusLabel) || other.statusLabel == _this.statusLabel)&&(identical(other.formStep, _this.formStep) || other.formStep == _this.formStep)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.tracker, _this.tracker) || other.tracker == _this.tracker));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AppSummary;
  return Object.hash(runtimeType,_this.id,_this.reference,_this.fullName,_this.level,_this.status,_this.statusLabel,_this.formStep,_this.updatedAt,_this.tracker);
}

@override
String toString() {
  final _this = this as AppSummary;
  return 'AppSummary(id: ${_this.id}, reference: ${_this.reference}, fullName: ${_this.fullName}, level: ${_this.level}, status: ${_this.status}, statusLabel: ${_this.statusLabel}, formStep: ${_this.formStep}, updatedAt: ${_this.updatedAt}, tracker: ${_this.tracker})';
}


}

/// @nodoc
abstract mixin class $AppSummaryCopyWith<$Res>  {
  factory $AppSummaryCopyWith(AppSummary value, $Res Function(AppSummary) _then) = _$AppSummaryCopyWithImpl;
@useResult
$Res call({
 int id, String? reference,@JsonKey(name: 'full_name') String fullName,@JsonKey(unknownEnumValue: Level.as_) Level level,@JsonKey(unknownEnumValue: AppStatus.unknown) AppStatus status,@JsonKey(name: 'status_label') String statusLabel,@JsonKey(name: 'form_step') int formStep,@JsonKey(name: 'updated_at') String updatedAt, Tracker tracker
});


$TrackerCopyWith<$Res> get tracker;

}
/// @nodoc
class _$AppSummaryCopyWithImpl<$Res>
    implements $AppSummaryCopyWith<$Res> {
  _$AppSummaryCopyWithImpl(this._self, this._then);

  final AppSummary _self;
  final $Res Function(AppSummary) _then;

/// Create a copy of AppSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? reference = freezed,Object? fullName = null,Object? level = null,Object? status = null,Object? statusLabel = null,Object? formStep = null,Object? updatedAt = null,Object? tracker = null,}) {
  return _then(AppSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,reference: freezed == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String?,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as Level,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AppStatus,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,formStep: null == formStep ? _self.formStep : formStep // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,tracker: null == tracker ? _self.tracker : tracker // ignore: cast_nullable_to_non_nullable
as Tracker,
  ));
}
/// Create a copy of AppSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrackerCopyWith<$Res> get tracker {
  
  return $TrackerCopyWith<$Res>(_self.tracker, (value) {
    return _then(_self.copyWith(tracker: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppSummary].
extension AppSummaryPatterns on AppSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSummary value)  $default,){
final _that = this;
switch (_that) {
case _AppSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSummary value)?  $default,){
final _that = this;
switch (_that) {
case _AppSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? reference, @JsonKey(name: 'full_name')  String fullName, @JsonKey(unknownEnumValue: Level.as_)  Level level, @JsonKey(unknownEnumValue: AppStatus.unknown)  AppStatus status, @JsonKey(name: 'status_label')  String statusLabel, @JsonKey(name: 'form_step')  int formStep, @JsonKey(name: 'updated_at')  String updatedAt,  Tracker tracker)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSummary() when $default != null:
return $default(_that.id,_that.reference,_that.fullName,_that.level,_that.status,_that.statusLabel,_that.formStep,_that.updatedAt,_that.tracker);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? reference, @JsonKey(name: 'full_name')  String fullName, @JsonKey(unknownEnumValue: Level.as_)  Level level, @JsonKey(unknownEnumValue: AppStatus.unknown)  AppStatus status, @JsonKey(name: 'status_label')  String statusLabel, @JsonKey(name: 'form_step')  int formStep, @JsonKey(name: 'updated_at')  String updatedAt,  Tracker tracker)  $default,) {final _that = this;
switch (_that) {
case _AppSummary():
return $default(_that.id,_that.reference,_that.fullName,_that.level,_that.status,_that.statusLabel,_that.formStep,_that.updatedAt,_that.tracker);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? reference, @JsonKey(name: 'full_name')  String fullName, @JsonKey(unknownEnumValue: Level.as_)  Level level, @JsonKey(unknownEnumValue: AppStatus.unknown)  AppStatus status, @JsonKey(name: 'status_label')  String statusLabel, @JsonKey(name: 'form_step')  int formStep, @JsonKey(name: 'updated_at')  String updatedAt,  Tracker tracker)?  $default,) {final _that = this;
switch (_that) {
case _AppSummary() when $default != null:
return $default(_that.id,_that.reference,_that.fullName,_that.level,_that.status,_that.statusLabel,_that.formStep,_that.updatedAt,_that.tracker);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppSummary extends AppSummary {
  const _AppSummary({required this.id, this.reference, @JsonKey(name: 'full_name') this.fullName = '', @JsonKey(unknownEnumValue: Level.as_) this.level = Level.as_, @JsonKey(unknownEnumValue: AppStatus.unknown) this.status = AppStatus.draft, @JsonKey(name: 'status_label') this.statusLabel = '', @JsonKey(name: 'form_step') this.formStep = 1, @JsonKey(name: 'updated_at') this.updatedAt = '', this.tracker = const Tracker()}): super._();
  factory _AppSummary.fromJson(Map<String, dynamic> json) => _$AppSummaryFromJson(json);

@override final  int id;
@override final  String? reference;
@override@JsonKey(name: 'full_name') final  String fullName;
@override@JsonKey(unknownEnumValue: Level.as_) final  Level level;
@override@JsonKey(unknownEnumValue: AppStatus.unknown) final  AppStatus status;
@override@JsonKey(name: 'status_label') final  String statusLabel;
@override@JsonKey(name: 'form_step') final  int formStep;
@override@JsonKey(name: 'updated_at') final  String updatedAt;
@override@JsonKey() final  Tracker tracker;

/// Create a copy of AppSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSummaryCopyWith<_AppSummary> get copyWith => __$AppSummaryCopyWithImpl<_AppSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.level, level) || other.level == level)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.formStep, formStep) || other.formStep == formStep)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.tracker, tracker) || other.tracker == tracker));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,reference,fullName,level,status,statusLabel,formStep,updatedAt,tracker);
}

@override
String toString() {
    return 'AppSummary(id: $id, reference: $reference, fullName: $fullName, level: $level, status: $status, statusLabel: $statusLabel, formStep: $formStep, updatedAt: $updatedAt, tracker: $tracker)';
}


}

/// @nodoc
abstract mixin class _$AppSummaryCopyWith<$Res> implements $AppSummaryCopyWith<$Res> {
  factory _$AppSummaryCopyWith(_AppSummary value, $Res Function(_AppSummary) _then) = __$AppSummaryCopyWithImpl;
@override @useResult
$Res call({
 int id, String? reference,@JsonKey(name: 'full_name') String fullName,@JsonKey(unknownEnumValue: Level.as_) Level level,@JsonKey(unknownEnumValue: AppStatus.unknown) AppStatus status,@JsonKey(name: 'status_label') String statusLabel,@JsonKey(name: 'form_step') int formStep,@JsonKey(name: 'updated_at') String updatedAt, Tracker tracker
});


@override $TrackerCopyWith<$Res> get tracker;

}
/// @nodoc
class __$AppSummaryCopyWithImpl<$Res>
    implements _$AppSummaryCopyWith<$Res> {
  __$AppSummaryCopyWithImpl(this._self, this._then);

  final _AppSummary _self;
  final $Res Function(_AppSummary) _then;

/// Create a copy of AppSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reference = freezed,Object? fullName = null,Object? level = null,Object? status = null,Object? statusLabel = null,Object? formStep = null,Object? updatedAt = null,Object? tracker = null,}) {
  return _then(_AppSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,reference: freezed == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String?,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as Level,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AppStatus,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,formStep: null == formStep ? _self.formStep : formStep // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,tracker: null == tracker ? _self.tracker : tracker // ignore: cast_nullable_to_non_nullable
as Tracker,
  ));
}

/// Create a copy of AppSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrackerCopyWith<$Res> get tracker {
  
  return $TrackerCopyWith<$Res>(_self.tracker, (value) {
    return _then(_self.copyWith(tracker: value));
  });
}
}

// dart format on
