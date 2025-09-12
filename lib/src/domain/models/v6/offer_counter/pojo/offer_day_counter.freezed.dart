// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer_day_counter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OfferDayCounterPojo {

 String get today; int get point;
/// Create a copy of OfferDayCounterPojo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfferDayCounterPojoCopyWith<OfferDayCounterPojo> get copyWith => _$OfferDayCounterPojoCopyWithImpl<OfferDayCounterPojo>(this as OfferDayCounterPojo, _$identity);

  /// Serializes this OfferDayCounterPojo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferDayCounterPojo&&(identical(other.today, today) || other.today == today)&&(identical(other.point, point) || other.point == point));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,today,point);

@override
String toString() {
  return 'OfferDayCounterPojo(today: $today, point: $point)';
}


}

/// @nodoc
abstract mixin class $OfferDayCounterPojoCopyWith<$Res>  {
  factory $OfferDayCounterPojoCopyWith(OfferDayCounterPojo value, $Res Function(OfferDayCounterPojo) _then) = _$OfferDayCounterPojoCopyWithImpl;
@useResult
$Res call({
 String today, int point
});




}
/// @nodoc
class _$OfferDayCounterPojoCopyWithImpl<$Res>
    implements $OfferDayCounterPojoCopyWith<$Res> {
  _$OfferDayCounterPojoCopyWithImpl(this._self, this._then);

  final OfferDayCounterPojo _self;
  final $Res Function(OfferDayCounterPojo) _then;

/// Create a copy of OfferDayCounterPojo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? today = null,Object? point = null,}) {
  return _then(_self.copyWith(
today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as String,point: null == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OfferDayCounterPojo].
extension OfferDayCounterPojoPatterns on OfferDayCounterPojo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfferDayCounterPojo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfferDayCounterPojo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfferDayCounterPojo value)  $default,){
final _that = this;
switch (_that) {
case _OfferDayCounterPojo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfferDayCounterPojo value)?  $default,){
final _that = this;
switch (_that) {
case _OfferDayCounterPojo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String today,  int point)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfferDayCounterPojo() when $default != null:
return $default(_that.today,_that.point);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String today,  int point)  $default,) {final _that = this;
switch (_that) {
case _OfferDayCounterPojo():
return $default(_that.today,_that.point);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String today,  int point)?  $default,) {final _that = this;
switch (_that) {
case _OfferDayCounterPojo() when $default != null:
return $default(_that.today,_that.point);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OfferDayCounterPojo implements OfferDayCounterPojo {
  const _OfferDayCounterPojo({required this.today, required this.point});
  factory _OfferDayCounterPojo.fromJson(Map<String, dynamic> json) => _$OfferDayCounterPojoFromJson(json);

@override final  String today;
@override final  int point;

/// Create a copy of OfferDayCounterPojo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfferDayCounterPojoCopyWith<_OfferDayCounterPojo> get copyWith => __$OfferDayCounterPojoCopyWithImpl<_OfferDayCounterPojo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfferDayCounterPojoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfferDayCounterPojo&&(identical(other.today, today) || other.today == today)&&(identical(other.point, point) || other.point == point));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,today,point);

@override
String toString() {
  return 'OfferDayCounterPojo(today: $today, point: $point)';
}


}

/// @nodoc
abstract mixin class _$OfferDayCounterPojoCopyWith<$Res> implements $OfferDayCounterPojoCopyWith<$Res> {
  factory _$OfferDayCounterPojoCopyWith(_OfferDayCounterPojo value, $Res Function(_OfferDayCounterPojo) _then) = __$OfferDayCounterPojoCopyWithImpl;
@override @useResult
$Res call({
 String today, int point
});




}
/// @nodoc
class __$OfferDayCounterPojoCopyWithImpl<$Res>
    implements _$OfferDayCounterPojoCopyWith<$Res> {
  __$OfferDayCounterPojoCopyWithImpl(this._self, this._then);

  final _OfferDayCounterPojo _self;
  final $Res Function(_OfferDayCounterPojo) _then;

/// Create a copy of OfferDayCounterPojo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? today = null,Object? point = null,}) {
  return _then(_OfferDayCounterPojo(
today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as String,point: null == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
