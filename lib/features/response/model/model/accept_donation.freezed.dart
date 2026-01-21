// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accept_donation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AcceptDonation {

 String get donationRequestId; String get acceptId; String get userId; String get status;
/// Create a copy of AcceptDonation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AcceptDonationCopyWith<AcceptDonation> get copyWith => _$AcceptDonationCopyWithImpl<AcceptDonation>(this as AcceptDonation, _$identity);

  /// Serializes this AcceptDonation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AcceptDonation&&(identical(other.donationRequestId, donationRequestId) || other.donationRequestId == donationRequestId)&&(identical(other.acceptId, acceptId) || other.acceptId == acceptId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,donationRequestId,acceptId,userId,status);

@override
String toString() {
  return 'AcceptDonation(donationRequestId: $donationRequestId, acceptId: $acceptId, userId: $userId, status: $status)';
}


}

/// @nodoc
abstract mixin class $AcceptDonationCopyWith<$Res>  {
  factory $AcceptDonationCopyWith(AcceptDonation value, $Res Function(AcceptDonation) _then) = _$AcceptDonationCopyWithImpl;
@useResult
$Res call({
 String donationRequestId, String acceptId, String userId, String status
});




}
/// @nodoc
class _$AcceptDonationCopyWithImpl<$Res>
    implements $AcceptDonationCopyWith<$Res> {
  _$AcceptDonationCopyWithImpl(this._self, this._then);

  final AcceptDonation _self;
  final $Res Function(AcceptDonation) _then;

/// Create a copy of AcceptDonation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? donationRequestId = null,Object? acceptId = null,Object? userId = null,Object? status = null,}) {
  return _then(_self.copyWith(
donationRequestId: null == donationRequestId ? _self.donationRequestId : donationRequestId // ignore: cast_nullable_to_non_nullable
as String,acceptId: null == acceptId ? _self.acceptId : acceptId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AcceptDonation].
extension AcceptDonationPatterns on AcceptDonation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AcceptDonation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AcceptDonation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AcceptDonation value)  $default,){
final _that = this;
switch (_that) {
case _AcceptDonation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AcceptDonation value)?  $default,){
final _that = this;
switch (_that) {
case _AcceptDonation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String donationRequestId,  String acceptId,  String userId,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AcceptDonation() when $default != null:
return $default(_that.donationRequestId,_that.acceptId,_that.userId,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String donationRequestId,  String acceptId,  String userId,  String status)  $default,) {final _that = this;
switch (_that) {
case _AcceptDonation():
return $default(_that.donationRequestId,_that.acceptId,_that.userId,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String donationRequestId,  String acceptId,  String userId,  String status)?  $default,) {final _that = this;
switch (_that) {
case _AcceptDonation() when $default != null:
return $default(_that.donationRequestId,_that.acceptId,_that.userId,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AcceptDonation implements AcceptDonation {
  const _AcceptDonation({required this.donationRequestId, required this.acceptId, required this.userId, required this.status});
  factory _AcceptDonation.fromJson(Map<String, dynamic> json) => _$AcceptDonationFromJson(json);

@override final  String donationRequestId;
@override final  String acceptId;
@override final  String userId;
@override final  String status;

/// Create a copy of AcceptDonation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AcceptDonationCopyWith<_AcceptDonation> get copyWith => __$AcceptDonationCopyWithImpl<_AcceptDonation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AcceptDonationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AcceptDonation&&(identical(other.donationRequestId, donationRequestId) || other.donationRequestId == donationRequestId)&&(identical(other.acceptId, acceptId) || other.acceptId == acceptId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,donationRequestId,acceptId,userId,status);

@override
String toString() {
  return 'AcceptDonation(donationRequestId: $donationRequestId, acceptId: $acceptId, userId: $userId, status: $status)';
}


}

/// @nodoc
abstract mixin class _$AcceptDonationCopyWith<$Res> implements $AcceptDonationCopyWith<$Res> {
  factory _$AcceptDonationCopyWith(_AcceptDonation value, $Res Function(_AcceptDonation) _then) = __$AcceptDonationCopyWithImpl;
@override @useResult
$Res call({
 String donationRequestId, String acceptId, String userId, String status
});




}
/// @nodoc
class __$AcceptDonationCopyWithImpl<$Res>
    implements _$AcceptDonationCopyWith<$Res> {
  __$AcceptDonationCopyWithImpl(this._self, this._then);

  final _AcceptDonation _self;
  final $Res Function(_AcceptDonation) _then;

/// Create a copy of AcceptDonation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? donationRequestId = null,Object? acceptId = null,Object? userId = null,Object? status = null,}) {
  return _then(_AcceptDonation(
donationRequestId: null == donationRequestId ? _self.donationRequestId : donationRequestId // ignore: cast_nullable_to_non_nullable
as String,acceptId: null == acceptId ? _self.acceptId : acceptId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
