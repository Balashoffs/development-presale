// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'design_offer_pojo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DesignPresalePojo {

 OfferDayCounterPojo get dayCounter; ObjectDataDesignPojo get objectData; InputFactorsPojo get inputFactors; String get divisionType; String get objectType; List<DivisionResourcePojo> get divisionResources; List<DivisionsMarginPojo> get divisionResourceMargins; List<DivisionWithAnalyticPojo> get divisionsWithAnalytic; List<DivisionsMarginPojo> get divisionsAnalyticMargin; bool get isAllResources;
/// Create a copy of DesignPresalePojo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DesignPresalePojoCopyWith<DesignPresalePojo> get copyWith => _$DesignPresalePojoCopyWithImpl<DesignPresalePojo>(this as DesignPresalePojo, _$identity);

  /// Serializes this DesignPresalePojo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DesignPresalePojo&&(identical(other.dayCounter, dayCounter) || other.dayCounter == dayCounter)&&(identical(other.objectData, objectData) || other.objectData == objectData)&&(identical(other.inputFactors, inputFactors) || other.inputFactors == inputFactors)&&(identical(other.divisionType, divisionType) || other.divisionType == divisionType)&&(identical(other.objectType, objectType) || other.objectType == objectType)&&const DeepCollectionEquality().equals(other.divisionResources, divisionResources)&&const DeepCollectionEquality().equals(other.divisionResourceMargins, divisionResourceMargins)&&const DeepCollectionEquality().equals(other.divisionsWithAnalytic, divisionsWithAnalytic)&&const DeepCollectionEquality().equals(other.divisionsAnalyticMargin, divisionsAnalyticMargin)&&(identical(other.isAllResources, isAllResources) || other.isAllResources == isAllResources));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dayCounter,objectData,inputFactors,divisionType,objectType,const DeepCollectionEquality().hash(divisionResources),const DeepCollectionEquality().hash(divisionResourceMargins),const DeepCollectionEquality().hash(divisionsWithAnalytic),const DeepCollectionEquality().hash(divisionsAnalyticMargin),isAllResources);

@override
String toString() {
  return 'DesignPresalePojo(dayCounter: $dayCounter, objectData: $objectData, inputFactors: $inputFactors, divisionType: $divisionType, objectType: $objectType, divisionResources: $divisionResources, divisionResourceMargins: $divisionResourceMargins, divisionsWithAnalytic: $divisionsWithAnalytic, divisionsAnalyticMargin: $divisionsAnalyticMargin, isAllResources: $isAllResources)';
}


}

/// @nodoc
abstract mixin class $DesignPresalePojoCopyWith<$Res>  {
  factory $DesignPresalePojoCopyWith(DesignPresalePojo value, $Res Function(DesignPresalePojo) _then) = _$DesignPresalePojoCopyWithImpl;
@useResult
$Res call({
 OfferDayCounterPojo dayCounter, ObjectDataDesignPojo objectData, InputFactorsPojo inputFactors, String divisionType, String objectType, List<DivisionResourcePojo> divisionResources, List<DivisionsMarginPojo> divisionResourceMargins, List<DivisionWithAnalyticPojo> divisionsWithAnalytic, List<DivisionsMarginPojo> divisionsAnalyticMargin, bool isAllResources
});


$OfferDayCounterPojoCopyWith<$Res> get dayCounter;$ObjectDataDesignPojoCopyWith<$Res> get objectData;$InputFactorsPojoCopyWith<$Res> get inputFactors;

}
/// @nodoc
class _$DesignPresalePojoCopyWithImpl<$Res>
    implements $DesignPresalePojoCopyWith<$Res> {
  _$DesignPresalePojoCopyWithImpl(this._self, this._then);

  final DesignPresalePojo _self;
  final $Res Function(DesignPresalePojo) _then;

/// Create a copy of DesignPresalePojo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dayCounter = null,Object? objectData = null,Object? inputFactors = null,Object? divisionType = null,Object? objectType = null,Object? divisionResources = null,Object? divisionResourceMargins = null,Object? divisionsWithAnalytic = null,Object? divisionsAnalyticMargin = null,Object? isAllResources = null,}) {
  return _then(_self.copyWith(
dayCounter: null == dayCounter ? _self.dayCounter : dayCounter // ignore: cast_nullable_to_non_nullable
as OfferDayCounterPojo,objectData: null == objectData ? _self.objectData : objectData // ignore: cast_nullable_to_non_nullable
as ObjectDataDesignPojo,inputFactors: null == inputFactors ? _self.inputFactors : inputFactors // ignore: cast_nullable_to_non_nullable
as InputFactorsPojo,divisionType: null == divisionType ? _self.divisionType : divisionType // ignore: cast_nullable_to_non_nullable
as String,objectType: null == objectType ? _self.objectType : objectType // ignore: cast_nullable_to_non_nullable
as String,divisionResources: null == divisionResources ? _self.divisionResources : divisionResources // ignore: cast_nullable_to_non_nullable
as List<DivisionResourcePojo>,divisionResourceMargins: null == divisionResourceMargins ? _self.divisionResourceMargins : divisionResourceMargins // ignore: cast_nullable_to_non_nullable
as List<DivisionsMarginPojo>,divisionsWithAnalytic: null == divisionsWithAnalytic ? _self.divisionsWithAnalytic : divisionsWithAnalytic // ignore: cast_nullable_to_non_nullable
as List<DivisionWithAnalyticPojo>,divisionsAnalyticMargin: null == divisionsAnalyticMargin ? _self.divisionsAnalyticMargin : divisionsAnalyticMargin // ignore: cast_nullable_to_non_nullable
as List<DivisionsMarginPojo>,isAllResources: null == isAllResources ? _self.isAllResources : isAllResources // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of DesignPresalePojo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfferDayCounterPojoCopyWith<$Res> get dayCounter {
  
  return $OfferDayCounterPojoCopyWith<$Res>(_self.dayCounter, (value) {
    return _then(_self.copyWith(dayCounter: value));
  });
}/// Create a copy of DesignPresalePojo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ObjectDataDesignPojoCopyWith<$Res> get objectData {
  
  return $ObjectDataDesignPojoCopyWith<$Res>(_self.objectData, (value) {
    return _then(_self.copyWith(objectData: value));
  });
}/// Create a copy of DesignPresalePojo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InputFactorsPojoCopyWith<$Res> get inputFactors {
  
  return $InputFactorsPojoCopyWith<$Res>(_self.inputFactors, (value) {
    return _then(_self.copyWith(inputFactors: value));
  });
}
}


/// Adds pattern-matching-related methods to [DesignPresalePojo].
extension DesignPresalePojoPatterns on DesignPresalePojo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DesignPresalePojo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DesignPresalePojo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DesignPresalePojo value)  $default,){
final _that = this;
switch (_that) {
case _DesignPresalePojo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DesignPresalePojo value)?  $default,){
final _that = this;
switch (_that) {
case _DesignPresalePojo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OfferDayCounterPojo dayCounter,  ObjectDataDesignPojo objectData,  InputFactorsPojo inputFactors,  String divisionType,  String objectType,  List<DivisionResourcePojo> divisionResources,  List<DivisionsMarginPojo> divisionResourceMargins,  List<DivisionWithAnalyticPojo> divisionsWithAnalytic,  List<DivisionsMarginPojo> divisionsAnalyticMargin,  bool isAllResources)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DesignPresalePojo() when $default != null:
return $default(_that.dayCounter,_that.objectData,_that.inputFactors,_that.divisionType,_that.objectType,_that.divisionResources,_that.divisionResourceMargins,_that.divisionsWithAnalytic,_that.divisionsAnalyticMargin,_that.isAllResources);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OfferDayCounterPojo dayCounter,  ObjectDataDesignPojo objectData,  InputFactorsPojo inputFactors,  String divisionType,  String objectType,  List<DivisionResourcePojo> divisionResources,  List<DivisionsMarginPojo> divisionResourceMargins,  List<DivisionWithAnalyticPojo> divisionsWithAnalytic,  List<DivisionsMarginPojo> divisionsAnalyticMargin,  bool isAllResources)  $default,) {final _that = this;
switch (_that) {
case _DesignPresalePojo():
return $default(_that.dayCounter,_that.objectData,_that.inputFactors,_that.divisionType,_that.objectType,_that.divisionResources,_that.divisionResourceMargins,_that.divisionsWithAnalytic,_that.divisionsAnalyticMargin,_that.isAllResources);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OfferDayCounterPojo dayCounter,  ObjectDataDesignPojo objectData,  InputFactorsPojo inputFactors,  String divisionType,  String objectType,  List<DivisionResourcePojo> divisionResources,  List<DivisionsMarginPojo> divisionResourceMargins,  List<DivisionWithAnalyticPojo> divisionsWithAnalytic,  List<DivisionsMarginPojo> divisionsAnalyticMargin,  bool isAllResources)?  $default,) {final _that = this;
switch (_that) {
case _DesignPresalePojo() when $default != null:
return $default(_that.dayCounter,_that.objectData,_that.inputFactors,_that.divisionType,_that.objectType,_that.divisionResources,_that.divisionResourceMargins,_that.divisionsWithAnalytic,_that.divisionsAnalyticMargin,_that.isAllResources);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DesignPresalePojo implements DesignPresalePojo {
  const _DesignPresalePojo({required this.dayCounter, required this.objectData, required this.inputFactors, required this.divisionType, required this.objectType, final  List<DivisionResourcePojo> divisionResources = const [], final  List<DivisionsMarginPojo> divisionResourceMargins = const [], final  List<DivisionWithAnalyticPojo> divisionsWithAnalytic = const [], final  List<DivisionsMarginPojo> divisionsAnalyticMargin = const [], this.isAllResources = false}): _divisionResources = divisionResources,_divisionResourceMargins = divisionResourceMargins,_divisionsWithAnalytic = divisionsWithAnalytic,_divisionsAnalyticMargin = divisionsAnalyticMargin;
  factory _DesignPresalePojo.fromJson(Map<String, dynamic> json) => _$DesignPresalePojoFromJson(json);

@override final  OfferDayCounterPojo dayCounter;
@override final  ObjectDataDesignPojo objectData;
@override final  InputFactorsPojo inputFactors;
@override final  String divisionType;
@override final  String objectType;
 final  List<DivisionResourcePojo> _divisionResources;
@override@JsonKey() List<DivisionResourcePojo> get divisionResources {
  if (_divisionResources is EqualUnmodifiableListView) return _divisionResources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_divisionResources);
}

 final  List<DivisionsMarginPojo> _divisionResourceMargins;
@override@JsonKey() List<DivisionsMarginPojo> get divisionResourceMargins {
  if (_divisionResourceMargins is EqualUnmodifiableListView) return _divisionResourceMargins;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_divisionResourceMargins);
}

 final  List<DivisionWithAnalyticPojo> _divisionsWithAnalytic;
@override@JsonKey() List<DivisionWithAnalyticPojo> get divisionsWithAnalytic {
  if (_divisionsWithAnalytic is EqualUnmodifiableListView) return _divisionsWithAnalytic;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_divisionsWithAnalytic);
}

 final  List<DivisionsMarginPojo> _divisionsAnalyticMargin;
@override@JsonKey() List<DivisionsMarginPojo> get divisionsAnalyticMargin {
  if (_divisionsAnalyticMargin is EqualUnmodifiableListView) return _divisionsAnalyticMargin;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_divisionsAnalyticMargin);
}

@override@JsonKey() final  bool isAllResources;

/// Create a copy of DesignPresalePojo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DesignPresalePojoCopyWith<_DesignPresalePojo> get copyWith => __$DesignPresalePojoCopyWithImpl<_DesignPresalePojo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DesignPresalePojoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DesignPresalePojo&&(identical(other.dayCounter, dayCounter) || other.dayCounter == dayCounter)&&(identical(other.objectData, objectData) || other.objectData == objectData)&&(identical(other.inputFactors, inputFactors) || other.inputFactors == inputFactors)&&(identical(other.divisionType, divisionType) || other.divisionType == divisionType)&&(identical(other.objectType, objectType) || other.objectType == objectType)&&const DeepCollectionEquality().equals(other._divisionResources, _divisionResources)&&const DeepCollectionEquality().equals(other._divisionResourceMargins, _divisionResourceMargins)&&const DeepCollectionEquality().equals(other._divisionsWithAnalytic, _divisionsWithAnalytic)&&const DeepCollectionEquality().equals(other._divisionsAnalyticMargin, _divisionsAnalyticMargin)&&(identical(other.isAllResources, isAllResources) || other.isAllResources == isAllResources));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dayCounter,objectData,inputFactors,divisionType,objectType,const DeepCollectionEquality().hash(_divisionResources),const DeepCollectionEquality().hash(_divisionResourceMargins),const DeepCollectionEquality().hash(_divisionsWithAnalytic),const DeepCollectionEquality().hash(_divisionsAnalyticMargin),isAllResources);

@override
String toString() {
  return 'DesignPresalePojo(dayCounter: $dayCounter, objectData: $objectData, inputFactors: $inputFactors, divisionType: $divisionType, objectType: $objectType, divisionResources: $divisionResources, divisionResourceMargins: $divisionResourceMargins, divisionsWithAnalytic: $divisionsWithAnalytic, divisionsAnalyticMargin: $divisionsAnalyticMargin, isAllResources: $isAllResources)';
}


}

/// @nodoc
abstract mixin class _$DesignPresalePojoCopyWith<$Res> implements $DesignPresalePojoCopyWith<$Res> {
  factory _$DesignPresalePojoCopyWith(_DesignPresalePojo value, $Res Function(_DesignPresalePojo) _then) = __$DesignPresalePojoCopyWithImpl;
@override @useResult
$Res call({
 OfferDayCounterPojo dayCounter, ObjectDataDesignPojo objectData, InputFactorsPojo inputFactors, String divisionType, String objectType, List<DivisionResourcePojo> divisionResources, List<DivisionsMarginPojo> divisionResourceMargins, List<DivisionWithAnalyticPojo> divisionsWithAnalytic, List<DivisionsMarginPojo> divisionsAnalyticMargin, bool isAllResources
});


@override $OfferDayCounterPojoCopyWith<$Res> get dayCounter;@override $ObjectDataDesignPojoCopyWith<$Res> get objectData;@override $InputFactorsPojoCopyWith<$Res> get inputFactors;

}
/// @nodoc
class __$DesignPresalePojoCopyWithImpl<$Res>
    implements _$DesignPresalePojoCopyWith<$Res> {
  __$DesignPresalePojoCopyWithImpl(this._self, this._then);

  final _DesignPresalePojo _self;
  final $Res Function(_DesignPresalePojo) _then;

/// Create a copy of DesignPresalePojo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dayCounter = null,Object? objectData = null,Object? inputFactors = null,Object? divisionType = null,Object? objectType = null,Object? divisionResources = null,Object? divisionResourceMargins = null,Object? divisionsWithAnalytic = null,Object? divisionsAnalyticMargin = null,Object? isAllResources = null,}) {
  return _then(_DesignPresalePojo(
dayCounter: null == dayCounter ? _self.dayCounter : dayCounter // ignore: cast_nullable_to_non_nullable
as OfferDayCounterPojo,objectData: null == objectData ? _self.objectData : objectData // ignore: cast_nullable_to_non_nullable
as ObjectDataDesignPojo,inputFactors: null == inputFactors ? _self.inputFactors : inputFactors // ignore: cast_nullable_to_non_nullable
as InputFactorsPojo,divisionType: null == divisionType ? _self.divisionType : divisionType // ignore: cast_nullable_to_non_nullable
as String,objectType: null == objectType ? _self.objectType : objectType // ignore: cast_nullable_to_non_nullable
as String,divisionResources: null == divisionResources ? _self._divisionResources : divisionResources // ignore: cast_nullable_to_non_nullable
as List<DivisionResourcePojo>,divisionResourceMargins: null == divisionResourceMargins ? _self._divisionResourceMargins : divisionResourceMargins // ignore: cast_nullable_to_non_nullable
as List<DivisionsMarginPojo>,divisionsWithAnalytic: null == divisionsWithAnalytic ? _self._divisionsWithAnalytic : divisionsWithAnalytic // ignore: cast_nullable_to_non_nullable
as List<DivisionWithAnalyticPojo>,divisionsAnalyticMargin: null == divisionsAnalyticMargin ? _self._divisionsAnalyticMargin : divisionsAnalyticMargin // ignore: cast_nullable_to_non_nullable
as List<DivisionsMarginPojo>,isAllResources: null == isAllResources ? _self.isAllResources : isAllResources // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of DesignPresalePojo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfferDayCounterPojoCopyWith<$Res> get dayCounter {
  
  return $OfferDayCounterPojoCopyWith<$Res>(_self.dayCounter, (value) {
    return _then(_self.copyWith(dayCounter: value));
  });
}/// Create a copy of DesignPresalePojo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ObjectDataDesignPojoCopyWith<$Res> get objectData {
  
  return $ObjectDataDesignPojoCopyWith<$Res>(_self.objectData, (value) {
    return _then(_self.copyWith(objectData: value));
  });
}/// Create a copy of DesignPresalePojo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InputFactorsPojoCopyWith<$Res> get inputFactors {
  
  return $InputFactorsPojoCopyWith<$Res>(_self.inputFactors, (value) {
    return _then(_self.copyWith(inputFactors: value));
  });
}
}


/// @nodoc
mixin _$OfferDayCounterPojo {

 int get timeStamp; int get offerId;
/// Create a copy of OfferDayCounterPojo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfferDayCounterPojoCopyWith<OfferDayCounterPojo> get copyWith => _$OfferDayCounterPojoCopyWithImpl<OfferDayCounterPojo>(this as OfferDayCounterPojo, _$identity);

  /// Serializes this OfferDayCounterPojo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferDayCounterPojo&&(identical(other.timeStamp, timeStamp) || other.timeStamp == timeStamp)&&(identical(other.offerId, offerId) || other.offerId == offerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timeStamp,offerId);

@override
String toString() {
  return 'OfferDayCounterPojo(timeStamp: $timeStamp, offerId: $offerId)';
}


}

/// @nodoc
abstract mixin class $OfferDayCounterPojoCopyWith<$Res>  {
  factory $OfferDayCounterPojoCopyWith(OfferDayCounterPojo value, $Res Function(OfferDayCounterPojo) _then) = _$OfferDayCounterPojoCopyWithImpl;
@useResult
$Res call({
 int timeStamp, int offerId
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
@pragma('vm:prefer-inline') @override $Res call({Object? timeStamp = null,Object? offerId = null,}) {
  return _then(_self.copyWith(
timeStamp: null == timeStamp ? _self.timeStamp : timeStamp // ignore: cast_nullable_to_non_nullable
as int,offerId: null == offerId ? _self.offerId : offerId // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int timeStamp,  int offerId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfferDayCounterPojo() when $default != null:
return $default(_that.timeStamp,_that.offerId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int timeStamp,  int offerId)  $default,) {final _that = this;
switch (_that) {
case _OfferDayCounterPojo():
return $default(_that.timeStamp,_that.offerId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int timeStamp,  int offerId)?  $default,) {final _that = this;
switch (_that) {
case _OfferDayCounterPojo() when $default != null:
return $default(_that.timeStamp,_that.offerId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OfferDayCounterPojo implements OfferDayCounterPojo {
  const _OfferDayCounterPojo({required this.timeStamp, required this.offerId});
  factory _OfferDayCounterPojo.fromJson(Map<String, dynamic> json) => _$OfferDayCounterPojoFromJson(json);

@override final  int timeStamp;
@override final  int offerId;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfferDayCounterPojo&&(identical(other.timeStamp, timeStamp) || other.timeStamp == timeStamp)&&(identical(other.offerId, offerId) || other.offerId == offerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timeStamp,offerId);

@override
String toString() {
  return 'OfferDayCounterPojo(timeStamp: $timeStamp, offerId: $offerId)';
}


}

/// @nodoc
abstract mixin class _$OfferDayCounterPojoCopyWith<$Res> implements $OfferDayCounterPojoCopyWith<$Res> {
  factory _$OfferDayCounterPojoCopyWith(_OfferDayCounterPojo value, $Res Function(_OfferDayCounterPojo) _then) = __$OfferDayCounterPojoCopyWithImpl;
@override @useResult
$Res call({
 int timeStamp, int offerId
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
@override @pragma('vm:prefer-inline') $Res call({Object? timeStamp = null,Object? offerId = null,}) {
  return _then(_OfferDayCounterPojo(
timeStamp: null == timeStamp ? _self.timeStamp : timeStamp // ignore: cast_nullable_to_non_nullable
as int,offerId: null == offerId ? _self.offerId : offerId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ObjectDataDesignPojo {

 String get customer; String get name; String get address; int get square; int get deadline;
/// Create a copy of ObjectDataDesignPojo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ObjectDataDesignPojoCopyWith<ObjectDataDesignPojo> get copyWith => _$ObjectDataDesignPojoCopyWithImpl<ObjectDataDesignPojo>(this as ObjectDataDesignPojo, _$identity);

  /// Serializes this ObjectDataDesignPojo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ObjectDataDesignPojo&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.square, square) || other.square == square)&&(identical(other.deadline, deadline) || other.deadline == deadline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customer,name,address,square,deadline);

@override
String toString() {
  return 'ObjectDataDesignPojo(customer: $customer, name: $name, address: $address, square: $square, deadline: $deadline)';
}


}

/// @nodoc
abstract mixin class $ObjectDataDesignPojoCopyWith<$Res>  {
  factory $ObjectDataDesignPojoCopyWith(ObjectDataDesignPojo value, $Res Function(ObjectDataDesignPojo) _then) = _$ObjectDataDesignPojoCopyWithImpl;
@useResult
$Res call({
 String customer, String name, String address, int square, int deadline
});




}
/// @nodoc
class _$ObjectDataDesignPojoCopyWithImpl<$Res>
    implements $ObjectDataDesignPojoCopyWith<$Res> {
  _$ObjectDataDesignPojoCopyWithImpl(this._self, this._then);

  final ObjectDataDesignPojo _self;
  final $Res Function(ObjectDataDesignPojo) _then;

/// Create a copy of ObjectDataDesignPojo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customer = null,Object? name = null,Object? address = null,Object? square = null,Object? deadline = null,}) {
  return _then(_self.copyWith(
customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,square: null == square ? _self.square : square // ignore: cast_nullable_to_non_nullable
as int,deadline: null == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ObjectDataDesignPojo].
extension ObjectDataDesignPojoPatterns on ObjectDataDesignPojo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ObjectDataDesignPojo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ObjectDataDesignPojo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ObjectDataDesignPojo value)  $default,){
final _that = this;
switch (_that) {
case _ObjectDataDesignPojo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ObjectDataDesignPojo value)?  $default,){
final _that = this;
switch (_that) {
case _ObjectDataDesignPojo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String customer,  String name,  String address,  int square,  int deadline)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ObjectDataDesignPojo() when $default != null:
return $default(_that.customer,_that.name,_that.address,_that.square,_that.deadline);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String customer,  String name,  String address,  int square,  int deadline)  $default,) {final _that = this;
switch (_that) {
case _ObjectDataDesignPojo():
return $default(_that.customer,_that.name,_that.address,_that.square,_that.deadline);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String customer,  String name,  String address,  int square,  int deadline)?  $default,) {final _that = this;
switch (_that) {
case _ObjectDataDesignPojo() when $default != null:
return $default(_that.customer,_that.name,_that.address,_that.square,_that.deadline);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ObjectDataDesignPojo implements ObjectDataDesignPojo {
  const _ObjectDataDesignPojo({required this.customer, required this.name, required this.address, required this.square, required this.deadline});
  factory _ObjectDataDesignPojo.fromJson(Map<String, dynamic> json) => _$ObjectDataDesignPojoFromJson(json);

@override final  String customer;
@override final  String name;
@override final  String address;
@override final  int square;
@override final  int deadline;

/// Create a copy of ObjectDataDesignPojo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ObjectDataDesignPojoCopyWith<_ObjectDataDesignPojo> get copyWith => __$ObjectDataDesignPojoCopyWithImpl<_ObjectDataDesignPojo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ObjectDataDesignPojoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ObjectDataDesignPojo&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.square, square) || other.square == square)&&(identical(other.deadline, deadline) || other.deadline == deadline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customer,name,address,square,deadline);

@override
String toString() {
  return 'ObjectDataDesignPojo(customer: $customer, name: $name, address: $address, square: $square, deadline: $deadline)';
}


}

/// @nodoc
abstract mixin class _$ObjectDataDesignPojoCopyWith<$Res> implements $ObjectDataDesignPojoCopyWith<$Res> {
  factory _$ObjectDataDesignPojoCopyWith(_ObjectDataDesignPojo value, $Res Function(_ObjectDataDesignPojo) _then) = __$ObjectDataDesignPojoCopyWithImpl;
@override @useResult
$Res call({
 String customer, String name, String address, int square, int deadline
});




}
/// @nodoc
class __$ObjectDataDesignPojoCopyWithImpl<$Res>
    implements _$ObjectDataDesignPojoCopyWith<$Res> {
  __$ObjectDataDesignPojoCopyWithImpl(this._self, this._then);

  final _ObjectDataDesignPojo _self;
  final $Res Function(_ObjectDataDesignPojo) _then;

/// Create a copy of ObjectDataDesignPojo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customer = null,Object? name = null,Object? address = null,Object? square = null,Object? deadline = null,}) {
  return _then(_ObjectDataDesignPojo(
customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,square: null == square ? _self.square : square // ignore: cast_nullable_to_non_nullable
as int,deadline: null == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$InputFactorsPojo {

 double get speedFactor; double get heightFactor; double get overPriceFactor; double get remotingFactor; double get complexityFactor; double get customerFactor; double get marginFactor; double get squareFactor;
/// Create a copy of InputFactorsPojo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InputFactorsPojoCopyWith<InputFactorsPojo> get copyWith => _$InputFactorsPojoCopyWithImpl<InputFactorsPojo>(this as InputFactorsPojo, _$identity);

  /// Serializes this InputFactorsPojo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InputFactorsPojo&&(identical(other.speedFactor, speedFactor) || other.speedFactor == speedFactor)&&(identical(other.heightFactor, heightFactor) || other.heightFactor == heightFactor)&&(identical(other.overPriceFactor, overPriceFactor) || other.overPriceFactor == overPriceFactor)&&(identical(other.remotingFactor, remotingFactor) || other.remotingFactor == remotingFactor)&&(identical(other.complexityFactor, complexityFactor) || other.complexityFactor == complexityFactor)&&(identical(other.customerFactor, customerFactor) || other.customerFactor == customerFactor)&&(identical(other.marginFactor, marginFactor) || other.marginFactor == marginFactor)&&(identical(other.squareFactor, squareFactor) || other.squareFactor == squareFactor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,speedFactor,heightFactor,overPriceFactor,remotingFactor,complexityFactor,customerFactor,marginFactor,squareFactor);

@override
String toString() {
  return 'InputFactorsPojo(speedFactor: $speedFactor, heightFactor: $heightFactor, overPriceFactor: $overPriceFactor, remotingFactor: $remotingFactor, complexityFactor: $complexityFactor, customerFactor: $customerFactor, marginFactor: $marginFactor, squareFactor: $squareFactor)';
}


}

/// @nodoc
abstract mixin class $InputFactorsPojoCopyWith<$Res>  {
  factory $InputFactorsPojoCopyWith(InputFactorsPojo value, $Res Function(InputFactorsPojo) _then) = _$InputFactorsPojoCopyWithImpl;
@useResult
$Res call({
 double speedFactor, double heightFactor, double overPriceFactor, double remotingFactor, double complexityFactor, double customerFactor, double marginFactor, double squareFactor
});




}
/// @nodoc
class _$InputFactorsPojoCopyWithImpl<$Res>
    implements $InputFactorsPojoCopyWith<$Res> {
  _$InputFactorsPojoCopyWithImpl(this._self, this._then);

  final InputFactorsPojo _self;
  final $Res Function(InputFactorsPojo) _then;

/// Create a copy of InputFactorsPojo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? speedFactor = null,Object? heightFactor = null,Object? overPriceFactor = null,Object? remotingFactor = null,Object? complexityFactor = null,Object? customerFactor = null,Object? marginFactor = null,Object? squareFactor = null,}) {
  return _then(_self.copyWith(
speedFactor: null == speedFactor ? _self.speedFactor : speedFactor // ignore: cast_nullable_to_non_nullable
as double,heightFactor: null == heightFactor ? _self.heightFactor : heightFactor // ignore: cast_nullable_to_non_nullable
as double,overPriceFactor: null == overPriceFactor ? _self.overPriceFactor : overPriceFactor // ignore: cast_nullable_to_non_nullable
as double,remotingFactor: null == remotingFactor ? _self.remotingFactor : remotingFactor // ignore: cast_nullable_to_non_nullable
as double,complexityFactor: null == complexityFactor ? _self.complexityFactor : complexityFactor // ignore: cast_nullable_to_non_nullable
as double,customerFactor: null == customerFactor ? _self.customerFactor : customerFactor // ignore: cast_nullable_to_non_nullable
as double,marginFactor: null == marginFactor ? _self.marginFactor : marginFactor // ignore: cast_nullable_to_non_nullable
as double,squareFactor: null == squareFactor ? _self.squareFactor : squareFactor // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [InputFactorsPojo].
extension InputFactorsPojoPatterns on InputFactorsPojo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InputFactorsPojo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InputFactorsPojo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InputFactorsPojo value)  $default,){
final _that = this;
switch (_that) {
case _InputFactorsPojo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InputFactorsPojo value)?  $default,){
final _that = this;
switch (_that) {
case _InputFactorsPojo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double speedFactor,  double heightFactor,  double overPriceFactor,  double remotingFactor,  double complexityFactor,  double customerFactor,  double marginFactor,  double squareFactor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InputFactorsPojo() when $default != null:
return $default(_that.speedFactor,_that.heightFactor,_that.overPriceFactor,_that.remotingFactor,_that.complexityFactor,_that.customerFactor,_that.marginFactor,_that.squareFactor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double speedFactor,  double heightFactor,  double overPriceFactor,  double remotingFactor,  double complexityFactor,  double customerFactor,  double marginFactor,  double squareFactor)  $default,) {final _that = this;
switch (_that) {
case _InputFactorsPojo():
return $default(_that.speedFactor,_that.heightFactor,_that.overPriceFactor,_that.remotingFactor,_that.complexityFactor,_that.customerFactor,_that.marginFactor,_that.squareFactor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double speedFactor,  double heightFactor,  double overPriceFactor,  double remotingFactor,  double complexityFactor,  double customerFactor,  double marginFactor,  double squareFactor)?  $default,) {final _that = this;
switch (_that) {
case _InputFactorsPojo() when $default != null:
return $default(_that.speedFactor,_that.heightFactor,_that.overPriceFactor,_that.remotingFactor,_that.complexityFactor,_that.customerFactor,_that.marginFactor,_that.squareFactor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InputFactorsPojo implements InputFactorsPojo {
  const _InputFactorsPojo({this.speedFactor = 1.0, this.heightFactor = 1.0, this.overPriceFactor = 1.0, this.remotingFactor = 1.0, this.complexityFactor = 1.0, this.customerFactor = 1.0, this.marginFactor = 1.0, this.squareFactor = 1.0});
  factory _InputFactorsPojo.fromJson(Map<String, dynamic> json) => _$InputFactorsPojoFromJson(json);

@override@JsonKey() final  double speedFactor;
@override@JsonKey() final  double heightFactor;
@override@JsonKey() final  double overPriceFactor;
@override@JsonKey() final  double remotingFactor;
@override@JsonKey() final  double complexityFactor;
@override@JsonKey() final  double customerFactor;
@override@JsonKey() final  double marginFactor;
@override@JsonKey() final  double squareFactor;

/// Create a copy of InputFactorsPojo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InputFactorsPojoCopyWith<_InputFactorsPojo> get copyWith => __$InputFactorsPojoCopyWithImpl<_InputFactorsPojo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InputFactorsPojoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InputFactorsPojo&&(identical(other.speedFactor, speedFactor) || other.speedFactor == speedFactor)&&(identical(other.heightFactor, heightFactor) || other.heightFactor == heightFactor)&&(identical(other.overPriceFactor, overPriceFactor) || other.overPriceFactor == overPriceFactor)&&(identical(other.remotingFactor, remotingFactor) || other.remotingFactor == remotingFactor)&&(identical(other.complexityFactor, complexityFactor) || other.complexityFactor == complexityFactor)&&(identical(other.customerFactor, customerFactor) || other.customerFactor == customerFactor)&&(identical(other.marginFactor, marginFactor) || other.marginFactor == marginFactor)&&(identical(other.squareFactor, squareFactor) || other.squareFactor == squareFactor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,speedFactor,heightFactor,overPriceFactor,remotingFactor,complexityFactor,customerFactor,marginFactor,squareFactor);

@override
String toString() {
  return 'InputFactorsPojo(speedFactor: $speedFactor, heightFactor: $heightFactor, overPriceFactor: $overPriceFactor, remotingFactor: $remotingFactor, complexityFactor: $complexityFactor, customerFactor: $customerFactor, marginFactor: $marginFactor, squareFactor: $squareFactor)';
}


}

/// @nodoc
abstract mixin class _$InputFactorsPojoCopyWith<$Res> implements $InputFactorsPojoCopyWith<$Res> {
  factory _$InputFactorsPojoCopyWith(_InputFactorsPojo value, $Res Function(_InputFactorsPojo) _then) = __$InputFactorsPojoCopyWithImpl;
@override @useResult
$Res call({
 double speedFactor, double heightFactor, double overPriceFactor, double remotingFactor, double complexityFactor, double customerFactor, double marginFactor, double squareFactor
});




}
/// @nodoc
class __$InputFactorsPojoCopyWithImpl<$Res>
    implements _$InputFactorsPojoCopyWith<$Res> {
  __$InputFactorsPojoCopyWithImpl(this._self, this._then);

  final _InputFactorsPojo _self;
  final $Res Function(_InputFactorsPojo) _then;

/// Create a copy of InputFactorsPojo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? speedFactor = null,Object? heightFactor = null,Object? overPriceFactor = null,Object? remotingFactor = null,Object? complexityFactor = null,Object? customerFactor = null,Object? marginFactor = null,Object? squareFactor = null,}) {
  return _then(_InputFactorsPojo(
speedFactor: null == speedFactor ? _self.speedFactor : speedFactor // ignore: cast_nullable_to_non_nullable
as double,heightFactor: null == heightFactor ? _self.heightFactor : heightFactor // ignore: cast_nullable_to_non_nullable
as double,overPriceFactor: null == overPriceFactor ? _self.overPriceFactor : overPriceFactor // ignore: cast_nullable_to_non_nullable
as double,remotingFactor: null == remotingFactor ? _self.remotingFactor : remotingFactor // ignore: cast_nullable_to_non_nullable
as double,complexityFactor: null == complexityFactor ? _self.complexityFactor : complexityFactor // ignore: cast_nullable_to_non_nullable
as double,customerFactor: null == customerFactor ? _self.customerFactor : customerFactor // ignore: cast_nullable_to_non_nullable
as double,marginFactor: null == marginFactor ? _self.marginFactor : marginFactor // ignore: cast_nullable_to_non_nullable
as double,squareFactor: null == squareFactor ? _self.squareFactor : squareFactor // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$DivisionResourcePojo {

 int get id; int get resourceId; int get resourcesQnt; String get divisionName; String get divisionShortName; String get divisionDescription; String get resourceName; int get resourceQnt; int get workDays; double get complexFactor; double get squareFactor; double get resourceUsingFactor; double get resourceCostPerDay; double get totalResourceRowCost;
/// Create a copy of DivisionResourcePojo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DivisionResourcePojoCopyWith<DivisionResourcePojo> get copyWith => _$DivisionResourcePojoCopyWithImpl<DivisionResourcePojo>(this as DivisionResourcePojo, _$identity);

  /// Serializes this DivisionResourcePojo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DivisionResourcePojo&&(identical(other.id, id) || other.id == id)&&(identical(other.resourceId, resourceId) || other.resourceId == resourceId)&&(identical(other.resourcesQnt, resourcesQnt) || other.resourcesQnt == resourcesQnt)&&(identical(other.divisionName, divisionName) || other.divisionName == divisionName)&&(identical(other.divisionShortName, divisionShortName) || other.divisionShortName == divisionShortName)&&(identical(other.divisionDescription, divisionDescription) || other.divisionDescription == divisionDescription)&&(identical(other.resourceName, resourceName) || other.resourceName == resourceName)&&(identical(other.resourceQnt, resourceQnt) || other.resourceQnt == resourceQnt)&&(identical(other.workDays, workDays) || other.workDays == workDays)&&(identical(other.complexFactor, complexFactor) || other.complexFactor == complexFactor)&&(identical(other.squareFactor, squareFactor) || other.squareFactor == squareFactor)&&(identical(other.resourceUsingFactor, resourceUsingFactor) || other.resourceUsingFactor == resourceUsingFactor)&&(identical(other.resourceCostPerDay, resourceCostPerDay) || other.resourceCostPerDay == resourceCostPerDay)&&(identical(other.totalResourceRowCost, totalResourceRowCost) || other.totalResourceRowCost == totalResourceRowCost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,resourceId,resourcesQnt,divisionName,divisionShortName,divisionDescription,resourceName,resourceQnt,workDays,complexFactor,squareFactor,resourceUsingFactor,resourceCostPerDay,totalResourceRowCost);

@override
String toString() {
  return 'DivisionResourcePojo(id: $id, resourceId: $resourceId, resourcesQnt: $resourcesQnt, divisionName: $divisionName, divisionShortName: $divisionShortName, divisionDescription: $divisionDescription, resourceName: $resourceName, resourceQnt: $resourceQnt, workDays: $workDays, complexFactor: $complexFactor, squareFactor: $squareFactor, resourceUsingFactor: $resourceUsingFactor, resourceCostPerDay: $resourceCostPerDay, totalResourceRowCost: $totalResourceRowCost)';
}


}

/// @nodoc
abstract mixin class $DivisionResourcePojoCopyWith<$Res>  {
  factory $DivisionResourcePojoCopyWith(DivisionResourcePojo value, $Res Function(DivisionResourcePojo) _then) = _$DivisionResourcePojoCopyWithImpl;
@useResult
$Res call({
 int id, int resourceId, int resourcesQnt, String divisionName, String divisionShortName, String divisionDescription, String resourceName, int resourceQnt, int workDays, double complexFactor, double squareFactor, double resourceUsingFactor, double resourceCostPerDay, double totalResourceRowCost
});




}
/// @nodoc
class _$DivisionResourcePojoCopyWithImpl<$Res>
    implements $DivisionResourcePojoCopyWith<$Res> {
  _$DivisionResourcePojoCopyWithImpl(this._self, this._then);

  final DivisionResourcePojo _self;
  final $Res Function(DivisionResourcePojo) _then;

/// Create a copy of DivisionResourcePojo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? resourceId = null,Object? resourcesQnt = null,Object? divisionName = null,Object? divisionShortName = null,Object? divisionDescription = null,Object? resourceName = null,Object? resourceQnt = null,Object? workDays = null,Object? complexFactor = null,Object? squareFactor = null,Object? resourceUsingFactor = null,Object? resourceCostPerDay = null,Object? totalResourceRowCost = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,resourceId: null == resourceId ? _self.resourceId : resourceId // ignore: cast_nullable_to_non_nullable
as int,resourcesQnt: null == resourcesQnt ? _self.resourcesQnt : resourcesQnt // ignore: cast_nullable_to_non_nullable
as int,divisionName: null == divisionName ? _self.divisionName : divisionName // ignore: cast_nullable_to_non_nullable
as String,divisionShortName: null == divisionShortName ? _self.divisionShortName : divisionShortName // ignore: cast_nullable_to_non_nullable
as String,divisionDescription: null == divisionDescription ? _self.divisionDescription : divisionDescription // ignore: cast_nullable_to_non_nullable
as String,resourceName: null == resourceName ? _self.resourceName : resourceName // ignore: cast_nullable_to_non_nullable
as String,resourceQnt: null == resourceQnt ? _self.resourceQnt : resourceQnt // ignore: cast_nullable_to_non_nullable
as int,workDays: null == workDays ? _self.workDays : workDays // ignore: cast_nullable_to_non_nullable
as int,complexFactor: null == complexFactor ? _self.complexFactor : complexFactor // ignore: cast_nullable_to_non_nullable
as double,squareFactor: null == squareFactor ? _self.squareFactor : squareFactor // ignore: cast_nullable_to_non_nullable
as double,resourceUsingFactor: null == resourceUsingFactor ? _self.resourceUsingFactor : resourceUsingFactor // ignore: cast_nullable_to_non_nullable
as double,resourceCostPerDay: null == resourceCostPerDay ? _self.resourceCostPerDay : resourceCostPerDay // ignore: cast_nullable_to_non_nullable
as double,totalResourceRowCost: null == totalResourceRowCost ? _self.totalResourceRowCost : totalResourceRowCost // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DivisionResourcePojo].
extension DivisionResourcePojoPatterns on DivisionResourcePojo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DivisionResourcePojo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DivisionResourcePojo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DivisionResourcePojo value)  $default,){
final _that = this;
switch (_that) {
case _DivisionResourcePojo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DivisionResourcePojo value)?  $default,){
final _that = this;
switch (_that) {
case _DivisionResourcePojo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int resourceId,  int resourcesQnt,  String divisionName,  String divisionShortName,  String divisionDescription,  String resourceName,  int resourceQnt,  int workDays,  double complexFactor,  double squareFactor,  double resourceUsingFactor,  double resourceCostPerDay,  double totalResourceRowCost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DivisionResourcePojo() when $default != null:
return $default(_that.id,_that.resourceId,_that.resourcesQnt,_that.divisionName,_that.divisionShortName,_that.divisionDescription,_that.resourceName,_that.resourceQnt,_that.workDays,_that.complexFactor,_that.squareFactor,_that.resourceUsingFactor,_that.resourceCostPerDay,_that.totalResourceRowCost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int resourceId,  int resourcesQnt,  String divisionName,  String divisionShortName,  String divisionDescription,  String resourceName,  int resourceQnt,  int workDays,  double complexFactor,  double squareFactor,  double resourceUsingFactor,  double resourceCostPerDay,  double totalResourceRowCost)  $default,) {final _that = this;
switch (_that) {
case _DivisionResourcePojo():
return $default(_that.id,_that.resourceId,_that.resourcesQnt,_that.divisionName,_that.divisionShortName,_that.divisionDescription,_that.resourceName,_that.resourceQnt,_that.workDays,_that.complexFactor,_that.squareFactor,_that.resourceUsingFactor,_that.resourceCostPerDay,_that.totalResourceRowCost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int resourceId,  int resourcesQnt,  String divisionName,  String divisionShortName,  String divisionDescription,  String resourceName,  int resourceQnt,  int workDays,  double complexFactor,  double squareFactor,  double resourceUsingFactor,  double resourceCostPerDay,  double totalResourceRowCost)?  $default,) {final _that = this;
switch (_that) {
case _DivisionResourcePojo() when $default != null:
return $default(_that.id,_that.resourceId,_that.resourcesQnt,_that.divisionName,_that.divisionShortName,_that.divisionDescription,_that.resourceName,_that.resourceQnt,_that.workDays,_that.complexFactor,_that.squareFactor,_that.resourceUsingFactor,_that.resourceCostPerDay,_that.totalResourceRowCost);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DivisionResourcePojo implements DivisionResourcePojo {
  const _DivisionResourcePojo({required this.id, required this.resourceId, required this.resourcesQnt, required this.divisionName, required this.divisionShortName, required this.divisionDescription, required this.resourceName, required this.resourceQnt, required this.workDays, required this.complexFactor, required this.squareFactor, required this.resourceUsingFactor, required this.resourceCostPerDay, required this.totalResourceRowCost});
  factory _DivisionResourcePojo.fromJson(Map<String, dynamic> json) => _$DivisionResourcePojoFromJson(json);

@override final  int id;
@override final  int resourceId;
@override final  int resourcesQnt;
@override final  String divisionName;
@override final  String divisionShortName;
@override final  String divisionDescription;
@override final  String resourceName;
@override final  int resourceQnt;
@override final  int workDays;
@override final  double complexFactor;
@override final  double squareFactor;
@override final  double resourceUsingFactor;
@override final  double resourceCostPerDay;
@override final  double totalResourceRowCost;

/// Create a copy of DivisionResourcePojo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DivisionResourcePojoCopyWith<_DivisionResourcePojo> get copyWith => __$DivisionResourcePojoCopyWithImpl<_DivisionResourcePojo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DivisionResourcePojoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DivisionResourcePojo&&(identical(other.id, id) || other.id == id)&&(identical(other.resourceId, resourceId) || other.resourceId == resourceId)&&(identical(other.resourcesQnt, resourcesQnt) || other.resourcesQnt == resourcesQnt)&&(identical(other.divisionName, divisionName) || other.divisionName == divisionName)&&(identical(other.divisionShortName, divisionShortName) || other.divisionShortName == divisionShortName)&&(identical(other.divisionDescription, divisionDescription) || other.divisionDescription == divisionDescription)&&(identical(other.resourceName, resourceName) || other.resourceName == resourceName)&&(identical(other.resourceQnt, resourceQnt) || other.resourceQnt == resourceQnt)&&(identical(other.workDays, workDays) || other.workDays == workDays)&&(identical(other.complexFactor, complexFactor) || other.complexFactor == complexFactor)&&(identical(other.squareFactor, squareFactor) || other.squareFactor == squareFactor)&&(identical(other.resourceUsingFactor, resourceUsingFactor) || other.resourceUsingFactor == resourceUsingFactor)&&(identical(other.resourceCostPerDay, resourceCostPerDay) || other.resourceCostPerDay == resourceCostPerDay)&&(identical(other.totalResourceRowCost, totalResourceRowCost) || other.totalResourceRowCost == totalResourceRowCost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,resourceId,resourcesQnt,divisionName,divisionShortName,divisionDescription,resourceName,resourceQnt,workDays,complexFactor,squareFactor,resourceUsingFactor,resourceCostPerDay,totalResourceRowCost);

@override
String toString() {
  return 'DivisionResourcePojo(id: $id, resourceId: $resourceId, resourcesQnt: $resourcesQnt, divisionName: $divisionName, divisionShortName: $divisionShortName, divisionDescription: $divisionDescription, resourceName: $resourceName, resourceQnt: $resourceQnt, workDays: $workDays, complexFactor: $complexFactor, squareFactor: $squareFactor, resourceUsingFactor: $resourceUsingFactor, resourceCostPerDay: $resourceCostPerDay, totalResourceRowCost: $totalResourceRowCost)';
}


}

/// @nodoc
abstract mixin class _$DivisionResourcePojoCopyWith<$Res> implements $DivisionResourcePojoCopyWith<$Res> {
  factory _$DivisionResourcePojoCopyWith(_DivisionResourcePojo value, $Res Function(_DivisionResourcePojo) _then) = __$DivisionResourcePojoCopyWithImpl;
@override @useResult
$Res call({
 int id, int resourceId, int resourcesQnt, String divisionName, String divisionShortName, String divisionDescription, String resourceName, int resourceQnt, int workDays, double complexFactor, double squareFactor, double resourceUsingFactor, double resourceCostPerDay, double totalResourceRowCost
});




}
/// @nodoc
class __$DivisionResourcePojoCopyWithImpl<$Res>
    implements _$DivisionResourcePojoCopyWith<$Res> {
  __$DivisionResourcePojoCopyWithImpl(this._self, this._then);

  final _DivisionResourcePojo _self;
  final $Res Function(_DivisionResourcePojo) _then;

/// Create a copy of DivisionResourcePojo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? resourceId = null,Object? resourcesQnt = null,Object? divisionName = null,Object? divisionShortName = null,Object? divisionDescription = null,Object? resourceName = null,Object? resourceQnt = null,Object? workDays = null,Object? complexFactor = null,Object? squareFactor = null,Object? resourceUsingFactor = null,Object? resourceCostPerDay = null,Object? totalResourceRowCost = null,}) {
  return _then(_DivisionResourcePojo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,resourceId: null == resourceId ? _self.resourceId : resourceId // ignore: cast_nullable_to_non_nullable
as int,resourcesQnt: null == resourcesQnt ? _self.resourcesQnt : resourcesQnt // ignore: cast_nullable_to_non_nullable
as int,divisionName: null == divisionName ? _self.divisionName : divisionName // ignore: cast_nullable_to_non_nullable
as String,divisionShortName: null == divisionShortName ? _self.divisionShortName : divisionShortName // ignore: cast_nullable_to_non_nullable
as String,divisionDescription: null == divisionDescription ? _self.divisionDescription : divisionDescription // ignore: cast_nullable_to_non_nullable
as String,resourceName: null == resourceName ? _self.resourceName : resourceName // ignore: cast_nullable_to_non_nullable
as String,resourceQnt: null == resourceQnt ? _self.resourceQnt : resourceQnt // ignore: cast_nullable_to_non_nullable
as int,workDays: null == workDays ? _self.workDays : workDays // ignore: cast_nullable_to_non_nullable
as int,complexFactor: null == complexFactor ? _self.complexFactor : complexFactor // ignore: cast_nullable_to_non_nullable
as double,squareFactor: null == squareFactor ? _self.squareFactor : squareFactor // ignore: cast_nullable_to_non_nullable
as double,resourceUsingFactor: null == resourceUsingFactor ? _self.resourceUsingFactor : resourceUsingFactor // ignore: cast_nullable_to_non_nullable
as double,resourceCostPerDay: null == resourceCostPerDay ? _self.resourceCostPerDay : resourceCostPerDay // ignore: cast_nullable_to_non_nullable
as double,totalResourceRowCost: null == totalResourceRowCost ? _self.totalResourceRowCost : totalResourceRowCost // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$DivisionsMarginPojo {

 int get id; String get divisionName; String get divisionShortName; String get divisionDescription; double get resourceDivisionSummaryCost; double get overPriceValue; double get marginValue; double get clientValue; double get summaryCostWithMargin; double get summaryCostWithTax; double get taxValue;
/// Create a copy of DivisionsMarginPojo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DivisionsMarginPojoCopyWith<DivisionsMarginPojo> get copyWith => _$DivisionsMarginPojoCopyWithImpl<DivisionsMarginPojo>(this as DivisionsMarginPojo, _$identity);

  /// Serializes this DivisionsMarginPojo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DivisionsMarginPojo&&(identical(other.id, id) || other.id == id)&&(identical(other.divisionName, divisionName) || other.divisionName == divisionName)&&(identical(other.divisionShortName, divisionShortName) || other.divisionShortName == divisionShortName)&&(identical(other.divisionDescription, divisionDescription) || other.divisionDescription == divisionDescription)&&(identical(other.resourceDivisionSummaryCost, resourceDivisionSummaryCost) || other.resourceDivisionSummaryCost == resourceDivisionSummaryCost)&&(identical(other.overPriceValue, overPriceValue) || other.overPriceValue == overPriceValue)&&(identical(other.marginValue, marginValue) || other.marginValue == marginValue)&&(identical(other.clientValue, clientValue) || other.clientValue == clientValue)&&(identical(other.summaryCostWithMargin, summaryCostWithMargin) || other.summaryCostWithMargin == summaryCostWithMargin)&&(identical(other.summaryCostWithTax, summaryCostWithTax) || other.summaryCostWithTax == summaryCostWithTax)&&(identical(other.taxValue, taxValue) || other.taxValue == taxValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,divisionName,divisionShortName,divisionDescription,resourceDivisionSummaryCost,overPriceValue,marginValue,clientValue,summaryCostWithMargin,summaryCostWithTax,taxValue);

@override
String toString() {
  return 'DivisionsMarginPojo(id: $id, divisionName: $divisionName, divisionShortName: $divisionShortName, divisionDescription: $divisionDescription, resourceDivisionSummaryCost: $resourceDivisionSummaryCost, overPriceValue: $overPriceValue, marginValue: $marginValue, clientValue: $clientValue, summaryCostWithMargin: $summaryCostWithMargin, summaryCostWithTax: $summaryCostWithTax, taxValue: $taxValue)';
}


}

/// @nodoc
abstract mixin class $DivisionsMarginPojoCopyWith<$Res>  {
  factory $DivisionsMarginPojoCopyWith(DivisionsMarginPojo value, $Res Function(DivisionsMarginPojo) _then) = _$DivisionsMarginPojoCopyWithImpl;
@useResult
$Res call({
 int id, String divisionName, String divisionShortName, String divisionDescription, double resourceDivisionSummaryCost, double overPriceValue, double marginValue, double clientValue, double summaryCostWithMargin, double summaryCostWithTax, double taxValue
});




}
/// @nodoc
class _$DivisionsMarginPojoCopyWithImpl<$Res>
    implements $DivisionsMarginPojoCopyWith<$Res> {
  _$DivisionsMarginPojoCopyWithImpl(this._self, this._then);

  final DivisionsMarginPojo _self;
  final $Res Function(DivisionsMarginPojo) _then;

/// Create a copy of DivisionsMarginPojo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? divisionName = null,Object? divisionShortName = null,Object? divisionDescription = null,Object? resourceDivisionSummaryCost = null,Object? overPriceValue = null,Object? marginValue = null,Object? clientValue = null,Object? summaryCostWithMargin = null,Object? summaryCostWithTax = null,Object? taxValue = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,divisionName: null == divisionName ? _self.divisionName : divisionName // ignore: cast_nullable_to_non_nullable
as String,divisionShortName: null == divisionShortName ? _self.divisionShortName : divisionShortName // ignore: cast_nullable_to_non_nullable
as String,divisionDescription: null == divisionDescription ? _self.divisionDescription : divisionDescription // ignore: cast_nullable_to_non_nullable
as String,resourceDivisionSummaryCost: null == resourceDivisionSummaryCost ? _self.resourceDivisionSummaryCost : resourceDivisionSummaryCost // ignore: cast_nullable_to_non_nullable
as double,overPriceValue: null == overPriceValue ? _self.overPriceValue : overPriceValue // ignore: cast_nullable_to_non_nullable
as double,marginValue: null == marginValue ? _self.marginValue : marginValue // ignore: cast_nullable_to_non_nullable
as double,clientValue: null == clientValue ? _self.clientValue : clientValue // ignore: cast_nullable_to_non_nullable
as double,summaryCostWithMargin: null == summaryCostWithMargin ? _self.summaryCostWithMargin : summaryCostWithMargin // ignore: cast_nullable_to_non_nullable
as double,summaryCostWithTax: null == summaryCostWithTax ? _self.summaryCostWithTax : summaryCostWithTax // ignore: cast_nullable_to_non_nullable
as double,taxValue: null == taxValue ? _self.taxValue : taxValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DivisionsMarginPojo].
extension DivisionsMarginPojoPatterns on DivisionsMarginPojo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DivisionsMarginPojo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DivisionsMarginPojo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DivisionsMarginPojo value)  $default,){
final _that = this;
switch (_that) {
case _DivisionsMarginPojo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DivisionsMarginPojo value)?  $default,){
final _that = this;
switch (_that) {
case _DivisionsMarginPojo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String divisionName,  String divisionShortName,  String divisionDescription,  double resourceDivisionSummaryCost,  double overPriceValue,  double marginValue,  double clientValue,  double summaryCostWithMargin,  double summaryCostWithTax,  double taxValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DivisionsMarginPojo() when $default != null:
return $default(_that.id,_that.divisionName,_that.divisionShortName,_that.divisionDescription,_that.resourceDivisionSummaryCost,_that.overPriceValue,_that.marginValue,_that.clientValue,_that.summaryCostWithMargin,_that.summaryCostWithTax,_that.taxValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String divisionName,  String divisionShortName,  String divisionDescription,  double resourceDivisionSummaryCost,  double overPriceValue,  double marginValue,  double clientValue,  double summaryCostWithMargin,  double summaryCostWithTax,  double taxValue)  $default,) {final _that = this;
switch (_that) {
case _DivisionsMarginPojo():
return $default(_that.id,_that.divisionName,_that.divisionShortName,_that.divisionDescription,_that.resourceDivisionSummaryCost,_that.overPriceValue,_that.marginValue,_that.clientValue,_that.summaryCostWithMargin,_that.summaryCostWithTax,_that.taxValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String divisionName,  String divisionShortName,  String divisionDescription,  double resourceDivisionSummaryCost,  double overPriceValue,  double marginValue,  double clientValue,  double summaryCostWithMargin,  double summaryCostWithTax,  double taxValue)?  $default,) {final _that = this;
switch (_that) {
case _DivisionsMarginPojo() when $default != null:
return $default(_that.id,_that.divisionName,_that.divisionShortName,_that.divisionDescription,_that.resourceDivisionSummaryCost,_that.overPriceValue,_that.marginValue,_that.clientValue,_that.summaryCostWithMargin,_that.summaryCostWithTax,_that.taxValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DivisionsMarginPojo implements DivisionsMarginPojo {
  const _DivisionsMarginPojo({required this.id, required this.divisionName, required this.divisionShortName, required this.divisionDescription, required this.resourceDivisionSummaryCost, this.overPriceValue = 0.0, this.marginValue = 0.0, this.clientValue = 0.0, this.summaryCostWithMargin = 0.0, this.summaryCostWithTax = 0.0, this.taxValue = 0.0});
  factory _DivisionsMarginPojo.fromJson(Map<String, dynamic> json) => _$DivisionsMarginPojoFromJson(json);

@override final  int id;
@override final  String divisionName;
@override final  String divisionShortName;
@override final  String divisionDescription;
@override final  double resourceDivisionSummaryCost;
@override@JsonKey() final  double overPriceValue;
@override@JsonKey() final  double marginValue;
@override@JsonKey() final  double clientValue;
@override@JsonKey() final  double summaryCostWithMargin;
@override@JsonKey() final  double summaryCostWithTax;
@override@JsonKey() final  double taxValue;

/// Create a copy of DivisionsMarginPojo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DivisionsMarginPojoCopyWith<_DivisionsMarginPojo> get copyWith => __$DivisionsMarginPojoCopyWithImpl<_DivisionsMarginPojo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DivisionsMarginPojoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DivisionsMarginPojo&&(identical(other.id, id) || other.id == id)&&(identical(other.divisionName, divisionName) || other.divisionName == divisionName)&&(identical(other.divisionShortName, divisionShortName) || other.divisionShortName == divisionShortName)&&(identical(other.divisionDescription, divisionDescription) || other.divisionDescription == divisionDescription)&&(identical(other.resourceDivisionSummaryCost, resourceDivisionSummaryCost) || other.resourceDivisionSummaryCost == resourceDivisionSummaryCost)&&(identical(other.overPriceValue, overPriceValue) || other.overPriceValue == overPriceValue)&&(identical(other.marginValue, marginValue) || other.marginValue == marginValue)&&(identical(other.clientValue, clientValue) || other.clientValue == clientValue)&&(identical(other.summaryCostWithMargin, summaryCostWithMargin) || other.summaryCostWithMargin == summaryCostWithMargin)&&(identical(other.summaryCostWithTax, summaryCostWithTax) || other.summaryCostWithTax == summaryCostWithTax)&&(identical(other.taxValue, taxValue) || other.taxValue == taxValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,divisionName,divisionShortName,divisionDescription,resourceDivisionSummaryCost,overPriceValue,marginValue,clientValue,summaryCostWithMargin,summaryCostWithTax,taxValue);

@override
String toString() {
  return 'DivisionsMarginPojo(id: $id, divisionName: $divisionName, divisionShortName: $divisionShortName, divisionDescription: $divisionDescription, resourceDivisionSummaryCost: $resourceDivisionSummaryCost, overPriceValue: $overPriceValue, marginValue: $marginValue, clientValue: $clientValue, summaryCostWithMargin: $summaryCostWithMargin, summaryCostWithTax: $summaryCostWithTax, taxValue: $taxValue)';
}


}

/// @nodoc
abstract mixin class _$DivisionsMarginPojoCopyWith<$Res> implements $DivisionsMarginPojoCopyWith<$Res> {
  factory _$DivisionsMarginPojoCopyWith(_DivisionsMarginPojo value, $Res Function(_DivisionsMarginPojo) _then) = __$DivisionsMarginPojoCopyWithImpl;
@override @useResult
$Res call({
 int id, String divisionName, String divisionShortName, String divisionDescription, double resourceDivisionSummaryCost, double overPriceValue, double marginValue, double clientValue, double summaryCostWithMargin, double summaryCostWithTax, double taxValue
});




}
/// @nodoc
class __$DivisionsMarginPojoCopyWithImpl<$Res>
    implements _$DivisionsMarginPojoCopyWith<$Res> {
  __$DivisionsMarginPojoCopyWithImpl(this._self, this._then);

  final _DivisionsMarginPojo _self;
  final $Res Function(_DivisionsMarginPojo) _then;

/// Create a copy of DivisionsMarginPojo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? divisionName = null,Object? divisionShortName = null,Object? divisionDescription = null,Object? resourceDivisionSummaryCost = null,Object? overPriceValue = null,Object? marginValue = null,Object? clientValue = null,Object? summaryCostWithMargin = null,Object? summaryCostWithTax = null,Object? taxValue = null,}) {
  return _then(_DivisionsMarginPojo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,divisionName: null == divisionName ? _self.divisionName : divisionName // ignore: cast_nullable_to_non_nullable
as String,divisionShortName: null == divisionShortName ? _self.divisionShortName : divisionShortName // ignore: cast_nullable_to_non_nullable
as String,divisionDescription: null == divisionDescription ? _self.divisionDescription : divisionDescription // ignore: cast_nullable_to_non_nullable
as String,resourceDivisionSummaryCost: null == resourceDivisionSummaryCost ? _self.resourceDivisionSummaryCost : resourceDivisionSummaryCost // ignore: cast_nullable_to_non_nullable
as double,overPriceValue: null == overPriceValue ? _self.overPriceValue : overPriceValue // ignore: cast_nullable_to_non_nullable
as double,marginValue: null == marginValue ? _self.marginValue : marginValue // ignore: cast_nullable_to_non_nullable
as double,clientValue: null == clientValue ? _self.clientValue : clientValue // ignore: cast_nullable_to_non_nullable
as double,summaryCostWithMargin: null == summaryCostWithMargin ? _self.summaryCostWithMargin : summaryCostWithMargin // ignore: cast_nullable_to_non_nullable
as double,summaryCostWithTax: null == summaryCostWithTax ? _self.summaryCostWithTax : summaryCostWithTax // ignore: cast_nullable_to_non_nullable
as double,taxValue: null == taxValue ? _self.taxValue : taxValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
