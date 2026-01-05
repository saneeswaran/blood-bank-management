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

 String? get reqId; String get name; String get bloodGroup; String get phone; String get email; Location get location; String get bloodType; String get date;
/// Create a copy of BloodRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BloodRequestCopyWith<BloodRequest> get copyWith => _$BloodRequestCopyWithImpl<BloodRequest>(this as BloodRequest, _$identity);

  /// Serializes this BloodRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BloodRequest&&(identical(other.reqId, reqId) || other.reqId == reqId)&&(identical(other.name, name) || other.name == name)&&(identical(other.bloodGroup, bloodGroup) || other.bloodGroup == bloodGroup)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.location, location) || other.location == location)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reqId,name,bloodGroup,phone,email,location,bloodType,date);

@override
String toString() {
  return 'BloodRequest(reqId: $reqId, name: $name, bloodGroup: $bloodGroup, phone: $phone, email: $email, location: $location, bloodType: $bloodType, date: $date)';
}


}

/// @nodoc
abstract mixin class $BloodRequestCopyWith<$Res>  {
  factory $BloodRequestCopyWith(BloodRequest value, $Res Function(BloodRequest) _then) = _$BloodRequestCopyWithImpl;
@useResult
$Res call({
 String? reqId, String name, String bloodGroup, String phone, String email, Location location, String bloodType, String date
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
@pragma('vm:prefer-inline') @override $Res call({Object? reqId = freezed,Object? name = null,Object? bloodGroup = null,Object? phone = null,Object? email = null,Object? location = null,Object? bloodType = null,Object? date = null,}) {
  return _then(_self.copyWith(
reqId: freezed == reqId ? _self.reqId : reqId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bloodGroup: null == bloodGroup ? _self.bloodGroup : bloodGroup // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location,bloodType: null == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? reqId,  String name,  String bloodGroup,  String phone,  String email,  Location location,  String bloodType,  String date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BloodRequest() when $default != null:
return $default(_that.reqId,_that.name,_that.bloodGroup,_that.phone,_that.email,_that.location,_that.bloodType,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? reqId,  String name,  String bloodGroup,  String phone,  String email,  Location location,  String bloodType,  String date)  $default,) {final _that = this;
switch (_that) {
case _BloodRequest():
return $default(_that.reqId,_that.name,_that.bloodGroup,_that.phone,_that.email,_that.location,_that.bloodType,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? reqId,  String name,  String bloodGroup,  String phone,  String email,  Location location,  String bloodType,  String date)?  $default,) {final _that = this;
switch (_that) {
case _BloodRequest() when $default != null:
return $default(_that.reqId,_that.name,_that.bloodGroup,_that.phone,_that.email,_that.location,_that.bloodType,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BloodRequest implements BloodRequest {
  const _BloodRequest({this.reqId, required this.name, required this.bloodGroup, required this.phone, required this.email, required this.location, required this.bloodType, required this.date});
  factory _BloodRequest.fromJson(Map<String, dynamic> json) => _$BloodRequestFromJson(json);

@override final  String? reqId;
@override final  String name;
@override final  String bloodGroup;
@override final  String phone;
@override final  String email;
@override final  Location location;
@override final  String bloodType;
@override final  String date;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BloodRequest&&(identical(other.reqId, reqId) || other.reqId == reqId)&&(identical(other.name, name) || other.name == name)&&(identical(other.bloodGroup, bloodGroup) || other.bloodGroup == bloodGroup)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.location, location) || other.location == location)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reqId,name,bloodGroup,phone,email,location,bloodType,date);

@override
String toString() {
  return 'BloodRequest(reqId: $reqId, name: $name, bloodGroup: $bloodGroup, phone: $phone, email: $email, location: $location, bloodType: $bloodType, date: $date)';
}


}

/// @nodoc
abstract mixin class _$BloodRequestCopyWith<$Res> implements $BloodRequestCopyWith<$Res> {
  factory _$BloodRequestCopyWith(_BloodRequest value, $Res Function(_BloodRequest) _then) = __$BloodRequestCopyWithImpl;
@override @useResult
$Res call({
 String? reqId, String name, String bloodGroup, String phone, String email, Location location, String bloodType, String date
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
@override @pragma('vm:prefer-inline') $Res call({Object? reqId = freezed,Object? name = null,Object? bloodGroup = null,Object? phone = null,Object? email = null,Object? location = null,Object? bloodType = null,Object? date = null,}) {
  return _then(_BloodRequest(
reqId: freezed == reqId ? _self.reqId : reqId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bloodGroup: null == bloodGroup ? _self.bloodGroup : bloodGroup // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location,bloodType: null == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
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
