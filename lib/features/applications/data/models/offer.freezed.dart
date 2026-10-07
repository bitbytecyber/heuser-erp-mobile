// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OfferLine {

 String get component; String get label; String get amount; String get recurrence;@JsonKey(name: 'normal_percent') String get normalPercent;@JsonKey(name: 'after_normal') String get afterNormal;@JsonKey(name: 'special_percent') String get specialPercent; String get net; String get saving;
/// Create a copy of OfferLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfferLineCopyWith<OfferLine> get copyWith => _$OfferLineCopyWithImpl<OfferLine>(this as OfferLine, _$identity);

  /// Serializes this OfferLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OfferLine;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferLine&&(identical(other.component, _this.component) || other.component == _this.component)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.recurrence, _this.recurrence) || other.recurrence == _this.recurrence)&&(identical(other.normalPercent, _this.normalPercent) || other.normalPercent == _this.normalPercent)&&(identical(other.afterNormal, _this.afterNormal) || other.afterNormal == _this.afterNormal)&&(identical(other.specialPercent, _this.specialPercent) || other.specialPercent == _this.specialPercent)&&(identical(other.net, _this.net) || other.net == _this.net)&&(identical(other.saving, _this.saving) || other.saving == _this.saving));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OfferLine;
  return Object.hash(runtimeType,_this.component,_this.label,_this.amount,_this.recurrence,_this.normalPercent,_this.afterNormal,_this.specialPercent,_this.net,_this.saving);
}

@override
String toString() {
  final _this = this as OfferLine;
  return 'OfferLine(component: ${_this.component}, label: ${_this.label}, amount: ${_this.amount}, recurrence: ${_this.recurrence}, normalPercent: ${_this.normalPercent}, afterNormal: ${_this.afterNormal}, specialPercent: ${_this.specialPercent}, net: ${_this.net}, saving: ${_this.saving})';
}


}

/// @nodoc
abstract mixin class $OfferLineCopyWith<$Res>  {
  factory $OfferLineCopyWith(OfferLine value, $Res Function(OfferLine) _then) = _$OfferLineCopyWithImpl;
@useResult
$Res call({
 String component, String label, String amount, String recurrence,@JsonKey(name: 'normal_percent') String normalPercent,@JsonKey(name: 'after_normal') String afterNormal,@JsonKey(name: 'special_percent') String specialPercent, String net, String saving
});




}
/// @nodoc
class _$OfferLineCopyWithImpl<$Res>
    implements $OfferLineCopyWith<$Res> {
  _$OfferLineCopyWithImpl(this._self, this._then);

  final OfferLine _self;
  final $Res Function(OfferLine) _then;

/// Create a copy of OfferLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? component = null,Object? label = null,Object? amount = null,Object? recurrence = null,Object? normalPercent = null,Object? afterNormal = null,Object? specialPercent = null,Object? net = null,Object? saving = null,}) {
  return _then(OfferLine(
component: null == component ? _self.component : component // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,recurrence: null == recurrence ? _self.recurrence : recurrence // ignore: cast_nullable_to_non_nullable
as String,normalPercent: null == normalPercent ? _self.normalPercent : normalPercent // ignore: cast_nullable_to_non_nullable
as String,afterNormal: null == afterNormal ? _self.afterNormal : afterNormal // ignore: cast_nullable_to_non_nullable
as String,specialPercent: null == specialPercent ? _self.specialPercent : specialPercent // ignore: cast_nullable_to_non_nullable
as String,net: null == net ? _self.net : net // ignore: cast_nullable_to_non_nullable
as String,saving: null == saving ? _self.saving : saving // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OfferLine].
extension OfferLinePatterns on OfferLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfferLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfferLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfferLine value)  $default,){
final _that = this;
switch (_that) {
case _OfferLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfferLine value)?  $default,){
final _that = this;
switch (_that) {
case _OfferLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String component,  String label,  String amount,  String recurrence, @JsonKey(name: 'normal_percent')  String normalPercent, @JsonKey(name: 'after_normal')  String afterNormal, @JsonKey(name: 'special_percent')  String specialPercent,  String net,  String saving)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfferLine() when $default != null:
return $default(_that.component,_that.label,_that.amount,_that.recurrence,_that.normalPercent,_that.afterNormal,_that.specialPercent,_that.net,_that.saving);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String component,  String label,  String amount,  String recurrence, @JsonKey(name: 'normal_percent')  String normalPercent, @JsonKey(name: 'after_normal')  String afterNormal, @JsonKey(name: 'special_percent')  String specialPercent,  String net,  String saving)  $default,) {final _that = this;
switch (_that) {
case _OfferLine():
return $default(_that.component,_that.label,_that.amount,_that.recurrence,_that.normalPercent,_that.afterNormal,_that.specialPercent,_that.net,_that.saving);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String component,  String label,  String amount,  String recurrence, @JsonKey(name: 'normal_percent')  String normalPercent, @JsonKey(name: 'after_normal')  String afterNormal, @JsonKey(name: 'special_percent')  String specialPercent,  String net,  String saving)?  $default,) {final _that = this;
switch (_that) {
case _OfferLine() when $default != null:
return $default(_that.component,_that.label,_that.amount,_that.recurrence,_that.normalPercent,_that.afterNormal,_that.specialPercent,_that.net,_that.saving);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OfferLine implements OfferLine {
  const _OfferLine({this.component = '', this.label = '', this.amount = '0', this.recurrence = 'one_time', @JsonKey(name: 'normal_percent') this.normalPercent = '0', @JsonKey(name: 'after_normal') this.afterNormal = '0', @JsonKey(name: 'special_percent') this.specialPercent = '0', this.net = '0', this.saving = '0'});
  factory _OfferLine.fromJson(Map<String, dynamic> json) => _$OfferLineFromJson(json);

@override@JsonKey() final  String component;
@override@JsonKey() final  String label;
@override@JsonKey() final  String amount;
@override@JsonKey() final  String recurrence;
@override@JsonKey(name: 'normal_percent') final  String normalPercent;
@override@JsonKey(name: 'after_normal') final  String afterNormal;
@override@JsonKey(name: 'special_percent') final  String specialPercent;
@override@JsonKey() final  String net;
@override@JsonKey() final  String saving;

/// Create a copy of OfferLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfferLineCopyWith<_OfferLine> get copyWith => __$OfferLineCopyWithImpl<_OfferLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfferLineToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfferLine&&(identical(other.component, component) || other.component == component)&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.recurrence, recurrence) || other.recurrence == recurrence)&&(identical(other.normalPercent, normalPercent) || other.normalPercent == normalPercent)&&(identical(other.afterNormal, afterNormal) || other.afterNormal == afterNormal)&&(identical(other.specialPercent, specialPercent) || other.specialPercent == specialPercent)&&(identical(other.net, net) || other.net == net)&&(identical(other.saving, saving) || other.saving == saving));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,component,label,amount,recurrence,normalPercent,afterNormal,specialPercent,net,saving);
}

@override
String toString() {
    return 'OfferLine(component: $component, label: $label, amount: $amount, recurrence: $recurrence, normalPercent: $normalPercent, afterNormal: $afterNormal, specialPercent: $specialPercent, net: $net, saving: $saving)';
}


}

/// @nodoc
abstract mixin class _$OfferLineCopyWith<$Res> implements $OfferLineCopyWith<$Res> {
  factory _$OfferLineCopyWith(_OfferLine value, $Res Function(_OfferLine) _then) = __$OfferLineCopyWithImpl;
@override @useResult
$Res call({
 String component, String label, String amount, String recurrence,@JsonKey(name: 'normal_percent') String normalPercent,@JsonKey(name: 'after_normal') String afterNormal,@JsonKey(name: 'special_percent') String specialPercent, String net, String saving
});




}
/// @nodoc
class __$OfferLineCopyWithImpl<$Res>
    implements _$OfferLineCopyWith<$Res> {
  __$OfferLineCopyWithImpl(this._self, this._then);

  final _OfferLine _self;
  final $Res Function(_OfferLine) _then;

/// Create a copy of OfferLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? component = null,Object? label = null,Object? amount = null,Object? recurrence = null,Object? normalPercent = null,Object? afterNormal = null,Object? specialPercent = null,Object? net = null,Object? saving = null,}) {
  return _then(_OfferLine(
component: null == component ? _self.component : component // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,recurrence: null == recurrence ? _self.recurrence : recurrence // ignore: cast_nullable_to_non_nullable
as String,normalPercent: null == normalPercent ? _self.normalPercent : normalPercent // ignore: cast_nullable_to_non_nullable
as String,afterNormal: null == afterNormal ? _self.afterNormal : afterNormal // ignore: cast_nullable_to_non_nullable
as String,specialPercent: null == specialPercent ? _self.specialPercent : specialPercent // ignore: cast_nullable_to_non_nullable
as String,net: null == net ? _self.net : net // ignore: cast_nullable_to_non_nullable
as String,saving: null == saving ? _self.saving : saving // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$OfferCalculation {

 List<OfferLine> get lines;@JsonKey(name: 'due_now') String get dueNow; String get monthly;@JsonKey(name: 'tuition_months') int? get tuitionMonths;@JsonKey(name: 'tuition_due') String? get tuitionDue;@JsonKey(name: 'tuition_period') String? get tuitionPeriod;
/// Create a copy of OfferCalculation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfferCalculationCopyWith<OfferCalculation> get copyWith => _$OfferCalculationCopyWithImpl<OfferCalculation>(this as OfferCalculation, _$identity);

  /// Serializes this OfferCalculation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OfferCalculation;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferCalculation&&const DeepCollectionEquality().equals(other.lines, _this.lines)&&(identical(other.dueNow, _this.dueNow) || other.dueNow == _this.dueNow)&&(identical(other.monthly, _this.monthly) || other.monthly == _this.monthly)&&(identical(other.tuitionMonths, _this.tuitionMonths) || other.tuitionMonths == _this.tuitionMonths)&&(identical(other.tuitionDue, _this.tuitionDue) || other.tuitionDue == _this.tuitionDue)&&(identical(other.tuitionPeriod, _this.tuitionPeriod) || other.tuitionPeriod == _this.tuitionPeriod));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OfferCalculation;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.lines),_this.dueNow,_this.monthly,_this.tuitionMonths,_this.tuitionDue,_this.tuitionPeriod);
}

@override
String toString() {
  final _this = this as OfferCalculation;
  return 'OfferCalculation(lines: ${_this.lines}, dueNow: ${_this.dueNow}, monthly: ${_this.monthly}, tuitionMonths: ${_this.tuitionMonths}, tuitionDue: ${_this.tuitionDue}, tuitionPeriod: ${_this.tuitionPeriod})';
}


}

/// @nodoc
abstract mixin class $OfferCalculationCopyWith<$Res>  {
  factory $OfferCalculationCopyWith(OfferCalculation value, $Res Function(OfferCalculation) _then) = _$OfferCalculationCopyWithImpl;
@useResult
$Res call({
 List<OfferLine> lines,@JsonKey(name: 'due_now') String dueNow, String monthly,@JsonKey(name: 'tuition_months') int? tuitionMonths,@JsonKey(name: 'tuition_due') String? tuitionDue,@JsonKey(name: 'tuition_period') String? tuitionPeriod
});




}
/// @nodoc
class _$OfferCalculationCopyWithImpl<$Res>
    implements $OfferCalculationCopyWith<$Res> {
  _$OfferCalculationCopyWithImpl(this._self, this._then);

  final OfferCalculation _self;
  final $Res Function(OfferCalculation) _then;

/// Create a copy of OfferCalculation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lines = null,Object? dueNow = null,Object? monthly = null,Object? tuitionMonths = freezed,Object? tuitionDue = freezed,Object? tuitionPeriod = freezed,}) {
  return _then(OfferCalculation(
lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<OfferLine>,dueNow: null == dueNow ? _self.dueNow : dueNow // ignore: cast_nullable_to_non_nullable
as String,monthly: null == monthly ? _self.monthly : monthly // ignore: cast_nullable_to_non_nullable
as String,tuitionMonths: freezed == tuitionMonths ? _self.tuitionMonths : tuitionMonths // ignore: cast_nullable_to_non_nullable
as int?,tuitionDue: freezed == tuitionDue ? _self.tuitionDue : tuitionDue // ignore: cast_nullable_to_non_nullable
as String?,tuitionPeriod: freezed == tuitionPeriod ? _self.tuitionPeriod : tuitionPeriod // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OfferCalculation].
extension OfferCalculationPatterns on OfferCalculation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfferCalculation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfferCalculation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfferCalculation value)  $default,){
final _that = this;
switch (_that) {
case _OfferCalculation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfferCalculation value)?  $default,){
final _that = this;
switch (_that) {
case _OfferCalculation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<OfferLine> lines, @JsonKey(name: 'due_now')  String dueNow,  String monthly, @JsonKey(name: 'tuition_months')  int? tuitionMonths, @JsonKey(name: 'tuition_due')  String? tuitionDue, @JsonKey(name: 'tuition_period')  String? tuitionPeriod)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfferCalculation() when $default != null:
return $default(_that.lines,_that.dueNow,_that.monthly,_that.tuitionMonths,_that.tuitionDue,_that.tuitionPeriod);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<OfferLine> lines, @JsonKey(name: 'due_now')  String dueNow,  String monthly, @JsonKey(name: 'tuition_months')  int? tuitionMonths, @JsonKey(name: 'tuition_due')  String? tuitionDue, @JsonKey(name: 'tuition_period')  String? tuitionPeriod)  $default,) {final _that = this;
switch (_that) {
case _OfferCalculation():
return $default(_that.lines,_that.dueNow,_that.monthly,_that.tuitionMonths,_that.tuitionDue,_that.tuitionPeriod);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<OfferLine> lines, @JsonKey(name: 'due_now')  String dueNow,  String monthly, @JsonKey(name: 'tuition_months')  int? tuitionMonths, @JsonKey(name: 'tuition_due')  String? tuitionDue, @JsonKey(name: 'tuition_period')  String? tuitionPeriod)?  $default,) {final _that = this;
switch (_that) {
case _OfferCalculation() when $default != null:
return $default(_that.lines,_that.dueNow,_that.monthly,_that.tuitionMonths,_that.tuitionDue,_that.tuitionPeriod);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OfferCalculation implements OfferCalculation {
  const _OfferCalculation({ List<OfferLine> lines = const <OfferLine>[], @JsonKey(name: 'due_now') this.dueNow = '0', this.monthly = '0', @JsonKey(name: 'tuition_months') this.tuitionMonths, @JsonKey(name: 'tuition_due') this.tuitionDue, @JsonKey(name: 'tuition_period') this.tuitionPeriod}): _lines = lines;
  factory _OfferCalculation.fromJson(Map<String, dynamic> json) => _$OfferCalculationFromJson(json);

 final  List<OfferLine> _lines;
@override@JsonKey() List<OfferLine> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

@override@JsonKey(name: 'due_now') final  String dueNow;
@override@JsonKey() final  String monthly;
@override@JsonKey(name: 'tuition_months') final  int? tuitionMonths;
@override@JsonKey(name: 'tuition_due') final  String? tuitionDue;
@override@JsonKey(name: 'tuition_period') final  String? tuitionPeriod;

/// Create a copy of OfferCalculation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfferCalculationCopyWith<_OfferCalculation> get copyWith => __$OfferCalculationCopyWithImpl<_OfferCalculation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfferCalculationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfferCalculation&&const DeepCollectionEquality().equals(other.lines, _lines)&&(identical(other.dueNow, dueNow) || other.dueNow == dueNow)&&(identical(other.monthly, monthly) || other.monthly == monthly)&&(identical(other.tuitionMonths, tuitionMonths) || other.tuitionMonths == tuitionMonths)&&(identical(other.tuitionDue, tuitionDue) || other.tuitionDue == tuitionDue)&&(identical(other.tuitionPeriod, tuitionPeriod) || other.tuitionPeriod == tuitionPeriod));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_lines),dueNow,monthly,tuitionMonths,tuitionDue,tuitionPeriod);
}

@override
String toString() {
    return 'OfferCalculation(lines: $lines, dueNow: $dueNow, monthly: $monthly, tuitionMonths: $tuitionMonths, tuitionDue: $tuitionDue, tuitionPeriod: $tuitionPeriod)';
}


}

/// @nodoc
abstract mixin class _$OfferCalculationCopyWith<$Res> implements $OfferCalculationCopyWith<$Res> {
  factory _$OfferCalculationCopyWith(_OfferCalculation value, $Res Function(_OfferCalculation) _then) = __$OfferCalculationCopyWithImpl;
@override @useResult
$Res call({
 List<OfferLine> lines,@JsonKey(name: 'due_now') String dueNow, String monthly,@JsonKey(name: 'tuition_months') int? tuitionMonths,@JsonKey(name: 'tuition_due') String? tuitionDue,@JsonKey(name: 'tuition_period') String? tuitionPeriod
});




}
/// @nodoc
class __$OfferCalculationCopyWithImpl<$Res>
    implements _$OfferCalculationCopyWith<$Res> {
  __$OfferCalculationCopyWithImpl(this._self, this._then);

  final _OfferCalculation _self;
  final $Res Function(_OfferCalculation) _then;

/// Create a copy of OfferCalculation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lines = null,Object? dueNow = null,Object? monthly = null,Object? tuitionMonths = freezed,Object? tuitionDue = freezed,Object? tuitionPeriod = freezed,}) {
  return _then(_OfferCalculation(
lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<OfferLine>,dueNow: null == dueNow ? _self.dueNow : dueNow // ignore: cast_nullable_to_non_nullable
as String,monthly: null == monthly ? _self.monthly : monthly // ignore: cast_nullable_to_non_nullable
as String,tuitionMonths: freezed == tuitionMonths ? _self.tuitionMonths : tuitionMonths // ignore: cast_nullable_to_non_nullable
as int?,tuitionDue: freezed == tuitionDue ? _self.tuitionDue : tuitionDue // ignore: cast_nullable_to_non_nullable
as String?,tuitionPeriod: freezed == tuitionPeriod ? _self.tuitionPeriod : tuitionPeriod // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OfferSubject {

 int get course;@JsonKey(name: 'course_name') String get courseName; int get teacher;@JsonKey(name: 'teacher_name') String get teacherName;
/// Create a copy of OfferSubject
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfferSubjectCopyWith<OfferSubject> get copyWith => _$OfferSubjectCopyWithImpl<OfferSubject>(this as OfferSubject, _$identity);

  /// Serializes this OfferSubject to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OfferSubject;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferSubject&&(identical(other.course, _this.course) || other.course == _this.course)&&(identical(other.courseName, _this.courseName) || other.courseName == _this.courseName)&&(identical(other.teacher, _this.teacher) || other.teacher == _this.teacher)&&(identical(other.teacherName, _this.teacherName) || other.teacherName == _this.teacherName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OfferSubject;
  return Object.hash(runtimeType,_this.course,_this.courseName,_this.teacher,_this.teacherName);
}

@override
String toString() {
  final _this = this as OfferSubject;
  return 'OfferSubject(course: ${_this.course}, courseName: ${_this.courseName}, teacher: ${_this.teacher}, teacherName: ${_this.teacherName})';
}


}

/// @nodoc
abstract mixin class $OfferSubjectCopyWith<$Res>  {
  factory $OfferSubjectCopyWith(OfferSubject value, $Res Function(OfferSubject) _then) = _$OfferSubjectCopyWithImpl;
@useResult
$Res call({
 int course,@JsonKey(name: 'course_name') String courseName, int teacher,@JsonKey(name: 'teacher_name') String teacherName
});




}
/// @nodoc
class _$OfferSubjectCopyWithImpl<$Res>
    implements $OfferSubjectCopyWith<$Res> {
  _$OfferSubjectCopyWithImpl(this._self, this._then);

  final OfferSubject _self;
  final $Res Function(OfferSubject) _then;

/// Create a copy of OfferSubject
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? course = null,Object? courseName = null,Object? teacher = null,Object? teacherName = null,}) {
  return _then(OfferSubject(
course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as int,courseName: null == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String,teacher: null == teacher ? _self.teacher : teacher // ignore: cast_nullable_to_non_nullable
as int,teacherName: null == teacherName ? _self.teacherName : teacherName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OfferSubject].
extension OfferSubjectPatterns on OfferSubject {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfferSubject value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfferSubject() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfferSubject value)  $default,){
final _that = this;
switch (_that) {
case _OfferSubject():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfferSubject value)?  $default,){
final _that = this;
switch (_that) {
case _OfferSubject() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int course, @JsonKey(name: 'course_name')  String courseName,  int teacher, @JsonKey(name: 'teacher_name')  String teacherName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfferSubject() when $default != null:
return $default(_that.course,_that.courseName,_that.teacher,_that.teacherName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int course, @JsonKey(name: 'course_name')  String courseName,  int teacher, @JsonKey(name: 'teacher_name')  String teacherName)  $default,) {final _that = this;
switch (_that) {
case _OfferSubject():
return $default(_that.course,_that.courseName,_that.teacher,_that.teacherName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int course, @JsonKey(name: 'course_name')  String courseName,  int teacher, @JsonKey(name: 'teacher_name')  String teacherName)?  $default,) {final _that = this;
switch (_that) {
case _OfferSubject() when $default != null:
return $default(_that.course,_that.courseName,_that.teacher,_that.teacherName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OfferSubject implements OfferSubject {
  const _OfferSubject({required this.course, @JsonKey(name: 'course_name') this.courseName = '', this.teacher = 0, @JsonKey(name: 'teacher_name') this.teacherName = ''});
  factory _OfferSubject.fromJson(Map<String, dynamic> json) => _$OfferSubjectFromJson(json);

@override final  int course;
@override@JsonKey(name: 'course_name') final  String courseName;
@override@JsonKey() final  int teacher;
@override@JsonKey(name: 'teacher_name') final  String teacherName;

/// Create a copy of OfferSubject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfferSubjectCopyWith<_OfferSubject> get copyWith => __$OfferSubjectCopyWithImpl<_OfferSubject>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfferSubjectToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfferSubject&&(identical(other.course, course) || other.course == course)&&(identical(other.courseName, courseName) || other.courseName == courseName)&&(identical(other.teacher, teacher) || other.teacher == teacher)&&(identical(other.teacherName, teacherName) || other.teacherName == teacherName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,course,courseName,teacher,teacherName);
}

@override
String toString() {
    return 'OfferSubject(course: $course, courseName: $courseName, teacher: $teacher, teacherName: $teacherName)';
}


}

/// @nodoc
abstract mixin class _$OfferSubjectCopyWith<$Res> implements $OfferSubjectCopyWith<$Res> {
  factory _$OfferSubjectCopyWith(_OfferSubject value, $Res Function(_OfferSubject) _then) = __$OfferSubjectCopyWithImpl;
@override @useResult
$Res call({
 int course,@JsonKey(name: 'course_name') String courseName, int teacher,@JsonKey(name: 'teacher_name') String teacherName
});




}
/// @nodoc
class __$OfferSubjectCopyWithImpl<$Res>
    implements _$OfferSubjectCopyWith<$Res> {
  __$OfferSubjectCopyWithImpl(this._self, this._then);

  final _OfferSubject _self;
  final $Res Function(_OfferSubject) _then;

/// Create a copy of OfferSubject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? course = null,Object? courseName = null,Object? teacher = null,Object? teacherName = null,}) {
  return _then(_OfferSubject(
course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as int,courseName: null == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String,teacher: null == teacher ? _self.teacher : teacher // ignore: cast_nullable_to_non_nullable
as int,teacherName: null == teacherName ? _self.teacherName : teacherName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$OfferScholarship {

 int get type; String get name; String get percent; String get reason;@JsonKey(name: 'applied_on_remainder') bool get appliedOnRemainder;
/// Create a copy of OfferScholarship
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfferScholarshipCopyWith<OfferScholarship> get copyWith => _$OfferScholarshipCopyWithImpl<OfferScholarship>(this as OfferScholarship, _$identity);

  /// Serializes this OfferScholarship to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OfferScholarship;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferScholarship&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.percent, _this.percent) || other.percent == _this.percent)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.appliedOnRemainder, _this.appliedOnRemainder) || other.appliedOnRemainder == _this.appliedOnRemainder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OfferScholarship;
  return Object.hash(runtimeType,_this.type,_this.name,_this.percent,_this.reason,_this.appliedOnRemainder);
}

@override
String toString() {
  final _this = this as OfferScholarship;
  return 'OfferScholarship(type: ${_this.type}, name: ${_this.name}, percent: ${_this.percent}, reason: ${_this.reason}, appliedOnRemainder: ${_this.appliedOnRemainder})';
}


}

/// @nodoc
abstract mixin class $OfferScholarshipCopyWith<$Res>  {
  factory $OfferScholarshipCopyWith(OfferScholarship value, $Res Function(OfferScholarship) _then) = _$OfferScholarshipCopyWithImpl;
@useResult
$Res call({
 int type, String name, String percent, String reason,@JsonKey(name: 'applied_on_remainder') bool appliedOnRemainder
});




}
/// @nodoc
class _$OfferScholarshipCopyWithImpl<$Res>
    implements $OfferScholarshipCopyWith<$Res> {
  _$OfferScholarshipCopyWithImpl(this._self, this._then);

  final OfferScholarship _self;
  final $Res Function(OfferScholarship) _then;

/// Create a copy of OfferScholarship
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? name = null,Object? percent = null,Object? reason = null,Object? appliedOnRemainder = null,}) {
  return _then(OfferScholarship(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,appliedOnRemainder: null == appliedOnRemainder ? _self.appliedOnRemainder : appliedOnRemainder // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OfferScholarship].
extension OfferScholarshipPatterns on OfferScholarship {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfferScholarship value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfferScholarship() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfferScholarship value)  $default,){
final _that = this;
switch (_that) {
case _OfferScholarship():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfferScholarship value)?  $default,){
final _that = this;
switch (_that) {
case _OfferScholarship() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int type,  String name,  String percent,  String reason, @JsonKey(name: 'applied_on_remainder')  bool appliedOnRemainder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfferScholarship() when $default != null:
return $default(_that.type,_that.name,_that.percent,_that.reason,_that.appliedOnRemainder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int type,  String name,  String percent,  String reason, @JsonKey(name: 'applied_on_remainder')  bool appliedOnRemainder)  $default,) {final _that = this;
switch (_that) {
case _OfferScholarship():
return $default(_that.type,_that.name,_that.percent,_that.reason,_that.appliedOnRemainder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int type,  String name,  String percent,  String reason, @JsonKey(name: 'applied_on_remainder')  bool appliedOnRemainder)?  $default,) {final _that = this;
switch (_that) {
case _OfferScholarship() when $default != null:
return $default(_that.type,_that.name,_that.percent,_that.reason,_that.appliedOnRemainder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OfferScholarship implements OfferScholarship {
  const _OfferScholarship({this.type = 0, this.name = '', this.percent = '0', this.reason = '', @JsonKey(name: 'applied_on_remainder') this.appliedOnRemainder = false});
  factory _OfferScholarship.fromJson(Map<String, dynamic> json) => _$OfferScholarshipFromJson(json);

@override@JsonKey() final  int type;
@override@JsonKey() final  String name;
@override@JsonKey() final  String percent;
@override@JsonKey() final  String reason;
@override@JsonKey(name: 'applied_on_remainder') final  bool appliedOnRemainder;

/// Create a copy of OfferScholarship
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfferScholarshipCopyWith<_OfferScholarship> get copyWith => __$OfferScholarshipCopyWithImpl<_OfferScholarship>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfferScholarshipToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfferScholarship&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.appliedOnRemainder, appliedOnRemainder) || other.appliedOnRemainder == appliedOnRemainder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,name,percent,reason,appliedOnRemainder);
}

@override
String toString() {
    return 'OfferScholarship(type: $type, name: $name, percent: $percent, reason: $reason, appliedOnRemainder: $appliedOnRemainder)';
}


}

/// @nodoc
abstract mixin class _$OfferScholarshipCopyWith<$Res> implements $OfferScholarshipCopyWith<$Res> {
  factory _$OfferScholarshipCopyWith(_OfferScholarship value, $Res Function(_OfferScholarship) _then) = __$OfferScholarshipCopyWithImpl;
@override @useResult
$Res call({
 int type, String name, String percent, String reason,@JsonKey(name: 'applied_on_remainder') bool appliedOnRemainder
});




}
/// @nodoc
class __$OfferScholarshipCopyWithImpl<$Res>
    implements _$OfferScholarshipCopyWith<$Res> {
  __$OfferScholarshipCopyWithImpl(this._self, this._then);

  final _OfferScholarship _self;
  final $Res Function(_OfferScholarship) _then;

/// Create a copy of OfferScholarship
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? name = null,Object? percent = null,Object? reason = null,Object? appliedOnRemainder = null,}) {
  return _then(_OfferScholarship(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,appliedOnRemainder: null == appliedOnRemainder ? _self.appliedOnRemainder : appliedOnRemainder // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$PaymentEvidence {

 int get id; String get state; String get reason; String get method;@JsonKey(name: 'submitted_at') String get submittedAt; String? get amount;@JsonKey(name: 'family_told') bool? get familyTold; bool? get replaceable;
/// Create a copy of PaymentEvidence
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentEvidenceCopyWith<PaymentEvidence> get copyWith => _$PaymentEvidenceCopyWithImpl<PaymentEvidence>(this as PaymentEvidence, _$identity);

  /// Serializes this PaymentEvidence to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PaymentEvidence;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentEvidence&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.state, _this.state) || other.state == _this.state)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.method, _this.method) || other.method == _this.method)&&(identical(other.submittedAt, _this.submittedAt) || other.submittedAt == _this.submittedAt)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.familyTold, _this.familyTold) || other.familyTold == _this.familyTold)&&(identical(other.replaceable, _this.replaceable) || other.replaceable == _this.replaceable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PaymentEvidence;
  return Object.hash(runtimeType,_this.id,_this.state,_this.reason,_this.method,_this.submittedAt,_this.amount,_this.familyTold,_this.replaceable);
}

@override
String toString() {
  final _this = this as PaymentEvidence;
  return 'PaymentEvidence(id: ${_this.id}, state: ${_this.state}, reason: ${_this.reason}, method: ${_this.method}, submittedAt: ${_this.submittedAt}, amount: ${_this.amount}, familyTold: ${_this.familyTold}, replaceable: ${_this.replaceable})';
}


}

/// @nodoc
abstract mixin class $PaymentEvidenceCopyWith<$Res>  {
  factory $PaymentEvidenceCopyWith(PaymentEvidence value, $Res Function(PaymentEvidence) _then) = _$PaymentEvidenceCopyWithImpl;
@useResult
$Res call({
 int id, String state, String reason, String method,@JsonKey(name: 'submitted_at') String submittedAt, String? amount,@JsonKey(name: 'family_told') bool? familyTold, bool? replaceable
});




}
/// @nodoc
class _$PaymentEvidenceCopyWithImpl<$Res>
    implements $PaymentEvidenceCopyWith<$Res> {
  _$PaymentEvidenceCopyWithImpl(this._self, this._then);

  final PaymentEvidence _self;
  final $Res Function(PaymentEvidence) _then;

/// Create a copy of PaymentEvidence
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? state = null,Object? reason = null,Object? method = null,Object? submittedAt = null,Object? amount = freezed,Object? familyTold = freezed,Object? replaceable = freezed,}) {
  return _then(PaymentEvidence(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,submittedAt: null == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as String,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String?,familyTold: freezed == familyTold ? _self.familyTold : familyTold // ignore: cast_nullable_to_non_nullable
as bool?,replaceable: freezed == replaceable ? _self.replaceable : replaceable // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentEvidence].
extension PaymentEvidencePatterns on PaymentEvidence {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentEvidence value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentEvidence() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentEvidence value)  $default,){
final _that = this;
switch (_that) {
case _PaymentEvidence():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentEvidence value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentEvidence() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String state,  String reason,  String method, @JsonKey(name: 'submitted_at')  String submittedAt,  String? amount, @JsonKey(name: 'family_told')  bool? familyTold,  bool? replaceable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentEvidence() when $default != null:
return $default(_that.id,_that.state,_that.reason,_that.method,_that.submittedAt,_that.amount,_that.familyTold,_that.replaceable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String state,  String reason,  String method, @JsonKey(name: 'submitted_at')  String submittedAt,  String? amount, @JsonKey(name: 'family_told')  bool? familyTold,  bool? replaceable)  $default,) {final _that = this;
switch (_that) {
case _PaymentEvidence():
return $default(_that.id,_that.state,_that.reason,_that.method,_that.submittedAt,_that.amount,_that.familyTold,_that.replaceable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String state,  String reason,  String method, @JsonKey(name: 'submitted_at')  String submittedAt,  String? amount, @JsonKey(name: 'family_told')  bool? familyTold,  bool? replaceable)?  $default,) {final _that = this;
switch (_that) {
case _PaymentEvidence() when $default != null:
return $default(_that.id,_that.state,_that.reason,_that.method,_that.submittedAt,_that.amount,_that.familyTold,_that.replaceable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentEvidence implements PaymentEvidence {
  const _PaymentEvidence({required this.id, this.state = 'pending', this.reason = '', this.method = '', @JsonKey(name: 'submitted_at') this.submittedAt = '', this.amount, @JsonKey(name: 'family_told') this.familyTold, this.replaceable});
  factory _PaymentEvidence.fromJson(Map<String, dynamic> json) => _$PaymentEvidenceFromJson(json);

@override final  int id;
@override@JsonKey() final  String state;
@override@JsonKey() final  String reason;
@override@JsonKey() final  String method;
@override@JsonKey(name: 'submitted_at') final  String submittedAt;
@override final  String? amount;
@override@JsonKey(name: 'family_told') final  bool? familyTold;
@override final  bool? replaceable;

/// Create a copy of PaymentEvidence
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentEvidenceCopyWith<_PaymentEvidence> get copyWith => __$PaymentEvidenceCopyWithImpl<_PaymentEvidence>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentEvidenceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentEvidence&&(identical(other.id, id) || other.id == id)&&(identical(other.state, state) || other.state == state)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.method, method) || other.method == method)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.familyTold, familyTold) || other.familyTold == familyTold)&&(identical(other.replaceable, replaceable) || other.replaceable == replaceable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,state,reason,method,submittedAt,amount,familyTold,replaceable);
}

@override
String toString() {
    return 'PaymentEvidence(id: $id, state: $state, reason: $reason, method: $method, submittedAt: $submittedAt, amount: $amount, familyTold: $familyTold, replaceable: $replaceable)';
}


}

/// @nodoc
abstract mixin class _$PaymentEvidenceCopyWith<$Res> implements $PaymentEvidenceCopyWith<$Res> {
  factory _$PaymentEvidenceCopyWith(_PaymentEvidence value, $Res Function(_PaymentEvidence) _then) = __$PaymentEvidenceCopyWithImpl;
@override @useResult
$Res call({
 int id, String state, String reason, String method,@JsonKey(name: 'submitted_at') String submittedAt, String? amount,@JsonKey(name: 'family_told') bool? familyTold, bool? replaceable
});




}
/// @nodoc
class __$PaymentEvidenceCopyWithImpl<$Res>
    implements _$PaymentEvidenceCopyWith<$Res> {
  __$PaymentEvidenceCopyWithImpl(this._self, this._then);

  final _PaymentEvidence _self;
  final $Res Function(_PaymentEvidence) _then;

/// Create a copy of PaymentEvidence
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? state = null,Object? reason = null,Object? method = null,Object? submittedAt = null,Object? amount = freezed,Object? familyTold = freezed,Object? replaceable = freezed,}) {
  return _then(_PaymentEvidence(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,submittedAt: null == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as String,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String?,familyTold: freezed == familyTold ? _self.familyTold : familyTold // ignore: cast_nullable_to_non_nullable
as bool?,replaceable: freezed == replaceable ? _self.replaceable : replaceable // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$Instalment {

 int get id; int get sequence; String get kind; String get amount;@JsonKey(name: 'due_date') String? get dueDate;@JsonKey(name: 'unlocks_enrollment') bool get unlocksEnrollment; bool get paid;@JsonKey(name: 'paid_amount') String get paidAmount; String get remaining;@JsonKey(name: 'short_accepted') bool get shortAccepted; List<PaymentEvidence> get evidence;
/// Create a copy of Instalment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InstalmentCopyWith<Instalment> get copyWith => _$InstalmentCopyWithImpl<Instalment>(this as Instalment, _$identity);

  /// Serializes this Instalment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Instalment;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Instalment&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.sequence, _this.sequence) || other.sequence == _this.sequence)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.dueDate, _this.dueDate) || other.dueDate == _this.dueDate)&&(identical(other.unlocksEnrollment, _this.unlocksEnrollment) || other.unlocksEnrollment == _this.unlocksEnrollment)&&(identical(other.paid, _this.paid) || other.paid == _this.paid)&&(identical(other.paidAmount, _this.paidAmount) || other.paidAmount == _this.paidAmount)&&(identical(other.remaining, _this.remaining) || other.remaining == _this.remaining)&&(identical(other.shortAccepted, _this.shortAccepted) || other.shortAccepted == _this.shortAccepted)&&const DeepCollectionEquality().equals(other.evidence, _this.evidence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Instalment;
  return Object.hash(runtimeType,_this.id,_this.sequence,_this.kind,_this.amount,_this.dueDate,_this.unlocksEnrollment,_this.paid,_this.paidAmount,_this.remaining,_this.shortAccepted,const DeepCollectionEquality().hash(_this.evidence));
}

@override
String toString() {
  final _this = this as Instalment;
  return 'Instalment(id: ${_this.id}, sequence: ${_this.sequence}, kind: ${_this.kind}, amount: ${_this.amount}, dueDate: ${_this.dueDate}, unlocksEnrollment: ${_this.unlocksEnrollment}, paid: ${_this.paid}, paidAmount: ${_this.paidAmount}, remaining: ${_this.remaining}, shortAccepted: ${_this.shortAccepted}, evidence: ${_this.evidence})';
}


}

/// @nodoc
abstract mixin class $InstalmentCopyWith<$Res>  {
  factory $InstalmentCopyWith(Instalment value, $Res Function(Instalment) _then) = _$InstalmentCopyWithImpl;
@useResult
$Res call({
 int id, int sequence, String kind, String amount,@JsonKey(name: 'due_date') String? dueDate,@JsonKey(name: 'unlocks_enrollment') bool unlocksEnrollment, bool paid,@JsonKey(name: 'paid_amount') String paidAmount, String remaining,@JsonKey(name: 'short_accepted') bool shortAccepted, List<PaymentEvidence> evidence
});




}
/// @nodoc
class _$InstalmentCopyWithImpl<$Res>
    implements $InstalmentCopyWith<$Res> {
  _$InstalmentCopyWithImpl(this._self, this._then);

  final Instalment _self;
  final $Res Function(Instalment) _then;

/// Create a copy of Instalment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sequence = null,Object? kind = null,Object? amount = null,Object? dueDate = freezed,Object? unlocksEnrollment = null,Object? paid = null,Object? paidAmount = null,Object? remaining = null,Object? shortAccepted = null,Object? evidence = null,}) {
  return _then(Instalment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,unlocksEnrollment: null == unlocksEnrollment ? _self.unlocksEnrollment : unlocksEnrollment // ignore: cast_nullable_to_non_nullable
as bool,paid: null == paid ? _self.paid : paid // ignore: cast_nullable_to_non_nullable
as bool,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as String,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as String,shortAccepted: null == shortAccepted ? _self.shortAccepted : shortAccepted // ignore: cast_nullable_to_non_nullable
as bool,evidence: null == evidence ? _self.evidence : evidence // ignore: cast_nullable_to_non_nullable
as List<PaymentEvidence>,
  ));
}

}


/// Adds pattern-matching-related methods to [Instalment].
extension InstalmentPatterns on Instalment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Instalment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Instalment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Instalment value)  $default,){
final _that = this;
switch (_that) {
case _Instalment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Instalment value)?  $default,){
final _that = this;
switch (_that) {
case _Instalment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int sequence,  String kind,  String amount, @JsonKey(name: 'due_date')  String? dueDate, @JsonKey(name: 'unlocks_enrollment')  bool unlocksEnrollment,  bool paid, @JsonKey(name: 'paid_amount')  String paidAmount,  String remaining, @JsonKey(name: 'short_accepted')  bool shortAccepted,  List<PaymentEvidence> evidence)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Instalment() when $default != null:
return $default(_that.id,_that.sequence,_that.kind,_that.amount,_that.dueDate,_that.unlocksEnrollment,_that.paid,_that.paidAmount,_that.remaining,_that.shortAccepted,_that.evidence);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int sequence,  String kind,  String amount, @JsonKey(name: 'due_date')  String? dueDate, @JsonKey(name: 'unlocks_enrollment')  bool unlocksEnrollment,  bool paid, @JsonKey(name: 'paid_amount')  String paidAmount,  String remaining, @JsonKey(name: 'short_accepted')  bool shortAccepted,  List<PaymentEvidence> evidence)  $default,) {final _that = this;
switch (_that) {
case _Instalment():
return $default(_that.id,_that.sequence,_that.kind,_that.amount,_that.dueDate,_that.unlocksEnrollment,_that.paid,_that.paidAmount,_that.remaining,_that.shortAccepted,_that.evidence);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int sequence,  String kind,  String amount, @JsonKey(name: 'due_date')  String? dueDate, @JsonKey(name: 'unlocks_enrollment')  bool unlocksEnrollment,  bool paid, @JsonKey(name: 'paid_amount')  String paidAmount,  String remaining, @JsonKey(name: 'short_accepted')  bool shortAccepted,  List<PaymentEvidence> evidence)?  $default,) {final _that = this;
switch (_that) {
case _Instalment() when $default != null:
return $default(_that.id,_that.sequence,_that.kind,_that.amount,_that.dueDate,_that.unlocksEnrollment,_that.paid,_that.paidAmount,_that.remaining,_that.shortAccepted,_that.evidence);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Instalment implements Instalment {
  const _Instalment({required this.id, this.sequence = 0, this.kind = 'admission', this.amount = '0', @JsonKey(name: 'due_date') this.dueDate, @JsonKey(name: 'unlocks_enrollment') this.unlocksEnrollment = false, this.paid = false, @JsonKey(name: 'paid_amount') this.paidAmount = '0', this.remaining = '0', @JsonKey(name: 'short_accepted') this.shortAccepted = false,  List<PaymentEvidence> evidence = const <PaymentEvidence>[]}): _evidence = evidence;
  factory _Instalment.fromJson(Map<String, dynamic> json) => _$InstalmentFromJson(json);

@override final  int id;
@override@JsonKey() final  int sequence;
@override@JsonKey() final  String kind;
@override@JsonKey() final  String amount;
@override@JsonKey(name: 'due_date') final  String? dueDate;
@override@JsonKey(name: 'unlocks_enrollment') final  bool unlocksEnrollment;
@override@JsonKey() final  bool paid;
@override@JsonKey(name: 'paid_amount') final  String paidAmount;
@override@JsonKey() final  String remaining;
@override@JsonKey(name: 'short_accepted') final  bool shortAccepted;
 final  List<PaymentEvidence> _evidence;
@override@JsonKey() List<PaymentEvidence> get evidence {
  if (_evidence is EqualUnmodifiableListView) return _evidence;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_evidence);
}


/// Create a copy of Instalment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InstalmentCopyWith<_Instalment> get copyWith => __$InstalmentCopyWithImpl<_Instalment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InstalmentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Instalment&&(identical(other.id, id) || other.id == id)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.unlocksEnrollment, unlocksEnrollment) || other.unlocksEnrollment == unlocksEnrollment)&&(identical(other.paid, paid) || other.paid == paid)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.shortAccepted, shortAccepted) || other.shortAccepted == shortAccepted)&&const DeepCollectionEquality().equals(other.evidence, _evidence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,sequence,kind,amount,dueDate,unlocksEnrollment,paid,paidAmount,remaining,shortAccepted,const DeepCollectionEquality().hash(_evidence));
}

@override
String toString() {
    return 'Instalment(id: $id, sequence: $sequence, kind: $kind, amount: $amount, dueDate: $dueDate, unlocksEnrollment: $unlocksEnrollment, paid: $paid, paidAmount: $paidAmount, remaining: $remaining, shortAccepted: $shortAccepted, evidence: $evidence)';
}


}

/// @nodoc
abstract mixin class _$InstalmentCopyWith<$Res> implements $InstalmentCopyWith<$Res> {
  factory _$InstalmentCopyWith(_Instalment value, $Res Function(_Instalment) _then) = __$InstalmentCopyWithImpl;
@override @useResult
$Res call({
 int id, int sequence, String kind, String amount,@JsonKey(name: 'due_date') String? dueDate,@JsonKey(name: 'unlocks_enrollment') bool unlocksEnrollment, bool paid,@JsonKey(name: 'paid_amount') String paidAmount, String remaining,@JsonKey(name: 'short_accepted') bool shortAccepted, List<PaymentEvidence> evidence
});




}
/// @nodoc
class __$InstalmentCopyWithImpl<$Res>
    implements _$InstalmentCopyWith<$Res> {
  __$InstalmentCopyWithImpl(this._self, this._then);

  final _Instalment _self;
  final $Res Function(_Instalment) _then;

/// Create a copy of Instalment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sequence = null,Object? kind = null,Object? amount = null,Object? dueDate = freezed,Object? unlocksEnrollment = null,Object? paid = null,Object? paidAmount = null,Object? remaining = null,Object? shortAccepted = null,Object? evidence = null,}) {
  return _then(_Instalment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,unlocksEnrollment: null == unlocksEnrollment ? _self.unlocksEnrollment : unlocksEnrollment // ignore: cast_nullable_to_non_nullable
as bool,paid: null == paid ? _self.paid : paid // ignore: cast_nullable_to_non_nullable
as bool,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as String,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as String,shortAccepted: null == shortAccepted ? _self.shortAccepted : shortAccepted // ignore: cast_nullable_to_non_nullable
as bool,evidence: null == evidence ? _self._evidence : evidence // ignore: cast_nullable_to_non_nullable
as List<PaymentEvidence>,
  ));
}


}


/// @nodoc
mixin _$Offer {

 int get id; int get version; String get state;@JsonKey(name: 'state_label') String get stateLabel;@JsonKey(name: 'is_conditional') bool get isConditional; String get conditions; List<OfferSubject> get subjects; OfferCalculation get calculation;@JsonKey(name: 'tuition_months') int? get tuitionMonths;@JsonKey(name: 'tuition_amount') String? get tuitionAmount;@JsonKey(name: 'tuition_from') String? get tuitionFrom;@JsonKey(name: 'tuition_period') String? get tuitionPeriod; List<OfferScholarship> get scholarships; String? get deadline;@JsonKey(name: 'extended_once') bool get extendedOnce;@JsonKey(name: 'sent_at') String? get sentAt;@JsonKey(name: 'has_terms') bool get hasTerms; List<Instalment> get instalments;
/// Create a copy of Offer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfferCopyWith<Offer> get copyWith => _$OfferCopyWithImpl<Offer>(this as Offer, _$identity);

  /// Serializes this Offer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Offer;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Offer&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.version, _this.version) || other.version == _this.version)&&(identical(other.state, _this.state) || other.state == _this.state)&&(identical(other.stateLabel, _this.stateLabel) || other.stateLabel == _this.stateLabel)&&(identical(other.isConditional, _this.isConditional) || other.isConditional == _this.isConditional)&&(identical(other.conditions, _this.conditions) || other.conditions == _this.conditions)&&const DeepCollectionEquality().equals(other.subjects, _this.subjects)&&(identical(other.calculation, _this.calculation) || other.calculation == _this.calculation)&&(identical(other.tuitionMonths, _this.tuitionMonths) || other.tuitionMonths == _this.tuitionMonths)&&(identical(other.tuitionAmount, _this.tuitionAmount) || other.tuitionAmount == _this.tuitionAmount)&&(identical(other.tuitionFrom, _this.tuitionFrom) || other.tuitionFrom == _this.tuitionFrom)&&(identical(other.tuitionPeriod, _this.tuitionPeriod) || other.tuitionPeriod == _this.tuitionPeriod)&&const DeepCollectionEquality().equals(other.scholarships, _this.scholarships)&&(identical(other.deadline, _this.deadline) || other.deadline == _this.deadline)&&(identical(other.extendedOnce, _this.extendedOnce) || other.extendedOnce == _this.extendedOnce)&&(identical(other.sentAt, _this.sentAt) || other.sentAt == _this.sentAt)&&(identical(other.hasTerms, _this.hasTerms) || other.hasTerms == _this.hasTerms)&&const DeepCollectionEquality().equals(other.instalments, _this.instalments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Offer;
  return Object.hash(runtimeType,_this.id,_this.version,_this.state,_this.stateLabel,_this.isConditional,_this.conditions,const DeepCollectionEquality().hash(_this.subjects),_this.calculation,_this.tuitionMonths,_this.tuitionAmount,_this.tuitionFrom,_this.tuitionPeriod,const DeepCollectionEquality().hash(_this.scholarships),_this.deadline,_this.extendedOnce,_this.sentAt,_this.hasTerms,const DeepCollectionEquality().hash(_this.instalments));
}

@override
String toString() {
  final _this = this as Offer;
  return 'Offer(id: ${_this.id}, version: ${_this.version}, state: ${_this.state}, stateLabel: ${_this.stateLabel}, isConditional: ${_this.isConditional}, conditions: ${_this.conditions}, subjects: ${_this.subjects}, calculation: ${_this.calculation}, tuitionMonths: ${_this.tuitionMonths}, tuitionAmount: ${_this.tuitionAmount}, tuitionFrom: ${_this.tuitionFrom}, tuitionPeriod: ${_this.tuitionPeriod}, scholarships: ${_this.scholarships}, deadline: ${_this.deadline}, extendedOnce: ${_this.extendedOnce}, sentAt: ${_this.sentAt}, hasTerms: ${_this.hasTerms}, instalments: ${_this.instalments})';
}


}

/// @nodoc
abstract mixin class $OfferCopyWith<$Res>  {
  factory $OfferCopyWith(Offer value, $Res Function(Offer) _then) = _$OfferCopyWithImpl;
@useResult
$Res call({
 int id, int version, String state,@JsonKey(name: 'state_label') String stateLabel,@JsonKey(name: 'is_conditional') bool isConditional, String conditions, List<OfferSubject> subjects, OfferCalculation calculation,@JsonKey(name: 'tuition_months') int? tuitionMonths,@JsonKey(name: 'tuition_amount') String? tuitionAmount,@JsonKey(name: 'tuition_from') String? tuitionFrom,@JsonKey(name: 'tuition_period') String? tuitionPeriod, List<OfferScholarship> scholarships, String? deadline,@JsonKey(name: 'extended_once') bool extendedOnce,@JsonKey(name: 'sent_at') String? sentAt,@JsonKey(name: 'has_terms') bool hasTerms, List<Instalment> instalments
});


$OfferCalculationCopyWith<$Res> get calculation;

}
/// @nodoc
class _$OfferCopyWithImpl<$Res>
    implements $OfferCopyWith<$Res> {
  _$OfferCopyWithImpl(this._self, this._then);

  final Offer _self;
  final $Res Function(Offer) _then;

/// Create a copy of Offer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? version = null,Object? state = null,Object? stateLabel = null,Object? isConditional = null,Object? conditions = null,Object? subjects = null,Object? calculation = null,Object? tuitionMonths = freezed,Object? tuitionAmount = freezed,Object? tuitionFrom = freezed,Object? tuitionPeriod = freezed,Object? scholarships = null,Object? deadline = freezed,Object? extendedOnce = null,Object? sentAt = freezed,Object? hasTerms = null,Object? instalments = null,}) {
  return _then(Offer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,stateLabel: null == stateLabel ? _self.stateLabel : stateLabel // ignore: cast_nullable_to_non_nullable
as String,isConditional: null == isConditional ? _self.isConditional : isConditional // ignore: cast_nullable_to_non_nullable
as bool,conditions: null == conditions ? _self.conditions : conditions // ignore: cast_nullable_to_non_nullable
as String,subjects: null == subjects ? _self.subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<OfferSubject>,calculation: null == calculation ? _self.calculation : calculation // ignore: cast_nullable_to_non_nullable
as OfferCalculation,tuitionMonths: freezed == tuitionMonths ? _self.tuitionMonths : tuitionMonths // ignore: cast_nullable_to_non_nullable
as int?,tuitionAmount: freezed == tuitionAmount ? _self.tuitionAmount : tuitionAmount // ignore: cast_nullable_to_non_nullable
as String?,tuitionFrom: freezed == tuitionFrom ? _self.tuitionFrom : tuitionFrom // ignore: cast_nullable_to_non_nullable
as String?,tuitionPeriod: freezed == tuitionPeriod ? _self.tuitionPeriod : tuitionPeriod // ignore: cast_nullable_to_non_nullable
as String?,scholarships: null == scholarships ? _self.scholarships : scholarships // ignore: cast_nullable_to_non_nullable
as List<OfferScholarship>,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as String?,extendedOnce: null == extendedOnce ? _self.extendedOnce : extendedOnce // ignore: cast_nullable_to_non_nullable
as bool,sentAt: freezed == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as String?,hasTerms: null == hasTerms ? _self.hasTerms : hasTerms // ignore: cast_nullable_to_non_nullable
as bool,instalments: null == instalments ? _self.instalments : instalments // ignore: cast_nullable_to_non_nullable
as List<Instalment>,
  ));
}
/// Create a copy of Offer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfferCalculationCopyWith<$Res> get calculation {
  
  return $OfferCalculationCopyWith<$Res>(_self.calculation, (value) {
    return _then(_self.copyWith(calculation: value));
  });
}
}


/// Adds pattern-matching-related methods to [Offer].
extension OfferPatterns on Offer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Offer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Offer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Offer value)  $default,){
final _that = this;
switch (_that) {
case _Offer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Offer value)?  $default,){
final _that = this;
switch (_that) {
case _Offer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int version,  String state, @JsonKey(name: 'state_label')  String stateLabel, @JsonKey(name: 'is_conditional')  bool isConditional,  String conditions,  List<OfferSubject> subjects,  OfferCalculation calculation, @JsonKey(name: 'tuition_months')  int? tuitionMonths, @JsonKey(name: 'tuition_amount')  String? tuitionAmount, @JsonKey(name: 'tuition_from')  String? tuitionFrom, @JsonKey(name: 'tuition_period')  String? tuitionPeriod,  List<OfferScholarship> scholarships,  String? deadline, @JsonKey(name: 'extended_once')  bool extendedOnce, @JsonKey(name: 'sent_at')  String? sentAt, @JsonKey(name: 'has_terms')  bool hasTerms,  List<Instalment> instalments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Offer() when $default != null:
return $default(_that.id,_that.version,_that.state,_that.stateLabel,_that.isConditional,_that.conditions,_that.subjects,_that.calculation,_that.tuitionMonths,_that.tuitionAmount,_that.tuitionFrom,_that.tuitionPeriod,_that.scholarships,_that.deadline,_that.extendedOnce,_that.sentAt,_that.hasTerms,_that.instalments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int version,  String state, @JsonKey(name: 'state_label')  String stateLabel, @JsonKey(name: 'is_conditional')  bool isConditional,  String conditions,  List<OfferSubject> subjects,  OfferCalculation calculation, @JsonKey(name: 'tuition_months')  int? tuitionMonths, @JsonKey(name: 'tuition_amount')  String? tuitionAmount, @JsonKey(name: 'tuition_from')  String? tuitionFrom, @JsonKey(name: 'tuition_period')  String? tuitionPeriod,  List<OfferScholarship> scholarships,  String? deadline, @JsonKey(name: 'extended_once')  bool extendedOnce, @JsonKey(name: 'sent_at')  String? sentAt, @JsonKey(name: 'has_terms')  bool hasTerms,  List<Instalment> instalments)  $default,) {final _that = this;
switch (_that) {
case _Offer():
return $default(_that.id,_that.version,_that.state,_that.stateLabel,_that.isConditional,_that.conditions,_that.subjects,_that.calculation,_that.tuitionMonths,_that.tuitionAmount,_that.tuitionFrom,_that.tuitionPeriod,_that.scholarships,_that.deadline,_that.extendedOnce,_that.sentAt,_that.hasTerms,_that.instalments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int version,  String state, @JsonKey(name: 'state_label')  String stateLabel, @JsonKey(name: 'is_conditional')  bool isConditional,  String conditions,  List<OfferSubject> subjects,  OfferCalculation calculation, @JsonKey(name: 'tuition_months')  int? tuitionMonths, @JsonKey(name: 'tuition_amount')  String? tuitionAmount, @JsonKey(name: 'tuition_from')  String? tuitionFrom, @JsonKey(name: 'tuition_period')  String? tuitionPeriod,  List<OfferScholarship> scholarships,  String? deadline, @JsonKey(name: 'extended_once')  bool extendedOnce, @JsonKey(name: 'sent_at')  String? sentAt, @JsonKey(name: 'has_terms')  bool hasTerms,  List<Instalment> instalments)?  $default,) {final _that = this;
switch (_that) {
case _Offer() when $default != null:
return $default(_that.id,_that.version,_that.state,_that.stateLabel,_that.isConditional,_that.conditions,_that.subjects,_that.calculation,_that.tuitionMonths,_that.tuitionAmount,_that.tuitionFrom,_that.tuitionPeriod,_that.scholarships,_that.deadline,_that.extendedOnce,_that.sentAt,_that.hasTerms,_that.instalments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Offer implements Offer {
  const _Offer({required this.id, this.version = 1, this.state = '', @JsonKey(name: 'state_label') this.stateLabel = '', @JsonKey(name: 'is_conditional') this.isConditional = false, this.conditions = '',  List<OfferSubject> subjects = const <OfferSubject>[], this.calculation = const OfferCalculation(), @JsonKey(name: 'tuition_months') this.tuitionMonths, @JsonKey(name: 'tuition_amount') this.tuitionAmount, @JsonKey(name: 'tuition_from') this.tuitionFrom, @JsonKey(name: 'tuition_period') this.tuitionPeriod,  List<OfferScholarship> scholarships = const <OfferScholarship>[], this.deadline, @JsonKey(name: 'extended_once') this.extendedOnce = false, @JsonKey(name: 'sent_at') this.sentAt, @JsonKey(name: 'has_terms') this.hasTerms = false,  List<Instalment> instalments = const <Instalment>[]}): _subjects = subjects,_scholarships = scholarships,_instalments = instalments;
  factory _Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

@override final  int id;
@override@JsonKey() final  int version;
@override@JsonKey() final  String state;
@override@JsonKey(name: 'state_label') final  String stateLabel;
@override@JsonKey(name: 'is_conditional') final  bool isConditional;
@override@JsonKey() final  String conditions;
 final  List<OfferSubject> _subjects;
@override@JsonKey() List<OfferSubject> get subjects {
  if (_subjects is EqualUnmodifiableListView) return _subjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subjects);
}

@override@JsonKey() final  OfferCalculation calculation;
@override@JsonKey(name: 'tuition_months') final  int? tuitionMonths;
@override@JsonKey(name: 'tuition_amount') final  String? tuitionAmount;
@override@JsonKey(name: 'tuition_from') final  String? tuitionFrom;
@override@JsonKey(name: 'tuition_period') final  String? tuitionPeriod;
 final  List<OfferScholarship> _scholarships;
@override@JsonKey() List<OfferScholarship> get scholarships {
  if (_scholarships is EqualUnmodifiableListView) return _scholarships;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scholarships);
}

@override final  String? deadline;
@override@JsonKey(name: 'extended_once') final  bool extendedOnce;
@override@JsonKey(name: 'sent_at') final  String? sentAt;
@override@JsonKey(name: 'has_terms') final  bool hasTerms;
 final  List<Instalment> _instalments;
@override@JsonKey() List<Instalment> get instalments {
  if (_instalments is EqualUnmodifiableListView) return _instalments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_instalments);
}


/// Create a copy of Offer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfferCopyWith<_Offer> get copyWith => __$OfferCopyWithImpl<_Offer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfferToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Offer&&(identical(other.id, id) || other.id == id)&&(identical(other.version, version) || other.version == version)&&(identical(other.state, state) || other.state == state)&&(identical(other.stateLabel, stateLabel) || other.stateLabel == stateLabel)&&(identical(other.isConditional, isConditional) || other.isConditional == isConditional)&&(identical(other.conditions, conditions) || other.conditions == conditions)&&const DeepCollectionEquality().equals(other.subjects, _subjects)&&(identical(other.calculation, calculation) || other.calculation == calculation)&&(identical(other.tuitionMonths, tuitionMonths) || other.tuitionMonths == tuitionMonths)&&(identical(other.tuitionAmount, tuitionAmount) || other.tuitionAmount == tuitionAmount)&&(identical(other.tuitionFrom, tuitionFrom) || other.tuitionFrom == tuitionFrom)&&(identical(other.tuitionPeriod, tuitionPeriod) || other.tuitionPeriod == tuitionPeriod)&&const DeepCollectionEquality().equals(other.scholarships, _scholarships)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.extendedOnce, extendedOnce) || other.extendedOnce == extendedOnce)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt)&&(identical(other.hasTerms, hasTerms) || other.hasTerms == hasTerms)&&const DeepCollectionEquality().equals(other.instalments, _instalments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,version,state,stateLabel,isConditional,conditions,const DeepCollectionEquality().hash(_subjects),calculation,tuitionMonths,tuitionAmount,tuitionFrom,tuitionPeriod,const DeepCollectionEquality().hash(_scholarships),deadline,extendedOnce,sentAt,hasTerms,const DeepCollectionEquality().hash(_instalments));
}

@override
String toString() {
    return 'Offer(id: $id, version: $version, state: $state, stateLabel: $stateLabel, isConditional: $isConditional, conditions: $conditions, subjects: $subjects, calculation: $calculation, tuitionMonths: $tuitionMonths, tuitionAmount: $tuitionAmount, tuitionFrom: $tuitionFrom, tuitionPeriod: $tuitionPeriod, scholarships: $scholarships, deadline: $deadline, extendedOnce: $extendedOnce, sentAt: $sentAt, hasTerms: $hasTerms, instalments: $instalments)';
}


}

/// @nodoc
abstract mixin class _$OfferCopyWith<$Res> implements $OfferCopyWith<$Res> {
  factory _$OfferCopyWith(_Offer value, $Res Function(_Offer) _then) = __$OfferCopyWithImpl;
@override @useResult
$Res call({
 int id, int version, String state,@JsonKey(name: 'state_label') String stateLabel,@JsonKey(name: 'is_conditional') bool isConditional, String conditions, List<OfferSubject> subjects, OfferCalculation calculation,@JsonKey(name: 'tuition_months') int? tuitionMonths,@JsonKey(name: 'tuition_amount') String? tuitionAmount,@JsonKey(name: 'tuition_from') String? tuitionFrom,@JsonKey(name: 'tuition_period') String? tuitionPeriod, List<OfferScholarship> scholarships, String? deadline,@JsonKey(name: 'extended_once') bool extendedOnce,@JsonKey(name: 'sent_at') String? sentAt,@JsonKey(name: 'has_terms') bool hasTerms, List<Instalment> instalments
});


@override $OfferCalculationCopyWith<$Res> get calculation;

}
/// @nodoc
class __$OfferCopyWithImpl<$Res>
    implements _$OfferCopyWith<$Res> {
  __$OfferCopyWithImpl(this._self, this._then);

  final _Offer _self;
  final $Res Function(_Offer) _then;

/// Create a copy of Offer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? version = null,Object? state = null,Object? stateLabel = null,Object? isConditional = null,Object? conditions = null,Object? subjects = null,Object? calculation = null,Object? tuitionMonths = freezed,Object? tuitionAmount = freezed,Object? tuitionFrom = freezed,Object? tuitionPeriod = freezed,Object? scholarships = null,Object? deadline = freezed,Object? extendedOnce = null,Object? sentAt = freezed,Object? hasTerms = null,Object? instalments = null,}) {
  return _then(_Offer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,stateLabel: null == stateLabel ? _self.stateLabel : stateLabel // ignore: cast_nullable_to_non_nullable
as String,isConditional: null == isConditional ? _self.isConditional : isConditional // ignore: cast_nullable_to_non_nullable
as bool,conditions: null == conditions ? _self.conditions : conditions // ignore: cast_nullable_to_non_nullable
as String,subjects: null == subjects ? _self._subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<OfferSubject>,calculation: null == calculation ? _self.calculation : calculation // ignore: cast_nullable_to_non_nullable
as OfferCalculation,tuitionMonths: freezed == tuitionMonths ? _self.tuitionMonths : tuitionMonths // ignore: cast_nullable_to_non_nullable
as int?,tuitionAmount: freezed == tuitionAmount ? _self.tuitionAmount : tuitionAmount // ignore: cast_nullable_to_non_nullable
as String?,tuitionFrom: freezed == tuitionFrom ? _self.tuitionFrom : tuitionFrom // ignore: cast_nullable_to_non_nullable
as String?,tuitionPeriod: freezed == tuitionPeriod ? _self.tuitionPeriod : tuitionPeriod // ignore: cast_nullable_to_non_nullable
as String?,scholarships: null == scholarships ? _self._scholarships : scholarships // ignore: cast_nullable_to_non_nullable
as List<OfferScholarship>,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as String?,extendedOnce: null == extendedOnce ? _self.extendedOnce : extendedOnce // ignore: cast_nullable_to_non_nullable
as bool,sentAt: freezed == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as String?,hasTerms: null == hasTerms ? _self.hasTerms : hasTerms // ignore: cast_nullable_to_non_nullable
as bool,instalments: null == instalments ? _self._instalments : instalments // ignore: cast_nullable_to_non_nullable
as List<Instalment>,
  ));
}

/// Create a copy of Offer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfferCalculationCopyWith<$Res> get calculation {
  
  return $OfferCalculationCopyWith<$Res>(_self.calculation, (value) {
    return _then(_self.copyWith(calculation: value));
  });
}
}

// dart format on
