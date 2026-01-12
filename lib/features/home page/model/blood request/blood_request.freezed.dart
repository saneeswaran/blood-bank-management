// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blood_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BloodRequest {

 String? get requestId; String get requestedBy; String? get patientName; String get bloodGroup; int get units; String get hospitalName; Map<String, dynamic> get location; String get contactPhone;/// high / medium / low
 String get urgency;/// active / fulfilled / expired / cancelled
 String get status;/// Firestore timestamps
 String get createdAt;
/// Create a copy of BloodRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BloodRequestCopyWith<BloodRequest> get copyWith => _$BloodRequestCopyWithImpl<BloodRequest>(this as BloodRequest, _$identity);

  /// Serializes this BloodRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BloodRequest&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.requestedBy, requestedBy) || other.requestedBy == requestedBy)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&(identical(other.bloodGroup, bloodGroup) || other.bloodGroup == bloodGroup)&&(identical(other.units, units) || other.units == units)&&(identical(other.hospitalName, hospitalName) || other.hospitalName == hospitalName)&&const DeepCollectionEquality().equals(other.location, location)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.urgency, urgency) || other.urgency == urgency)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,requestedBy,patientName,bloodGroup,units,hospitalName,const DeepCollectionEquality().hash(location),contactPhone,urgency,status,createdAt);

@override
String toString() {
  return 'BloodRequest(requestId: $requestId, requestedBy: $requestedBy, patientName: $patientName, bloodGroup: $bloodGroup, units: $units, hospitalName: $hospitalName, location: $location, contactPhone: $contactPhone, urgency: $urgency, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $BloodRequestCopyWith<$Res>  {
  factory $BloodRequestCopyWith(BloodRequest value, $Res Function(BloodRequest) _then) = _$BloodRequestCopyWithImpl;
@useResult
$Res call({
 String? requestId, String requestedBy, String? patientName, String bloodGroup, int units, String hospitalName, Map<String, dynamic> location, String contactPhone, String urgency, String status, String createdAt
});




}
/// @nodoc
class _$BloodRequestCopyWithImpl<$Res>
    implements $BloodRequestCopyWith<$Res> {
  _$BloodRequestCopyWithImpl(this._self, this._then);

  final BloodRequest _self;
  final $Res Function(BloodRequest) _then;

/// Create a copy of BloodRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = freezed,Object? requestedBy = null,Object? patientName = freezed,Object? bloodGroup = null,Object? units = null,Object? hospitalName = null,Object? location = null,Object? contactPhone = null,Object? urgency = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,requestedBy: null == requestedBy ? _self.requestedBy : requestedBy // ignore: cast_nullable_to_non_nullable
as String,patientName: freezed == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String?,bloodGroup: null == bloodGroup ? _self.bloodGroup : bloodGroup // ignore: cast_nullable_to_non_nullable
as String,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as int,hospitalName: null == hospitalName ? _self.hospitalName : hospitalName // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,contactPhone: null == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String,urgency: null == urgency ? _self.urgency : urgency // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BloodRequest].
extension BloodRequestPatterns on BloodRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BloodRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BloodRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BloodRequest value)  $default,){
final _that = this;
switch (_that) {
case _BloodRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BloodRequest value)?  $default,){
final _that = this;
switch (_that) {
case _BloodRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? requestId,  String requestedBy,  String? patientName,  String bloodGroup,  int units,  String hospitalName,  Map<String, dynamic> location,  String contactPhone,  String urgency,  String status,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BloodRequest() when $default != null:
return $default(_that.requestId,_that.requestedBy,_that.patientName,_that.bloodGroup,_that.units,_that.hospitalName,_that.location,_that.contactPhone,_that.urgency,_that.status,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? requestId,  String requestedBy,  String? patientName,  String bloodGroup,  int units,  String hospitalName,  Map<String, dynamic> location,  String contactPhone,  String urgency,  String status,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _BloodRequest():
return $default(_that.requestId,_that.requestedBy,_that.patientName,_that.bloodGroup,_that.units,_that.hospitalName,_that.location,_that.contactPhone,_that.urgency,_that.status,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? requestId,  String requestedBy,  String? patientName,  String bloodGroup,  int units,  String hospitalName,  Map<String, dynamic> location,  String contactPhone,  String urgency,  String status,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _BloodRequest() when $default != null:
return $default(_that.requestId,_that.requestedBy,_that.patientName,_that.bloodGroup,_that.units,_that.hospitalName,_that.location,_that.contactPhone,_that.urgency,_that.status,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BloodRequest implements BloodRequest {
  const _BloodRequest({this.requestId, required this.requestedBy, this.patientName, required this.bloodGroup, required this.units, required this.hospitalName, required final  Map<String, dynamic> location, required this.contactPhone, required this.urgency, required this.status, required this.createdAt}): _location = location;
  factory _BloodRequest.fromJson(Map<String, dynamic> json) => _$BloodRequestFromJson(json);

@override final  String? requestId;
@override final  String requestedBy;
@override final  String? patientName;
@override final  String bloodGroup;
@override final  int units;
@override final  String hospitalName;
 final  Map<String, dynamic> _location;
@override Map<String, dynamic> get location {
  if (_location is EqualUnmodifiableMapView) return _location;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_location);
}

@override final  String contactPhone;
/// high / medium / low
@override final  String urgency;
/// active / fulfilled / expired / cancelled
@override final  String status;
/// Firestore timestamps
@override final  String createdAt;

/// Create a copy of BloodRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BloodRequestCopyWith<_BloodRequest> get copyWith => __$BloodRequestCopyWithImpl<_BloodRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BloodRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BloodRequest&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.requestedBy, requestedBy) || other.requestedBy == requestedBy)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&(identical(other.bloodGroup, bloodGroup) || other.bloodGroup == bloodGroup)&&(identical(other.units, units) || other.units == units)&&(identical(other.hospitalName, hospitalName) || other.hospitalName == hospitalName)&&const DeepCollectionEquality().equals(other._location, _location)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.urgency, urgency) || other.urgency == urgency)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,requestedBy,patientName,bloodGroup,units,hospitalName,const DeepCollectionEquality().hash(_location),contactPhone,urgency,status,createdAt);

@override
String toString() {
  return 'BloodRequest(requestId: $requestId, requestedBy: $requestedBy, patientName: $patientName, bloodGroup: $bloodGroup, units: $units, hospitalName: $hospitalName, location: $location, contactPhone: $contactPhone, urgency: $urgency, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BloodRequestCopyWith<$Res> implements $BloodRequestCopyWith<$Res> {
  factory _$BloodRequestCopyWith(_BloodRequest value, $Res Function(_BloodRequest) _then) = __$BloodRequestCopyWithImpl;
@override @useResult
$Res call({
 String? requestId, String requestedBy, String? patientName, String bloodGroup, int units, String hospitalName, Map<String, dynamic> location, String contactPhone, String urgency, String status, String createdAt
});




}
/// @nodoc
class __$BloodRequestCopyWithImpl<$Res>
    implements _$BloodRequestCopyWith<$Res> {
  __$BloodRequestCopyWithImpl(this._self, this._then);

  final _BloodRequest _self;
  final $Res Function(_BloodRequest) _then;

/// Create a copy of BloodRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = freezed,Object? requestedBy = null,Object? patientName = freezed,Object? bloodGroup = null,Object? units = null,Object? hospitalName = null,Object? location = null,Object? contactPhone = null,Object? urgency = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_BloodRequest(
requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,requestedBy: null == requestedBy ? _self.requestedBy : requestedBy // ignore: cast_nullable_to_non_nullable
as String,patientName: freezed == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String?,bloodGroup: null == bloodGroup ? _self.bloodGroup : bloodGroup // ignore: cast_nullable_to_non_nullable
as String,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as int,hospitalName: null == hospitalName ? _self.hospitalName : hospitalName // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self._location : location // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,contactPhone: null == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String,urgency: null == urgency ? _self.urgency : urgency // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
