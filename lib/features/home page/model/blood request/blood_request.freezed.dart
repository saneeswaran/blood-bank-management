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

 String? get requestId; String get requestedBy; String? get patientName; String get bloodGroup; int get units; String get hospitalName; String get city; String get area; Location get location; String get contactName; String get contactPhone;/// high / medium / low
 String get urgency;/// active / fulfilled / expired / cancelled
 String get status;/// Firestore timestamps
 String get createdAt;//foods and services
 bool? get food; bool? get services;
/// Create a copy of BloodRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BloodRequestCopyWith<BloodRequest> get copyWith => _$BloodRequestCopyWithImpl<BloodRequest>(this as BloodRequest, _$identity);

  /// Serializes this BloodRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BloodRequest&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.requestedBy, requestedBy) || other.requestedBy == requestedBy)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&(identical(other.bloodGroup, bloodGroup) || other.bloodGroup == bloodGroup)&&(identical(other.units, units) || other.units == units)&&(identical(other.hospitalName, hospitalName) || other.hospitalName == hospitalName)&&(identical(other.city, city) || other.city == city)&&(identical(other.area, area) || other.area == area)&&(identical(other.location, location) || other.location == location)&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.urgency, urgency) || other.urgency == urgency)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.food, food) || other.food == food)&&(identical(other.services, services) || other.services == services));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,requestedBy,patientName,bloodGroup,units,hospitalName,city,area,location,contactName,contactPhone,urgency,status,createdAt,food,services);

@override
String toString() {
  return 'BloodRequest(requestId: $requestId, requestedBy: $requestedBy, patientName: $patientName, bloodGroup: $bloodGroup, units: $units, hospitalName: $hospitalName, city: $city, area: $area, location: $location, contactName: $contactName, contactPhone: $contactPhone, urgency: $urgency, status: $status, createdAt: $createdAt, food: $food, services: $services)';
}


}

/// @nodoc
abstract mixin class $BloodRequestCopyWith<$Res>  {
  factory $BloodRequestCopyWith(BloodRequest value, $Res Function(BloodRequest) _then) = _$BloodRequestCopyWithImpl;
@useResult
$Res call({
 String? requestId, String requestedBy, String? patientName, String bloodGroup, int units, String hospitalName, String city, String area, Location location, String contactName, String contactPhone, String urgency, String status, String createdAt, bool? food, bool? services
});


$LocationCopyWith<$Res> get location;

}
/// @nodoc
class _$BloodRequestCopyWithImpl<$Res>
    implements $BloodRequestCopyWith<$Res> {
  _$BloodRequestCopyWithImpl(this._self, this._then);

  final BloodRequest _self;
  final $Res Function(BloodRequest) _then;

/// Create a copy of BloodRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = freezed,Object? requestedBy = null,Object? patientName = freezed,Object? bloodGroup = null,Object? units = null,Object? hospitalName = null,Object? city = null,Object? area = null,Object? location = null,Object? contactName = null,Object? contactPhone = null,Object? urgency = null,Object? status = null,Object? createdAt = null,Object? food = freezed,Object? services = freezed,}) {
  return _then(_self.copyWith(
requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,requestedBy: null == requestedBy ? _self.requestedBy : requestedBy // ignore: cast_nullable_to_non_nullable
as String,patientName: freezed == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String?,bloodGroup: null == bloodGroup ? _self.bloodGroup : bloodGroup // ignore: cast_nullable_to_non_nullable
as String,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as int,hospitalName: null == hospitalName ? _self.hospitalName : hospitalName // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location,contactName: null == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String,contactPhone: null == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String,urgency: null == urgency ? _self.urgency : urgency // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,food: freezed == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as bool?,services: freezed == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of BloodRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res> get location {
  
  return $LocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? requestId,  String requestedBy,  String? patientName,  String bloodGroup,  int units,  String hospitalName,  String city,  String area,  Location location,  String contactName,  String contactPhone,  String urgency,  String status,  String createdAt,  bool? food,  bool? services)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BloodRequest() when $default != null:
return $default(_that.requestId,_that.requestedBy,_that.patientName,_that.bloodGroup,_that.units,_that.hospitalName,_that.city,_that.area,_that.location,_that.contactName,_that.contactPhone,_that.urgency,_that.status,_that.createdAt,_that.food,_that.services);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? requestId,  String requestedBy,  String? patientName,  String bloodGroup,  int units,  String hospitalName,  String city,  String area,  Location location,  String contactName,  String contactPhone,  String urgency,  String status,  String createdAt,  bool? food,  bool? services)  $default,) {final _that = this;
switch (_that) {
case _BloodRequest():
return $default(_that.requestId,_that.requestedBy,_that.patientName,_that.bloodGroup,_that.units,_that.hospitalName,_that.city,_that.area,_that.location,_that.contactName,_that.contactPhone,_that.urgency,_that.status,_that.createdAt,_that.food,_that.services);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? requestId,  String requestedBy,  String? patientName,  String bloodGroup,  int units,  String hospitalName,  String city,  String area,  Location location,  String contactName,  String contactPhone,  String urgency,  String status,  String createdAt,  bool? food,  bool? services)?  $default,) {final _that = this;
switch (_that) {
case _BloodRequest() when $default != null:
return $default(_that.requestId,_that.requestedBy,_that.patientName,_that.bloodGroup,_that.units,_that.hospitalName,_that.city,_that.area,_that.location,_that.contactName,_that.contactPhone,_that.urgency,_that.status,_that.createdAt,_that.food,_that.services);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BloodRequest implements BloodRequest {
  const _BloodRequest({this.requestId, required this.requestedBy, this.patientName, required this.bloodGroup, required this.units, required this.hospitalName, required this.city, required this.area, required this.location, required this.contactName, required this.contactPhone, required this.urgency, required this.status, required this.createdAt, this.food = false, this.services = false});
  factory _BloodRequest.fromJson(Map<String, dynamic> json) => _$BloodRequestFromJson(json);

@override final  String? requestId;
@override final  String requestedBy;
@override final  String? patientName;
@override final  String bloodGroup;
@override final  int units;
@override final  String hospitalName;
@override final  String city;
@override final  String area;
@override final  Location location;
@override final  String contactName;
@override final  String contactPhone;
/// high / medium / low
@override final  String urgency;
/// active / fulfilled / expired / cancelled
@override final  String status;
/// Firestore timestamps
@override final  String createdAt;
//foods and services
@override@JsonKey() final  bool? food;
@override@JsonKey() final  bool? services;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BloodRequest&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.requestedBy, requestedBy) || other.requestedBy == requestedBy)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&(identical(other.bloodGroup, bloodGroup) || other.bloodGroup == bloodGroup)&&(identical(other.units, units) || other.units == units)&&(identical(other.hospitalName, hospitalName) || other.hospitalName == hospitalName)&&(identical(other.city, city) || other.city == city)&&(identical(other.area, area) || other.area == area)&&(identical(other.location, location) || other.location == location)&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.urgency, urgency) || other.urgency == urgency)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.food, food) || other.food == food)&&(identical(other.services, services) || other.services == services));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,requestedBy,patientName,bloodGroup,units,hospitalName,city,area,location,contactName,contactPhone,urgency,status,createdAt,food,services);

@override
String toString() {
  return 'BloodRequest(requestId: $requestId, requestedBy: $requestedBy, patientName: $patientName, bloodGroup: $bloodGroup, units: $units, hospitalName: $hospitalName, city: $city, area: $area, location: $location, contactName: $contactName, contactPhone: $contactPhone, urgency: $urgency, status: $status, createdAt: $createdAt, food: $food, services: $services)';
}


}

/// @nodoc
abstract mixin class _$BloodRequestCopyWith<$Res> implements $BloodRequestCopyWith<$Res> {
  factory _$BloodRequestCopyWith(_BloodRequest value, $Res Function(_BloodRequest) _then) = __$BloodRequestCopyWithImpl;
@override @useResult
$Res call({
 String? requestId, String requestedBy, String? patientName, String bloodGroup, int units, String hospitalName, String city, String area, Location location, String contactName, String contactPhone, String urgency, String status, String createdAt, bool? food, bool? services
});


@override $LocationCopyWith<$Res> get location;

}
/// @nodoc
class __$BloodRequestCopyWithImpl<$Res>
    implements _$BloodRequestCopyWith<$Res> {
  __$BloodRequestCopyWithImpl(this._self, this._then);

  final _BloodRequest _self;
  final $Res Function(_BloodRequest) _then;

/// Create a copy of BloodRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = freezed,Object? requestedBy = null,Object? patientName = freezed,Object? bloodGroup = null,Object? units = null,Object? hospitalName = null,Object? city = null,Object? area = null,Object? location = null,Object? contactName = null,Object? contactPhone = null,Object? urgency = null,Object? status = null,Object? createdAt = null,Object? food = freezed,Object? services = freezed,}) {
  return _then(_BloodRequest(
requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,requestedBy: null == requestedBy ? _self.requestedBy : requestedBy // ignore: cast_nullable_to_non_nullable
as String,patientName: freezed == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String?,bloodGroup: null == bloodGroup ? _self.bloodGroup : bloodGroup // ignore: cast_nullable_to_non_nullable
as String,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as int,hospitalName: null == hospitalName ? _self.hospitalName : hospitalName // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location,contactName: null == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String,contactPhone: null == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String,urgency: null == urgency ? _self.urgency : urgency // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,food: freezed == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as bool?,services: freezed == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of BloodRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res> get location {
  
  return $LocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}

// dart format on
