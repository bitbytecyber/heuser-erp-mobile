// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Interview {

 int get id; String get state;@JsonKey(name: 'starts_at') String? get startsAt;@JsonKey(name: 'ends_at') String? get endsAt;@JsonKey(name: 'can_reschedule') bool get canReschedule; int? get interviewer;@JsonKey(name: 'interviewer_name') String? get interviewerName; String? get outcome; bool? get locked;
/// Create a copy of Interview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterviewCopyWith<Interview> get copyWith => _$InterviewCopyWithImpl<Interview>(this as Interview, _$identity);

  /// Serializes this Interview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Interview;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Interview&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.state, _this.state) || other.state == _this.state)&&(identical(other.startsAt, _this.startsAt) || other.startsAt == _this.startsAt)&&(identical(other.endsAt, _this.endsAt) || other.endsAt == _this.endsAt)&&(identical(other.canReschedule, _this.canReschedule) || other.canReschedule == _this.canReschedule)&&(identical(other.interviewer, _this.interviewer) || other.interviewer == _this.interviewer)&&(identical(other.interviewerName, _this.interviewerName) || other.interviewerName == _this.interviewerName)&&(identical(other.outcome, _this.outcome) || other.outcome == _this.outcome)&&(identical(other.locked, _this.locked) || other.locked == _this.locked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Interview;
  return Object.hash(runtimeType,_this.id,_this.state,_this.startsAt,_this.endsAt,_this.canReschedule,_this.interviewer,_this.interviewerName,_this.outcome,_this.locked);
}

@override
String toString() {
  final _this = this as Interview;
  return 'Interview(id: ${_this.id}, state: ${_this.state}, startsAt: ${_this.startsAt}, endsAt: ${_this.endsAt}, canReschedule: ${_this.canReschedule}, interviewer: ${_this.interviewer}, interviewerName: ${_this.interviewerName}, outcome: ${_this.outcome}, locked: ${_this.locked})';
}


}

/// @nodoc
abstract mixin class $InterviewCopyWith<$Res>  {
  factory $InterviewCopyWith(Interview value, $Res Function(Interview) _then) = _$InterviewCopyWithImpl;
@useResult
$Res call({
 int id, String state,@JsonKey(name: 'starts_at') String? startsAt,@JsonKey(name: 'ends_at') String? endsAt,@JsonKey(name: 'can_reschedule') bool canReschedule, int? interviewer,@JsonKey(name: 'interviewer_name') String? interviewerName, String? outcome, bool? locked
});




}
/// @nodoc
class _$InterviewCopyWithImpl<$Res>
    implements $InterviewCopyWith<$Res> {
  _$InterviewCopyWithImpl(this._self, this._then);

  final Interview _self;
  final $Res Function(Interview) _then;

/// Create a copy of Interview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? state = null,Object? startsAt = freezed,Object? endsAt = freezed,Object? canReschedule = null,Object? interviewer = freezed,Object? interviewerName = freezed,Object? outcome = freezed,Object? locked = freezed,}) {
  return _then(Interview(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,startsAt: freezed == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as String?,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as String?,canReschedule: null == canReschedule ? _self.canReschedule : canReschedule // ignore: cast_nullable_to_non_nullable
as bool,interviewer: freezed == interviewer ? _self.interviewer : interviewer // ignore: cast_nullable_to_non_nullable
as int?,interviewerName: freezed == interviewerName ? _self.interviewerName : interviewerName // ignore: cast_nullable_to_non_nullable
as String?,outcome: freezed == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as String?,locked: freezed == locked ? _self.locked : locked // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [Interview].
extension InterviewPatterns on Interview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Interview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Interview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Interview value)  $default,){
final _that = this;
switch (_that) {
case _Interview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Interview value)?  $default,){
final _that = this;
switch (_that) {
case _Interview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String state, @JsonKey(name: 'starts_at')  String? startsAt, @JsonKey(name: 'ends_at')  String? endsAt, @JsonKey(name: 'can_reschedule')  bool canReschedule,  int? interviewer, @JsonKey(name: 'interviewer_name')  String? interviewerName,  String? outcome,  bool? locked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Interview() when $default != null:
return $default(_that.id,_that.state,_that.startsAt,_that.endsAt,_that.canReschedule,_that.interviewer,_that.interviewerName,_that.outcome,_that.locked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String state, @JsonKey(name: 'starts_at')  String? startsAt, @JsonKey(name: 'ends_at')  String? endsAt, @JsonKey(name: 'can_reschedule')  bool canReschedule,  int? interviewer, @JsonKey(name: 'interviewer_name')  String? interviewerName,  String? outcome,  bool? locked)  $default,) {final _that = this;
switch (_that) {
case _Interview():
return $default(_that.id,_that.state,_that.startsAt,_that.endsAt,_that.canReschedule,_that.interviewer,_that.interviewerName,_that.outcome,_that.locked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String state, @JsonKey(name: 'starts_at')  String? startsAt, @JsonKey(name: 'ends_at')  String? endsAt, @JsonKey(name: 'can_reschedule')  bool canReschedule,  int? interviewer, @JsonKey(name: 'interviewer_name')  String? interviewerName,  String? outcome,  bool? locked)?  $default,) {final _that = this;
switch (_that) {
case _Interview() when $default != null:
return $default(_that.id,_that.state,_that.startsAt,_that.endsAt,_that.canReschedule,_that.interviewer,_that.interviewerName,_that.outcome,_that.locked);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Interview implements Interview {
  const _Interview({required this.id, this.state = '', @JsonKey(name: 'starts_at') this.startsAt, @JsonKey(name: 'ends_at') this.endsAt, @JsonKey(name: 'can_reschedule') this.canReschedule = false, this.interviewer, @JsonKey(name: 'interviewer_name') this.interviewerName, this.outcome, this.locked});
  factory _Interview.fromJson(Map<String, dynamic> json) => _$InterviewFromJson(json);

@override final  int id;
@override@JsonKey() final  String state;
@override@JsonKey(name: 'starts_at') final  String? startsAt;
@override@JsonKey(name: 'ends_at') final  String? endsAt;
@override@JsonKey(name: 'can_reschedule') final  bool canReschedule;
@override final  int? interviewer;
@override@JsonKey(name: 'interviewer_name') final  String? interviewerName;
@override final  String? outcome;
@override final  bool? locked;

/// Create a copy of Interview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterviewCopyWith<_Interview> get copyWith => __$InterviewCopyWithImpl<_Interview>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterviewToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Interview&&(identical(other.id, id) || other.id == id)&&(identical(other.state, state) || other.state == state)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.canReschedule, canReschedule) || other.canReschedule == canReschedule)&&(identical(other.interviewer, interviewer) || other.interviewer == interviewer)&&(identical(other.interviewerName, interviewerName) || other.interviewerName == interviewerName)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&(identical(other.locked, locked) || other.locked == locked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,state,startsAt,endsAt,canReschedule,interviewer,interviewerName,outcome,locked);
}

@override
String toString() {
    return 'Interview(id: $id, state: $state, startsAt: $startsAt, endsAt: $endsAt, canReschedule: $canReschedule, interviewer: $interviewer, interviewerName: $interviewerName, outcome: $outcome, locked: $locked)';
}


}

/// @nodoc
abstract mixin class _$InterviewCopyWith<$Res> implements $InterviewCopyWith<$Res> {
  factory _$InterviewCopyWith(_Interview value, $Res Function(_Interview) _then) = __$InterviewCopyWithImpl;
@override @useResult
$Res call({
 int id, String state,@JsonKey(name: 'starts_at') String? startsAt,@JsonKey(name: 'ends_at') String? endsAt,@JsonKey(name: 'can_reschedule') bool canReschedule, int? interviewer,@JsonKey(name: 'interviewer_name') String? interviewerName, String? outcome, bool? locked
});




}
/// @nodoc
class __$InterviewCopyWithImpl<$Res>
    implements _$InterviewCopyWith<$Res> {
  __$InterviewCopyWithImpl(this._self, this._then);

  final _Interview _self;
  final $Res Function(_Interview) _then;

/// Create a copy of Interview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? state = null,Object? startsAt = freezed,Object? endsAt = freezed,Object? canReschedule = null,Object? interviewer = freezed,Object? interviewerName = freezed,Object? outcome = freezed,Object? locked = freezed,}) {
  return _then(_Interview(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,startsAt: freezed == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as String?,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as String?,canReschedule: null == canReschedule ? _self.canReschedule : canReschedule // ignore: cast_nullable_to_non_nullable
as bool,interviewer: freezed == interviewer ? _self.interviewer : interviewer // ignore: cast_nullable_to_non_nullable
as int?,interviewerName: freezed == interviewerName ? _self.interviewerName : interviewerName // ignore: cast_nullable_to_non_nullable
as String?,outcome: freezed == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as String?,locked: freezed == locked ? _self.locked : locked // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$Trial {

 int get id; int get sport;@JsonKey(name: 'sport_name') String get sportName; String get state;@JsonKey(name: 'starts_at') String? get startsAt;
/// Create a copy of Trial
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrialCopyWith<Trial> get copyWith => _$TrialCopyWithImpl<Trial>(this as Trial, _$identity);

  /// Serializes this Trial to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Trial;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Trial&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.sport, _this.sport) || other.sport == _this.sport)&&(identical(other.sportName, _this.sportName) || other.sportName == _this.sportName)&&(identical(other.state, _this.state) || other.state == _this.state)&&(identical(other.startsAt, _this.startsAt) || other.startsAt == _this.startsAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Trial;
  return Object.hash(runtimeType,_this.id,_this.sport,_this.sportName,_this.state,_this.startsAt);
}

@override
String toString() {
  final _this = this as Trial;
  return 'Trial(id: ${_this.id}, sport: ${_this.sport}, sportName: ${_this.sportName}, state: ${_this.state}, startsAt: ${_this.startsAt})';
}


}

/// @nodoc
abstract mixin class $TrialCopyWith<$Res>  {
  factory $TrialCopyWith(Trial value, $Res Function(Trial) _then) = _$TrialCopyWithImpl;
@useResult
$Res call({
 int id, int sport,@JsonKey(name: 'sport_name') String sportName, String state,@JsonKey(name: 'starts_at') String? startsAt
});




}
/// @nodoc
class _$TrialCopyWithImpl<$Res>
    implements $TrialCopyWith<$Res> {
  _$TrialCopyWithImpl(this._self, this._then);

  final Trial _self;
  final $Res Function(Trial) _then;

/// Create a copy of Trial
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sport = null,Object? sportName = null,Object? state = null,Object? startsAt = freezed,}) {
  return _then(Trial(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sport: null == sport ? _self.sport : sport // ignore: cast_nullable_to_non_nullable
as int,sportName: null == sportName ? _self.sportName : sportName // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,startsAt: freezed == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Trial].
extension TrialPatterns on Trial {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Trial value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Trial() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Trial value)  $default,){
final _that = this;
switch (_that) {
case _Trial():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Trial value)?  $default,){
final _that = this;
switch (_that) {
case _Trial() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int sport, @JsonKey(name: 'sport_name')  String sportName,  String state, @JsonKey(name: 'starts_at')  String? startsAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Trial() when $default != null:
return $default(_that.id,_that.sport,_that.sportName,_that.state,_that.startsAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int sport, @JsonKey(name: 'sport_name')  String sportName,  String state, @JsonKey(name: 'starts_at')  String? startsAt)  $default,) {final _that = this;
switch (_that) {
case _Trial():
return $default(_that.id,_that.sport,_that.sportName,_that.state,_that.startsAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int sport, @JsonKey(name: 'sport_name')  String sportName,  String state, @JsonKey(name: 'starts_at')  String? startsAt)?  $default,) {final _that = this;
switch (_that) {
case _Trial() when $default != null:
return $default(_that.id,_that.sport,_that.sportName,_that.state,_that.startsAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Trial implements Trial {
  const _Trial({required this.id, this.sport = 0, @JsonKey(name: 'sport_name') this.sportName = '', this.state = '', @JsonKey(name: 'starts_at') this.startsAt});
  factory _Trial.fromJson(Map<String, dynamic> json) => _$TrialFromJson(json);

@override final  int id;
@override@JsonKey() final  int sport;
@override@JsonKey(name: 'sport_name') final  String sportName;
@override@JsonKey() final  String state;
@override@JsonKey(name: 'starts_at') final  String? startsAt;

/// Create a copy of Trial
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrialCopyWith<_Trial> get copyWith => __$TrialCopyWithImpl<_Trial>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrialToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Trial&&(identical(other.id, id) || other.id == id)&&(identical(other.sport, sport) || other.sport == sport)&&(identical(other.sportName, sportName) || other.sportName == sportName)&&(identical(other.state, state) || other.state == state)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,sport,sportName,state,startsAt);
}

@override
String toString() {
    return 'Trial(id: $id, sport: $sport, sportName: $sportName, state: $state, startsAt: $startsAt)';
}


}

/// @nodoc
abstract mixin class _$TrialCopyWith<$Res> implements $TrialCopyWith<$Res> {
  factory _$TrialCopyWith(_Trial value, $Res Function(_Trial) _then) = __$TrialCopyWithImpl;
@override @useResult
$Res call({
 int id, int sport,@JsonKey(name: 'sport_name') String sportName, String state,@JsonKey(name: 'starts_at') String? startsAt
});




}
/// @nodoc
class __$TrialCopyWithImpl<$Res>
    implements _$TrialCopyWith<$Res> {
  __$TrialCopyWithImpl(this._self, this._then);

  final _Trial _self;
  final $Res Function(_Trial) _then;

/// Create a copy of Trial
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sport = null,Object? sportName = null,Object? state = null,Object? startsAt = freezed,}) {
  return _then(_Trial(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sport: null == sport ? _self.sport : sport // ignore: cast_nullable_to_non_nullable
as int,sportName: null == sportName ? _self.sportName : sportName // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,startsAt: freezed == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$FinancialAid {

@JsonKey(name: 'sent_at') String get sentAt;@JsonKey(name: 'submitted_at') String? get submittedAt; Map<String, dynamic> get answers;
/// Create a copy of FinancialAid
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FinancialAidCopyWith<FinancialAid> get copyWith => _$FinancialAidCopyWithImpl<FinancialAid>(this as FinancialAid, _$identity);

  /// Serializes this FinancialAid to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FinancialAid;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FinancialAid&&(identical(other.sentAt, _this.sentAt) || other.sentAt == _this.sentAt)&&(identical(other.submittedAt, _this.submittedAt) || other.submittedAt == _this.submittedAt)&&const DeepCollectionEquality().equals(other.answers, _this.answers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FinancialAid;
  return Object.hash(runtimeType,_this.sentAt,_this.submittedAt,const DeepCollectionEquality().hash(_this.answers));
}

@override
String toString() {
  final _this = this as FinancialAid;
  return 'FinancialAid(sentAt: ${_this.sentAt}, submittedAt: ${_this.submittedAt}, answers: ${_this.answers})';
}


}

/// @nodoc
abstract mixin class $FinancialAidCopyWith<$Res>  {
  factory $FinancialAidCopyWith(FinancialAid value, $Res Function(FinancialAid) _then) = _$FinancialAidCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'sent_at') String sentAt,@JsonKey(name: 'submitted_at') String? submittedAt, Map<String, dynamic> answers
});




}
/// @nodoc
class _$FinancialAidCopyWithImpl<$Res>
    implements $FinancialAidCopyWith<$Res> {
  _$FinancialAidCopyWithImpl(this._self, this._then);

  final FinancialAid _self;
  final $Res Function(FinancialAid) _then;

/// Create a copy of FinancialAid
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sentAt = null,Object? submittedAt = freezed,Object? answers = null,}) {
  return _then(FinancialAid(
sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as String,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as String?,answers: null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [FinancialAid].
extension FinancialAidPatterns on FinancialAid {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FinancialAid value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FinancialAid() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FinancialAid value)  $default,){
final _that = this;
switch (_that) {
case _FinancialAid():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FinancialAid value)?  $default,){
final _that = this;
switch (_that) {
case _FinancialAid() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'sent_at')  String sentAt, @JsonKey(name: 'submitted_at')  String? submittedAt,  Map<String, dynamic> answers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FinancialAid() when $default != null:
return $default(_that.sentAt,_that.submittedAt,_that.answers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'sent_at')  String sentAt, @JsonKey(name: 'submitted_at')  String? submittedAt,  Map<String, dynamic> answers)  $default,) {final _that = this;
switch (_that) {
case _FinancialAid():
return $default(_that.sentAt,_that.submittedAt,_that.answers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'sent_at')  String sentAt, @JsonKey(name: 'submitted_at')  String? submittedAt,  Map<String, dynamic> answers)?  $default,) {final _that = this;
switch (_that) {
case _FinancialAid() when $default != null:
return $default(_that.sentAt,_that.submittedAt,_that.answers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FinancialAid implements FinancialAid {
  const _FinancialAid({@JsonKey(name: 'sent_at') this.sentAt = '', @JsonKey(name: 'submitted_at') this.submittedAt,  Map<String, dynamic> answers = const <String, dynamic>{}}): _answers = answers;
  factory _FinancialAid.fromJson(Map<String, dynamic> json) => _$FinancialAidFromJson(json);

@override@JsonKey(name: 'sent_at') final  String sentAt;
@override@JsonKey(name: 'submitted_at') final  String? submittedAt;
 final  Map<String, dynamic> _answers;
@override@JsonKey() Map<String, dynamic> get answers {
  if (_answers is EqualUnmodifiableMapView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_answers);
}


/// Create a copy of FinancialAid
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FinancialAidCopyWith<_FinancialAid> get copyWith => __$FinancialAidCopyWithImpl<_FinancialAid>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FinancialAidToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FinancialAid&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&const DeepCollectionEquality().equals(other.answers, _answers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,sentAt,submittedAt,const DeepCollectionEquality().hash(_answers));
}

@override
String toString() {
    return 'FinancialAid(sentAt: $sentAt, submittedAt: $submittedAt, answers: $answers)';
}


}

/// @nodoc
abstract mixin class _$FinancialAidCopyWith<$Res> implements $FinancialAidCopyWith<$Res> {
  factory _$FinancialAidCopyWith(_FinancialAid value, $Res Function(_FinancialAid) _then) = __$FinancialAidCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'sent_at') String sentAt,@JsonKey(name: 'submitted_at') String? submittedAt, Map<String, dynamic> answers
});




}
/// @nodoc
class __$FinancialAidCopyWithImpl<$Res>
    implements _$FinancialAidCopyWith<$Res> {
  __$FinancialAidCopyWithImpl(this._self, this._then);

  final _FinancialAid _self;
  final $Res Function(_FinancialAid) _then;

/// Create a copy of FinancialAid
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sentAt = null,Object? submittedAt = freezed,Object? answers = null,}) {
  return _then(_FinancialAid(
sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as String,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as String?,answers: null == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}


/// @nodoc
mixin _$HistoryEntry {

 String get at; String get action; String get note;
/// Create a copy of HistoryEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryEntryCopyWith<HistoryEntry> get copyWith => _$HistoryEntryCopyWithImpl<HistoryEntry>(this as HistoryEntry, _$identity);

  /// Serializes this HistoryEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HistoryEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryEntry&&(identical(other.at, _this.at) || other.at == _this.at)&&(identical(other.action, _this.action) || other.action == _this.action)&&(identical(other.note, _this.note) || other.note == _this.note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HistoryEntry;
  return Object.hash(runtimeType,_this.at,_this.action,_this.note);
}

@override
String toString() {
  final _this = this as HistoryEntry;
  return 'HistoryEntry(at: ${_this.at}, action: ${_this.action}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $HistoryEntryCopyWith<$Res>  {
  factory $HistoryEntryCopyWith(HistoryEntry value, $Res Function(HistoryEntry) _then) = _$HistoryEntryCopyWithImpl;
@useResult
$Res call({
 String at, String action, String note
});




}
/// @nodoc
class _$HistoryEntryCopyWithImpl<$Res>
    implements $HistoryEntryCopyWith<$Res> {
  _$HistoryEntryCopyWithImpl(this._self, this._then);

  final HistoryEntry _self;
  final $Res Function(HistoryEntry) _then;

/// Create a copy of HistoryEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? at = null,Object? action = null,Object? note = null,}) {
  return _then(HistoryEntry(
at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryEntry].
extension HistoryEntryPatterns on HistoryEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryEntry value)  $default,){
final _that = this;
switch (_that) {
case _HistoryEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryEntry value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String at,  String action,  String note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryEntry() when $default != null:
return $default(_that.at,_that.action,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String at,  String action,  String note)  $default,) {final _that = this;
switch (_that) {
case _HistoryEntry():
return $default(_that.at,_that.action,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String at,  String action,  String note)?  $default,) {final _that = this;
switch (_that) {
case _HistoryEntry() when $default != null:
return $default(_that.at,_that.action,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryEntry implements HistoryEntry {
  const _HistoryEntry({this.at = '', this.action = '', this.note = ''});
  factory _HistoryEntry.fromJson(Map<String, dynamic> json) => _$HistoryEntryFromJson(json);

@override@JsonKey() final  String at;
@override@JsonKey() final  String action;
@override@JsonKey() final  String note;

/// Create a copy of HistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryEntryCopyWith<_HistoryEntry> get copyWith => __$HistoryEntryCopyWithImpl<_HistoryEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryEntry&&(identical(other.at, at) || other.at == at)&&(identical(other.action, action) || other.action == action)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,at,action,note);
}

@override
String toString() {
    return 'HistoryEntry(at: $at, action: $action, note: $note)';
}


}

/// @nodoc
abstract mixin class _$HistoryEntryCopyWith<$Res> implements $HistoryEntryCopyWith<$Res> {
  factory _$HistoryEntryCopyWith(_HistoryEntry value, $Res Function(_HistoryEntry) _then) = __$HistoryEntryCopyWithImpl;
@override @useResult
$Res call({
 String at, String action, String note
});




}
/// @nodoc
class __$HistoryEntryCopyWithImpl<$Res>
    implements _$HistoryEntryCopyWith<$Res> {
  __$HistoryEntryCopyWithImpl(this._self, this._then);

  final _HistoryEntry _self;
  final $Res Function(_HistoryEntry) _then;

/// Create a copy of HistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? at = null,Object? action = null,Object? note = null,}) {
  return _then(_HistoryEntry(
at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Application {

 int get id; String? get reference; String get cycle; String? get round;@JsonKey(unknownEnumValue: Level.as_) Level get level;@JsonKey(unknownEnumValue: AppStatus.unknown) AppStatus get status;@JsonKey(name: 'status_label') String get statusLabel; Tracker get tracker;@JsonKey(name: 'form_step') int get formStep;@JsonKey(name: 'submitted_at') String? get submittedAt;@JsonKey(name: 'updated_at') String get updatedAt;@JsonKey(name: 'documents_cleared') bool get documentsCleared;@JsonKey(name: 'interview_released') bool get interviewReleased;@JsonKey(name: 'trial_released') bool get trialReleased;@JsonKey(name: 'interview_rebook') bool get interviewRebook; ApplicantProfile get profile;@JsonKey(name: 'full_name') String get fullName;@JsonKey(name: 'city_name') String get cityName;@JsonKey(name: 'school_name') String get schoolName; List<Guardian> get guardians; List<Sibling> get siblings; List<ResultRow> get results; List<SubjectPick> get subjects; List<ActivityRow> get activities; List<DocSlot> get documents; Interview? get interview; List<Trial> get trials; Offer? get offer;@JsonKey(name: 'financial_aid') FinancialAid? get financialAid; List<HistoryEntry> get history;
/// Create a copy of Application
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationCopyWith<Application> get copyWith => _$ApplicationCopyWithImpl<Application>(this as Application, _$identity);

  /// Serializes this Application to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Application;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Application&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.reference, _this.reference) || other.reference == _this.reference)&&(identical(other.cycle, _this.cycle) || other.cycle == _this.cycle)&&(identical(other.round, _this.round) || other.round == _this.round)&&(identical(other.level, _this.level) || other.level == _this.level)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.statusLabel, _this.statusLabel) || other.statusLabel == _this.statusLabel)&&(identical(other.tracker, _this.tracker) || other.tracker == _this.tracker)&&(identical(other.formStep, _this.formStep) || other.formStep == _this.formStep)&&(identical(other.submittedAt, _this.submittedAt) || other.submittedAt == _this.submittedAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.documentsCleared, _this.documentsCleared) || other.documentsCleared == _this.documentsCleared)&&(identical(other.interviewReleased, _this.interviewReleased) || other.interviewReleased == _this.interviewReleased)&&(identical(other.trialReleased, _this.trialReleased) || other.trialReleased == _this.trialReleased)&&(identical(other.interviewRebook, _this.interviewRebook) || other.interviewRebook == _this.interviewRebook)&&(identical(other.profile, _this.profile) || other.profile == _this.profile)&&(identical(other.fullName, _this.fullName) || other.fullName == _this.fullName)&&(identical(other.cityName, _this.cityName) || other.cityName == _this.cityName)&&(identical(other.schoolName, _this.schoolName) || other.schoolName == _this.schoolName)&&const DeepCollectionEquality().equals(other.guardians, _this.guardians)&&const DeepCollectionEquality().equals(other.siblings, _this.siblings)&&const DeepCollectionEquality().equals(other.results, _this.results)&&const DeepCollectionEquality().equals(other.subjects, _this.subjects)&&const DeepCollectionEquality().equals(other.activities, _this.activities)&&const DeepCollectionEquality().equals(other.documents, _this.documents)&&(identical(other.interview, _this.interview) || other.interview == _this.interview)&&const DeepCollectionEquality().equals(other.trials, _this.trials)&&(identical(other.offer, _this.offer) || other.offer == _this.offer)&&(identical(other.financialAid, _this.financialAid) || other.financialAid == _this.financialAid)&&const DeepCollectionEquality().equals(other.history, _this.history));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Application;
  return Object.hashAll([runtimeType,_this.id,_this.reference,_this.cycle,_this.round,_this.level,_this.status,_this.statusLabel,_this.tracker,_this.formStep,_this.submittedAt,_this.updatedAt,_this.documentsCleared,_this.interviewReleased,_this.trialReleased,_this.interviewRebook,_this.profile,_this.fullName,_this.cityName,_this.schoolName,const DeepCollectionEquality().hash(_this.guardians),const DeepCollectionEquality().hash(_this.siblings),const DeepCollectionEquality().hash(_this.results),const DeepCollectionEquality().hash(_this.subjects),const DeepCollectionEquality().hash(_this.activities),const DeepCollectionEquality().hash(_this.documents),_this.interview,const DeepCollectionEquality().hash(_this.trials),_this.offer,_this.financialAid,const DeepCollectionEquality().hash(_this.history)]);
}

@override
String toString() {
  final _this = this as Application;
  return 'Application(id: ${_this.id}, reference: ${_this.reference}, cycle: ${_this.cycle}, round: ${_this.round}, level: ${_this.level}, status: ${_this.status}, statusLabel: ${_this.statusLabel}, tracker: ${_this.tracker}, formStep: ${_this.formStep}, submittedAt: ${_this.submittedAt}, updatedAt: ${_this.updatedAt}, documentsCleared: ${_this.documentsCleared}, interviewReleased: ${_this.interviewReleased}, trialReleased: ${_this.trialReleased}, interviewRebook: ${_this.interviewRebook}, profile: ${_this.profile}, fullName: ${_this.fullName}, cityName: ${_this.cityName}, schoolName: ${_this.schoolName}, guardians: ${_this.guardians}, siblings: ${_this.siblings}, results: ${_this.results}, subjects: ${_this.subjects}, activities: ${_this.activities}, documents: ${_this.documents}, interview: ${_this.interview}, trials: ${_this.trials}, offer: ${_this.offer}, financialAid: ${_this.financialAid}, history: ${_this.history})';
}


}

/// @nodoc
abstract mixin class $ApplicationCopyWith<$Res>  {
  factory $ApplicationCopyWith(Application value, $Res Function(Application) _then) = _$ApplicationCopyWithImpl;
@useResult
$Res call({
 int id, String? reference, String cycle, String? round,@JsonKey(unknownEnumValue: Level.as_) Level level,@JsonKey(unknownEnumValue: AppStatus.unknown) AppStatus status,@JsonKey(name: 'status_label') String statusLabel, Tracker tracker,@JsonKey(name: 'form_step') int formStep,@JsonKey(name: 'submitted_at') String? submittedAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'documents_cleared') bool documentsCleared,@JsonKey(name: 'interview_released') bool interviewReleased,@JsonKey(name: 'trial_released') bool trialReleased,@JsonKey(name: 'interview_rebook') bool interviewRebook, ApplicantProfile profile,@JsonKey(name: 'full_name') String fullName,@JsonKey(name: 'city_name') String cityName,@JsonKey(name: 'school_name') String schoolName, List<Guardian> guardians, List<Sibling> siblings, List<ResultRow> results, List<SubjectPick> subjects, List<ActivityRow> activities, List<DocSlot> documents, Interview? interview, List<Trial> trials, Offer? offer,@JsonKey(name: 'financial_aid') FinancialAid? financialAid, List<HistoryEntry> history
});


$TrackerCopyWith<$Res> get tracker;$ApplicantProfileCopyWith<$Res> get profile;$InterviewCopyWith<$Res>? get interview;$OfferCopyWith<$Res>? get offer;$FinancialAidCopyWith<$Res>? get financialAid;

}
/// @nodoc
class _$ApplicationCopyWithImpl<$Res>
    implements $ApplicationCopyWith<$Res> {
  _$ApplicationCopyWithImpl(this._self, this._then);

  final Application _self;
  final $Res Function(Application) _then;

/// Create a copy of Application
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? reference = freezed,Object? cycle = null,Object? round = freezed,Object? level = null,Object? status = null,Object? statusLabel = null,Object? tracker = null,Object? formStep = null,Object? submittedAt = freezed,Object? updatedAt = null,Object? documentsCleared = null,Object? interviewReleased = null,Object? trialReleased = null,Object? interviewRebook = null,Object? profile = null,Object? fullName = null,Object? cityName = null,Object? schoolName = null,Object? guardians = null,Object? siblings = null,Object? results = null,Object? subjects = null,Object? activities = null,Object? documents = null,Object? interview = freezed,Object? trials = null,Object? offer = freezed,Object? financialAid = freezed,Object? history = null,}) {
  return _then(Application(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,reference: freezed == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String?,cycle: null == cycle ? _self.cycle : cycle // ignore: cast_nullable_to_non_nullable
as String,round: freezed == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as String?,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as Level,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AppStatus,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,tracker: null == tracker ? _self.tracker : tracker // ignore: cast_nullable_to_non_nullable
as Tracker,formStep: null == formStep ? _self.formStep : formStep // ignore: cast_nullable_to_non_nullable
as int,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,documentsCleared: null == documentsCleared ? _self.documentsCleared : documentsCleared // ignore: cast_nullable_to_non_nullable
as bool,interviewReleased: null == interviewReleased ? _self.interviewReleased : interviewReleased // ignore: cast_nullable_to_non_nullable
as bool,trialReleased: null == trialReleased ? _self.trialReleased : trialReleased // ignore: cast_nullable_to_non_nullable
as bool,interviewRebook: null == interviewRebook ? _self.interviewRebook : interviewRebook // ignore: cast_nullable_to_non_nullable
as bool,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ApplicantProfile,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,schoolName: null == schoolName ? _self.schoolName : schoolName // ignore: cast_nullable_to_non_nullable
as String,guardians: null == guardians ? _self.guardians : guardians // ignore: cast_nullable_to_non_nullable
as List<Guardian>,siblings: null == siblings ? _self.siblings : siblings // ignore: cast_nullable_to_non_nullable
as List<Sibling>,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<ResultRow>,subjects: null == subjects ? _self.subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<SubjectPick>,activities: null == activities ? _self.activities : activities // ignore: cast_nullable_to_non_nullable
as List<ActivityRow>,documents: null == documents ? _self.documents : documents // ignore: cast_nullable_to_non_nullable
as List<DocSlot>,interview: freezed == interview ? _self.interview : interview // ignore: cast_nullable_to_non_nullable
as Interview?,trials: null == trials ? _self.trials : trials // ignore: cast_nullable_to_non_nullable
as List<Trial>,offer: freezed == offer ? _self.offer : offer // ignore: cast_nullable_to_non_nullable
as Offer?,financialAid: freezed == financialAid ? _self.financialAid : financialAid // ignore: cast_nullable_to_non_nullable
as FinancialAid?,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<HistoryEntry>,
  ));
}
/// Create a copy of Application
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrackerCopyWith<$Res> get tracker {
  
  return $TrackerCopyWith<$Res>(_self.tracker, (value) {
    return _then(_self.copyWith(tracker: value));
  });
}/// Create a copy of Application
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicantProfileCopyWith<$Res> get profile {
  
  return $ApplicantProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of Application
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InterviewCopyWith<$Res>? get interview {
    if (_self.interview == null) {
    return null;
  }

  return $InterviewCopyWith<$Res>(_self.interview!, (value) {
    return _then(_self.copyWith(interview: value));
  });
}/// Create a copy of Application
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfferCopyWith<$Res>? get offer {
    if (_self.offer == null) {
    return null;
  }

  return $OfferCopyWith<$Res>(_self.offer!, (value) {
    return _then(_self.copyWith(offer: value));
  });
}/// Create a copy of Application
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FinancialAidCopyWith<$Res>? get financialAid {
    if (_self.financialAid == null) {
    return null;
  }

  return $FinancialAidCopyWith<$Res>(_self.financialAid!, (value) {
    return _then(_self.copyWith(financialAid: value));
  });
}
}


/// Adds pattern-matching-related methods to [Application].
extension ApplicationPatterns on Application {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Application value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Application() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Application value)  $default,){
final _that = this;
switch (_that) {
case _Application():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Application value)?  $default,){
final _that = this;
switch (_that) {
case _Application() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? reference,  String cycle,  String? round, @JsonKey(unknownEnumValue: Level.as_)  Level level, @JsonKey(unknownEnumValue: AppStatus.unknown)  AppStatus status, @JsonKey(name: 'status_label')  String statusLabel,  Tracker tracker, @JsonKey(name: 'form_step')  int formStep, @JsonKey(name: 'submitted_at')  String? submittedAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'documents_cleared')  bool documentsCleared, @JsonKey(name: 'interview_released')  bool interviewReleased, @JsonKey(name: 'trial_released')  bool trialReleased, @JsonKey(name: 'interview_rebook')  bool interviewRebook,  ApplicantProfile profile, @JsonKey(name: 'full_name')  String fullName, @JsonKey(name: 'city_name')  String cityName, @JsonKey(name: 'school_name')  String schoolName,  List<Guardian> guardians,  List<Sibling> siblings,  List<ResultRow> results,  List<SubjectPick> subjects,  List<ActivityRow> activities,  List<DocSlot> documents,  Interview? interview,  List<Trial> trials,  Offer? offer, @JsonKey(name: 'financial_aid')  FinancialAid? financialAid,  List<HistoryEntry> history)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Application() when $default != null:
return $default(_that.id,_that.reference,_that.cycle,_that.round,_that.level,_that.status,_that.statusLabel,_that.tracker,_that.formStep,_that.submittedAt,_that.updatedAt,_that.documentsCleared,_that.interviewReleased,_that.trialReleased,_that.interviewRebook,_that.profile,_that.fullName,_that.cityName,_that.schoolName,_that.guardians,_that.siblings,_that.results,_that.subjects,_that.activities,_that.documents,_that.interview,_that.trials,_that.offer,_that.financialAid,_that.history);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? reference,  String cycle,  String? round, @JsonKey(unknownEnumValue: Level.as_)  Level level, @JsonKey(unknownEnumValue: AppStatus.unknown)  AppStatus status, @JsonKey(name: 'status_label')  String statusLabel,  Tracker tracker, @JsonKey(name: 'form_step')  int formStep, @JsonKey(name: 'submitted_at')  String? submittedAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'documents_cleared')  bool documentsCleared, @JsonKey(name: 'interview_released')  bool interviewReleased, @JsonKey(name: 'trial_released')  bool trialReleased, @JsonKey(name: 'interview_rebook')  bool interviewRebook,  ApplicantProfile profile, @JsonKey(name: 'full_name')  String fullName, @JsonKey(name: 'city_name')  String cityName, @JsonKey(name: 'school_name')  String schoolName,  List<Guardian> guardians,  List<Sibling> siblings,  List<ResultRow> results,  List<SubjectPick> subjects,  List<ActivityRow> activities,  List<DocSlot> documents,  Interview? interview,  List<Trial> trials,  Offer? offer, @JsonKey(name: 'financial_aid')  FinancialAid? financialAid,  List<HistoryEntry> history)  $default,) {final _that = this;
switch (_that) {
case _Application():
return $default(_that.id,_that.reference,_that.cycle,_that.round,_that.level,_that.status,_that.statusLabel,_that.tracker,_that.formStep,_that.submittedAt,_that.updatedAt,_that.documentsCleared,_that.interviewReleased,_that.trialReleased,_that.interviewRebook,_that.profile,_that.fullName,_that.cityName,_that.schoolName,_that.guardians,_that.siblings,_that.results,_that.subjects,_that.activities,_that.documents,_that.interview,_that.trials,_that.offer,_that.financialAid,_that.history);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? reference,  String cycle,  String? round, @JsonKey(unknownEnumValue: Level.as_)  Level level, @JsonKey(unknownEnumValue: AppStatus.unknown)  AppStatus status, @JsonKey(name: 'status_label')  String statusLabel,  Tracker tracker, @JsonKey(name: 'form_step')  int formStep, @JsonKey(name: 'submitted_at')  String? submittedAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'documents_cleared')  bool documentsCleared, @JsonKey(name: 'interview_released')  bool interviewReleased, @JsonKey(name: 'trial_released')  bool trialReleased, @JsonKey(name: 'interview_rebook')  bool interviewRebook,  ApplicantProfile profile, @JsonKey(name: 'full_name')  String fullName, @JsonKey(name: 'city_name')  String cityName, @JsonKey(name: 'school_name')  String schoolName,  List<Guardian> guardians,  List<Sibling> siblings,  List<ResultRow> results,  List<SubjectPick> subjects,  List<ActivityRow> activities,  List<DocSlot> documents,  Interview? interview,  List<Trial> trials,  Offer? offer, @JsonKey(name: 'financial_aid')  FinancialAid? financialAid,  List<HistoryEntry> history)?  $default,) {final _that = this;
switch (_that) {
case _Application() when $default != null:
return $default(_that.id,_that.reference,_that.cycle,_that.round,_that.level,_that.status,_that.statusLabel,_that.tracker,_that.formStep,_that.submittedAt,_that.updatedAt,_that.documentsCleared,_that.interviewReleased,_that.trialReleased,_that.interviewRebook,_that.profile,_that.fullName,_that.cityName,_that.schoolName,_that.guardians,_that.siblings,_that.results,_that.subjects,_that.activities,_that.documents,_that.interview,_that.trials,_that.offer,_that.financialAid,_that.history);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Application extends Application {
  const _Application({required this.id, this.reference, this.cycle = '', this.round, @JsonKey(unknownEnumValue: Level.as_) this.level = Level.as_, @JsonKey(unknownEnumValue: AppStatus.unknown) this.status = AppStatus.draft, @JsonKey(name: 'status_label') this.statusLabel = '', this.tracker = const Tracker(), @JsonKey(name: 'form_step') this.formStep = 1, @JsonKey(name: 'submitted_at') this.submittedAt, @JsonKey(name: 'updated_at') this.updatedAt = '', @JsonKey(name: 'documents_cleared') this.documentsCleared = false, @JsonKey(name: 'interview_released') this.interviewReleased = false, @JsonKey(name: 'trial_released') this.trialReleased = false, @JsonKey(name: 'interview_rebook') this.interviewRebook = false, this.profile = const ApplicantProfile(), @JsonKey(name: 'full_name') this.fullName = '', @JsonKey(name: 'city_name') this.cityName = '', @JsonKey(name: 'school_name') this.schoolName = '',  List<Guardian> guardians = const <Guardian>[],  List<Sibling> siblings = const <Sibling>[],  List<ResultRow> results = const <ResultRow>[],  List<SubjectPick> subjects = const <SubjectPick>[],  List<ActivityRow> activities = const <ActivityRow>[],  List<DocSlot> documents = const <DocSlot>[], this.interview,  List<Trial> trials = const <Trial>[], this.offer, @JsonKey(name: 'financial_aid') this.financialAid,  List<HistoryEntry> history = const <HistoryEntry>[]}): _guardians = guardians,_siblings = siblings,_results = results,_subjects = subjects,_activities = activities,_documents = documents,_trials = trials,_history = history,super._();
  factory _Application.fromJson(Map<String, dynamic> json) => _$ApplicationFromJson(json);

@override final  int id;
@override final  String? reference;
@override@JsonKey() final  String cycle;
@override final  String? round;
@override@JsonKey(unknownEnumValue: Level.as_) final  Level level;
@override@JsonKey(unknownEnumValue: AppStatus.unknown) final  AppStatus status;
@override@JsonKey(name: 'status_label') final  String statusLabel;
@override@JsonKey() final  Tracker tracker;
@override@JsonKey(name: 'form_step') final  int formStep;
@override@JsonKey(name: 'submitted_at') final  String? submittedAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;
@override@JsonKey(name: 'documents_cleared') final  bool documentsCleared;
@override@JsonKey(name: 'interview_released') final  bool interviewReleased;
@override@JsonKey(name: 'trial_released') final  bool trialReleased;
@override@JsonKey(name: 'interview_rebook') final  bool interviewRebook;
@override@JsonKey() final  ApplicantProfile profile;
@override@JsonKey(name: 'full_name') final  String fullName;
@override@JsonKey(name: 'city_name') final  String cityName;
@override@JsonKey(name: 'school_name') final  String schoolName;
 final  List<Guardian> _guardians;
@override@JsonKey() List<Guardian> get guardians {
  if (_guardians is EqualUnmodifiableListView) return _guardians;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_guardians);
}

 final  List<Sibling> _siblings;
@override@JsonKey() List<Sibling> get siblings {
  if (_siblings is EqualUnmodifiableListView) return _siblings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_siblings);
}

 final  List<ResultRow> _results;
@override@JsonKey() List<ResultRow> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

 final  List<SubjectPick> _subjects;
@override@JsonKey() List<SubjectPick> get subjects {
  if (_subjects is EqualUnmodifiableListView) return _subjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subjects);
}

 final  List<ActivityRow> _activities;
@override@JsonKey() List<ActivityRow> get activities {
  if (_activities is EqualUnmodifiableListView) return _activities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activities);
}

 final  List<DocSlot> _documents;
@override@JsonKey() List<DocSlot> get documents {
  if (_documents is EqualUnmodifiableListView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_documents);
}

@override final  Interview? interview;
 final  List<Trial> _trials;
@override@JsonKey() List<Trial> get trials {
  if (_trials is EqualUnmodifiableListView) return _trials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trials);
}

@override final  Offer? offer;
@override@JsonKey(name: 'financial_aid') final  FinancialAid? financialAid;
 final  List<HistoryEntry> _history;
@override@JsonKey() List<HistoryEntry> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}


/// Create a copy of Application
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplicationCopyWith<_Application> get copyWith => __$ApplicationCopyWithImpl<_Application>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApplicationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Application&&(identical(other.id, id) || other.id == id)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.cycle, cycle) || other.cycle == cycle)&&(identical(other.round, round) || other.round == round)&&(identical(other.level, level) || other.level == level)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.tracker, tracker) || other.tracker == tracker)&&(identical(other.formStep, formStep) || other.formStep == formStep)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.documentsCleared, documentsCleared) || other.documentsCleared == documentsCleared)&&(identical(other.interviewReleased, interviewReleased) || other.interviewReleased == interviewReleased)&&(identical(other.trialReleased, trialReleased) || other.trialReleased == trialReleased)&&(identical(other.interviewRebook, interviewRebook) || other.interviewRebook == interviewRebook)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.schoolName, schoolName) || other.schoolName == schoolName)&&const DeepCollectionEquality().equals(other.guardians, _guardians)&&const DeepCollectionEquality().equals(other.siblings, _siblings)&&const DeepCollectionEquality().equals(other.results, _results)&&const DeepCollectionEquality().equals(other.subjects, _subjects)&&const DeepCollectionEquality().equals(other.activities, _activities)&&const DeepCollectionEquality().equals(other.documents, _documents)&&(identical(other.interview, interview) || other.interview == interview)&&const DeepCollectionEquality().equals(other.trials, _trials)&&(identical(other.offer, offer) || other.offer == offer)&&(identical(other.financialAid, financialAid) || other.financialAid == financialAid)&&const DeepCollectionEquality().equals(other.history, _history));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,reference,cycle,round,level,status,statusLabel,tracker,formStep,submittedAt,updatedAt,documentsCleared,interviewReleased,trialReleased,interviewRebook,profile,fullName,cityName,schoolName,const DeepCollectionEquality().hash(_guardians),const DeepCollectionEquality().hash(_siblings),const DeepCollectionEquality().hash(_results),const DeepCollectionEquality().hash(_subjects),const DeepCollectionEquality().hash(_activities),const DeepCollectionEquality().hash(_documents),interview,const DeepCollectionEquality().hash(_trials),offer,financialAid,const DeepCollectionEquality().hash(_history)]);
}

@override
String toString() {
    return 'Application(id: $id, reference: $reference, cycle: $cycle, round: $round, level: $level, status: $status, statusLabel: $statusLabel, tracker: $tracker, formStep: $formStep, submittedAt: $submittedAt, updatedAt: $updatedAt, documentsCleared: $documentsCleared, interviewReleased: $interviewReleased, trialReleased: $trialReleased, interviewRebook: $interviewRebook, profile: $profile, fullName: $fullName, cityName: $cityName, schoolName: $schoolName, guardians: $guardians, siblings: $siblings, results: $results, subjects: $subjects, activities: $activities, documents: $documents, interview: $interview, trials: $trials, offer: $offer, financialAid: $financialAid, history: $history)';
}


}

/// @nodoc
abstract mixin class _$ApplicationCopyWith<$Res> implements $ApplicationCopyWith<$Res> {
  factory _$ApplicationCopyWith(_Application value, $Res Function(_Application) _then) = __$ApplicationCopyWithImpl;
@override @useResult
$Res call({
 int id, String? reference, String cycle, String? round,@JsonKey(unknownEnumValue: Level.as_) Level level,@JsonKey(unknownEnumValue: AppStatus.unknown) AppStatus status,@JsonKey(name: 'status_label') String statusLabel, Tracker tracker,@JsonKey(name: 'form_step') int formStep,@JsonKey(name: 'submitted_at') String? submittedAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'documents_cleared') bool documentsCleared,@JsonKey(name: 'interview_released') bool interviewReleased,@JsonKey(name: 'trial_released') bool trialReleased,@JsonKey(name: 'interview_rebook') bool interviewRebook, ApplicantProfile profile,@JsonKey(name: 'full_name') String fullName,@JsonKey(name: 'city_name') String cityName,@JsonKey(name: 'school_name') String schoolName, List<Guardian> guardians, List<Sibling> siblings, List<ResultRow> results, List<SubjectPick> subjects, List<ActivityRow> activities, List<DocSlot> documents, Interview? interview, List<Trial> trials, Offer? offer,@JsonKey(name: 'financial_aid') FinancialAid? financialAid, List<HistoryEntry> history
});


@override $TrackerCopyWith<$Res> get tracker;@override $ApplicantProfileCopyWith<$Res> get profile;@override $InterviewCopyWith<$Res>? get interview;@override $OfferCopyWith<$Res>? get offer;@override $FinancialAidCopyWith<$Res>? get financialAid;

}
/// @nodoc
class __$ApplicationCopyWithImpl<$Res>
    implements _$ApplicationCopyWith<$Res> {
  __$ApplicationCopyWithImpl(this._self, this._then);

  final _Application _self;
  final $Res Function(_Application) _then;

/// Create a copy of Application
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reference = freezed,Object? cycle = null,Object? round = freezed,Object? level = null,Object? status = null,Object? statusLabel = null,Object? tracker = null,Object? formStep = null,Object? submittedAt = freezed,Object? updatedAt = null,Object? documentsCleared = null,Object? interviewReleased = null,Object? trialReleased = null,Object? interviewRebook = null,Object? profile = null,Object? fullName = null,Object? cityName = null,Object? schoolName = null,Object? guardians = null,Object? siblings = null,Object? results = null,Object? subjects = null,Object? activities = null,Object? documents = null,Object? interview = freezed,Object? trials = null,Object? offer = freezed,Object? financialAid = freezed,Object? history = null,}) {
  return _then(_Application(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,reference: freezed == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String?,cycle: null == cycle ? _self.cycle : cycle // ignore: cast_nullable_to_non_nullable
as String,round: freezed == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as String?,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as Level,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AppStatus,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,tracker: null == tracker ? _self.tracker : tracker // ignore: cast_nullable_to_non_nullable
as Tracker,formStep: null == formStep ? _self.formStep : formStep // ignore: cast_nullable_to_non_nullable
as int,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,documentsCleared: null == documentsCleared ? _self.documentsCleared : documentsCleared // ignore: cast_nullable_to_non_nullable
as bool,interviewReleased: null == interviewReleased ? _self.interviewReleased : interviewReleased // ignore: cast_nullable_to_non_nullable
as bool,trialReleased: null == trialReleased ? _self.trialReleased : trialReleased // ignore: cast_nullable_to_non_nullable
as bool,interviewRebook: null == interviewRebook ? _self.interviewRebook : interviewRebook // ignore: cast_nullable_to_non_nullable
as bool,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ApplicantProfile,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,schoolName: null == schoolName ? _self.schoolName : schoolName // ignore: cast_nullable_to_non_nullable
as String,guardians: null == guardians ? _self._guardians : guardians // ignore: cast_nullable_to_non_nullable
as List<Guardian>,siblings: null == siblings ? _self._siblings : siblings // ignore: cast_nullable_to_non_nullable
as List<Sibling>,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<ResultRow>,subjects: null == subjects ? _self._subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<SubjectPick>,activities: null == activities ? _self._activities : activities // ignore: cast_nullable_to_non_nullable
as List<ActivityRow>,documents: null == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as List<DocSlot>,interview: freezed == interview ? _self.interview : interview // ignore: cast_nullable_to_non_nullable
as Interview?,trials: null == trials ? _self._trials : trials // ignore: cast_nullable_to_non_nullable
as List<Trial>,offer: freezed == offer ? _self.offer : offer // ignore: cast_nullable_to_non_nullable
as Offer?,financialAid: freezed == financialAid ? _self.financialAid : financialAid // ignore: cast_nullable_to_non_nullable
as FinancialAid?,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<HistoryEntry>,
  ));
}

/// Create a copy of Application
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrackerCopyWith<$Res> get tracker {
  
  return $TrackerCopyWith<$Res>(_self.tracker, (value) {
    return _then(_self.copyWith(tracker: value));
  });
}/// Create a copy of Application
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicantProfileCopyWith<$Res> get profile {
  
  return $ApplicantProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of Application
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InterviewCopyWith<$Res>? get interview {
    if (_self.interview == null) {
    return null;
  }

  return $InterviewCopyWith<$Res>(_self.interview!, (value) {
    return _then(_self.copyWith(interview: value));
  });
}/// Create a copy of Application
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfferCopyWith<$Res>? get offer {
    if (_self.offer == null) {
    return null;
  }

  return $OfferCopyWith<$Res>(_self.offer!, (value) {
    return _then(_self.copyWith(offer: value));
  });
}/// Create a copy of Application
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FinancialAidCopyWith<$Res>? get financialAid {
    if (_self.financialAid == null) {
    return null;
  }

  return $FinancialAidCopyWith<$Res>(_self.financialAid!, (value) {
    return _then(_self.copyWith(financialAid: value));
  });
}
}

// dart format on
