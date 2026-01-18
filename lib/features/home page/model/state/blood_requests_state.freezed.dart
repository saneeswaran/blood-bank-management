// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blood_requests_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BloodRequestsState {

 List<BloodRequest> get requests; bool get isLoading; bool get isLoadingMore; bool get hasMore; String? get error;
/// Create a copy of BloodRequestsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BloodRequestsStateCopyWith<BloodRequestsState> get copyWith => _$BloodRequestsStateCopyWithImpl<BloodRequestsState>(this as BloodRequestsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BloodRequestsState&&const DeepCollectionEquality().equals(other.requests, requests)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(requests),isLoading,isLoadingMore,hasMore,error);

@override
String toString() {
  return 'BloodRequestsState(requests: $requests, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasMore: $hasMore, error: $error)';
}


}

/// @nodoc
abstract mixin class $BloodRequestsStateCopyWith<$Res>  {
  factory $BloodRequestsStateCopyWith(BloodRequestsState value, $Res Function(BloodRequestsState) _then) = _$BloodRequestsStateCopyWithImpl;
@useResult
$Res call({
 List<BloodRequest> requests, bool isLoading, bool isLoadingMore, bool hasMore, String? error
});




}
/// @nodoc
class _$BloodRequestsStateCopyWithImpl<$Res>
    implements $BloodRequestsStateCopyWith<$Res> {
  _$BloodRequestsStateCopyWithImpl(this._self, this._then);

  final BloodRequestsState _self;
  final $Res Function(BloodRequestsState) _then;

/// Create a copy of BloodRequestsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requests = null,Object? isLoading = null,Object? isLoadingMore = null,Object? hasMore = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as List<BloodRequest>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BloodRequestsState].
extension BloodRequestsStatePatterns on BloodRequestsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BloodRequestsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BloodRequestsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BloodRequestsState value)  $default,){
final _that = this;
switch (_that) {
case _BloodRequestsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BloodRequestsState value)?  $default,){
final _that = this;
switch (_that) {
case _BloodRequestsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<BloodRequest> requests,  bool isLoading,  bool isLoadingMore,  bool hasMore,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BloodRequestsState() when $default != null:
return $default(_that.requests,_that.isLoading,_that.isLoadingMore,_that.hasMore,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<BloodRequest> requests,  bool isLoading,  bool isLoadingMore,  bool hasMore,  String? error)  $default,) {final _that = this;
switch (_that) {
case _BloodRequestsState():
return $default(_that.requests,_that.isLoading,_that.isLoadingMore,_that.hasMore,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<BloodRequest> requests,  bool isLoading,  bool isLoadingMore,  bool hasMore,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _BloodRequestsState() when $default != null:
return $default(_that.requests,_that.isLoading,_that.isLoadingMore,_that.hasMore,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _BloodRequestsState implements BloodRequestsState {
  const _BloodRequestsState({final  List<BloodRequest> requests = const [], this.isLoading = false, this.isLoadingMore = false, this.hasMore = true, this.error}): _requests = requests;
  

 final  List<BloodRequest> _requests;
@override@JsonKey() List<BloodRequest> get requests {
  if (_requests is EqualUnmodifiableListView) return _requests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requests);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool hasMore;
@override final  String? error;

/// Create a copy of BloodRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BloodRequestsStateCopyWith<_BloodRequestsState> get copyWith => __$BloodRequestsStateCopyWithImpl<_BloodRequestsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BloodRequestsState&&const DeepCollectionEquality().equals(other._requests, _requests)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_requests),isLoading,isLoadingMore,hasMore,error);

@override
String toString() {
  return 'BloodRequestsState(requests: $requests, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasMore: $hasMore, error: $error)';
}


}

/// @nodoc
abstract mixin class _$BloodRequestsStateCopyWith<$Res> implements $BloodRequestsStateCopyWith<$Res> {
  factory _$BloodRequestsStateCopyWith(_BloodRequestsState value, $Res Function(_BloodRequestsState) _then) = __$BloodRequestsStateCopyWithImpl;
@override @useResult
$Res call({
 List<BloodRequest> requests, bool isLoading, bool isLoadingMore, bool hasMore, String? error
});




}
/// @nodoc
class __$BloodRequestsStateCopyWithImpl<$Res>
    implements _$BloodRequestsStateCopyWith<$Res> {
  __$BloodRequestsStateCopyWithImpl(this._self, this._then);

  final _BloodRequestsState _self;
  final $Res Function(_BloodRequestsState) _then;

/// Create a copy of BloodRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requests = null,Object? isLoading = null,Object? isLoadingMore = null,Object? hasMore = null,Object? error = freezed,}) {
  return _then(_BloodRequestsState(
requests: null == requests ? _self._requests : requests // ignore: cast_nullable_to_non_nullable
as List<BloodRequest>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
