// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

 String? get id; String? get image; String get name; String get email; String? get fcmToken; Map<String, dynamic> get location; int? get donationCount; bool? get isDonor; bool get isAvailable; String? get lastDonationDate; String? get availableFrom;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.image, image) || other.image == image)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&const DeepCollectionEquality().equals(other.location, location)&&(identical(other.donationCount, donationCount) || other.donationCount == donationCount)&&(identical(other.isDonor, isDonor) || other.isDonor == isDonor)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.lastDonationDate, lastDonationDate) || other.lastDonationDate == lastDonationDate)&&(identical(other.availableFrom, availableFrom) || other.availableFrom == availableFrom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,image,name,email,fcmToken,const DeepCollectionEquality().hash(location),donationCount,isDonor,isAvailable,lastDonationDate,availableFrom);

@override
String toString() {
  return 'UserModel(id: $id, image: $image, name: $name, email: $email, fcmToken: $fcmToken, location: $location, donationCount: $donationCount, isDonor: $isDonor, isAvailable: $isAvailable, lastDonationDate: $lastDonationDate, availableFrom: $availableFrom)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? image, String name, String email, String? fcmToken, Map<String, dynamic> location, int? donationCount, bool? isDonor, bool isAvailable, String? lastDonationDate, String? availableFrom
});




}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? image = freezed,Object? name = null,Object? email = null,Object? fcmToken = freezed,Object? location = null,Object? donationCount = freezed,Object? isDonor = freezed,Object? isAvailable = null,Object? lastDonationDate = freezed,Object? availableFrom = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fcmToken: freezed == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String?,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,donationCount: freezed == donationCount ? _self.donationCount : donationCount // ignore: cast_nullable_to_non_nullable
as int?,isDonor: freezed == isDonor ? _self.isDonor : isDonor // ignore: cast_nullable_to_non_nullable
as bool?,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,lastDonationDate: freezed == lastDonationDate ? _self.lastDonationDate : lastDonationDate // ignore: cast_nullable_to_non_nullable
as String?,availableFrom: freezed == availableFrom ? _self.availableFrom : availableFrom // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? image,  String name,  String email,  String? fcmToken,  Map<String, dynamic> location,  int? donationCount,  bool? isDonor,  bool isAvailable,  String? lastDonationDate,  String? availableFrom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.image,_that.name,_that.email,_that.fcmToken,_that.location,_that.donationCount,_that.isDonor,_that.isAvailable,_that.lastDonationDate,_that.availableFrom);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? image,  String name,  String email,  String? fcmToken,  Map<String, dynamic> location,  int? donationCount,  bool? isDonor,  bool isAvailable,  String? lastDonationDate,  String? availableFrom)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.id,_that.image,_that.name,_that.email,_that.fcmToken,_that.location,_that.donationCount,_that.isDonor,_that.isAvailable,_that.lastDonationDate,_that.availableFrom);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? image,  String name,  String email,  String? fcmToken,  Map<String, dynamic> location,  int? donationCount,  bool? isDonor,  bool isAvailable,  String? lastDonationDate,  String? availableFrom)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.image,_that.name,_that.email,_that.fcmToken,_that.location,_that.donationCount,_that.isDonor,_that.isAvailable,_that.lastDonationDate,_that.availableFrom);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel implements UserModel {
  const _UserModel({this.id, this.image, required this.name, required this.email, required this.fcmToken, required final  Map<String, dynamic> location, this.donationCount = 0, this.isDonor = false, this.isAvailable = true, this.lastDonationDate, this.availableFrom}): _location = location;
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override final  String? id;
@override final  String? image;
@override final  String name;
@override final  String email;
@override final  String? fcmToken;
 final  Map<String, dynamic> _location;
@override Map<String, dynamic> get location {
  if (_location is EqualUnmodifiableMapView) return _location;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_location);
}

@override@JsonKey() final  int? donationCount;
@override@JsonKey() final  bool? isDonor;
@override@JsonKey() final  bool isAvailable;
@override final  String? lastDonationDate;
@override final  String? availableFrom;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.image, image) || other.image == image)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&const DeepCollectionEquality().equals(other._location, _location)&&(identical(other.donationCount, donationCount) || other.donationCount == donationCount)&&(identical(other.isDonor, isDonor) || other.isDonor == isDonor)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.lastDonationDate, lastDonationDate) || other.lastDonationDate == lastDonationDate)&&(identical(other.availableFrom, availableFrom) || other.availableFrom == availableFrom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,image,name,email,fcmToken,const DeepCollectionEquality().hash(_location),donationCount,isDonor,isAvailable,lastDonationDate,availableFrom);

@override
String toString() {
  return 'UserModel(id: $id, image: $image, name: $name, email: $email, fcmToken: $fcmToken, location: $location, donationCount: $donationCount, isDonor: $isDonor, isAvailable: $isAvailable, lastDonationDate: $lastDonationDate, availableFrom: $availableFrom)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? image, String name, String email, String? fcmToken, Map<String, dynamic> location, int? donationCount, bool? isDonor, bool isAvailable, String? lastDonationDate, String? availableFrom
});




}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? image = freezed,Object? name = null,Object? email = null,Object? fcmToken = freezed,Object? location = null,Object? donationCount = freezed,Object? isDonor = freezed,Object? isAvailable = null,Object? lastDonationDate = freezed,Object? availableFrom = freezed,}) {
  return _then(_UserModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fcmToken: freezed == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String?,location: null == location ? _self._location : location // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,donationCount: freezed == donationCount ? _self.donationCount : donationCount // ignore: cast_nullable_to_non_nullable
as int?,isDonor: freezed == isDonor ? _self.isDonor : isDonor // ignore: cast_nullable_to_non_nullable
as bool?,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,lastDonationDate: freezed == lastDonationDate ? _self.lastDonationDate : lastDonationDate // ignore: cast_nullable_to_non_nullable
as String?,availableFrom: freezed == availableFrom ? _self.availableFrom : availableFrom // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
