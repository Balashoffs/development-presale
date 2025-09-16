// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'input_data_design.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InputDataDesign {

// Дата и время создание КП
 OfferDayCounterPojo get offerCounter;// Данные об объекте
 ObjectDataDesign get objectData; InputFactorsPojo get inputFactors;// Тип проектной документации на выходе
 DivisionType get divisionType;
/// Create a copy of InputDataDesign
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InputDataDesignCopyWith<InputDataDesign> get copyWith => _$InputDataDesignCopyWithImpl<InputDataDesign>(this as InputDataDesign, _$identity);

  /// Serializes this InputDataDesign to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InputDataDesign&&(identical(other.offerCounter, offerCounter) || other.offerCounter == offerCounter)&&(identical(other.objectData, objectData) || other.objectData == objectData)&&(identical(other.inputFactors, inputFactors) || other.inputFactors == inputFactors)&&(identical(other.divisionType, divisionType) || other.divisionType == divisionType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,offerCounter,objectData,inputFactors,divisionType);

@override
String toString() {
  return 'InputDataDesign(offerCounter: $offerCounter, objectData: $objectData, inputFactors: $inputFactors, divisionType: $divisionType)';
}


}

/// @nodoc
abstract mixin class $InputDataDesignCopyWith<$Res>  {
  factory $InputDataDesignCopyWith(InputDataDesign value, $Res Function(InputDataDesign) _then) = _$InputDataDesignCopyWithImpl;
@useResult
$Res call({
 OfferDayCounterPojo offerCounter, ObjectDataDesign objectData, InputFactorsPojo inputFactors, DivisionType divisionType
});


$OfferDayCounterPojoCopyWith<$Res> get offerCounter;$ObjectDataDesignCopyWith<$Res> get objectData;$InputFactorsPojoCopyWith<$Res> get inputFactors;

}
/// @nodoc
class _$InputDataDesignCopyWithImpl<$Res>
    implements $InputDataDesignCopyWith<$Res> {
  _$InputDataDesignCopyWithImpl(this._self, this._then);

  final InputDataDesign _self;
  final $Res Function(InputDataDesign) _then;

/// Create a copy of InputDataDesign
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? offerCounter = null,Object? objectData = null,Object? inputFactors = null,Object? divisionType = null,}) {
  return _then(_self.copyWith(
offerCounter: null == offerCounter ? _self.offerCounter : offerCounter // ignore: cast_nullable_to_non_nullable
as OfferDayCounterPojo,objectData: null == objectData ? _self.objectData : objectData // ignore: cast_nullable_to_non_nullable
as ObjectDataDesign,inputFactors: null == inputFactors ? _self.inputFactors : inputFactors // ignore: cast_nullable_to_non_nullable
as InputFactorsPojo,divisionType: null == divisionType ? _self.divisionType : divisionType // ignore: cast_nullable_to_non_nullable
as DivisionType,
  ));
}
/// Create a copy of InputDataDesign
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfferDayCounterPojoCopyWith<$Res> get offerCounter {
  
  return $OfferDayCounterPojoCopyWith<$Res>(_self.offerCounter, (value) {
    return _then(_self.copyWith(offerCounter: value));
  });
}/// Create a copy of InputDataDesign
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ObjectDataDesignCopyWith<$Res> get objectData {
  
  return $ObjectDataDesignCopyWith<$Res>(_self.objectData, (value) {
    return _then(_self.copyWith(objectData: value));
  });
}/// Create a copy of InputDataDesign
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InputFactorsPojoCopyWith<$Res> get inputFactors {
  
  return $InputFactorsPojoCopyWith<$Res>(_self.inputFactors, (value) {
    return _then(_self.copyWith(inputFactors: value));
  });
}
}


/// Adds pattern-matching-related methods to [InputDataDesign].
extension InputDataDesignPatterns on InputDataDesign {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InputDataDesign value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InputDataDesign() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InputDataDesign value)  $default,){
final _that = this;
switch (_that) {
case _InputDataDesign():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InputDataDesign value)?  $default,){
final _that = this;
switch (_that) {
case _InputDataDesign() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OfferDayCounterPojo offerCounter,  ObjectDataDesign objectData,  InputFactorsPojo inputFactors,  DivisionType divisionType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InputDataDesign() when $default != null:
return $default(_that.offerCounter,_that.objectData,_that.inputFactors,_that.divisionType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OfferDayCounterPojo offerCounter,  ObjectDataDesign objectData,  InputFactorsPojo inputFactors,  DivisionType divisionType)  $default,) {final _that = this;
switch (_that) {
case _InputDataDesign():
return $default(_that.offerCounter,_that.objectData,_that.inputFactors,_that.divisionType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OfferDayCounterPojo offerCounter,  ObjectDataDesign objectData,  InputFactorsPojo inputFactors,  DivisionType divisionType)?  $default,) {final _that = this;
switch (_that) {
case _InputDataDesign() when $default != null:
return $default(_that.offerCounter,_that.objectData,_that.inputFactors,_that.divisionType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InputDataDesign implements InputDataDesign {
  const _InputDataDesign({required this.offerCounter, required this.objectData, required this.inputFactors, required this.divisionType});
  factory _InputDataDesign.fromJson(Map<String, dynamic> json) => _$InputDataDesignFromJson(json);

// Дата и время создание КП
@override final  OfferDayCounterPojo offerCounter;
// Данные об объекте
@override final  ObjectDataDesign objectData;
@override final  InputFactorsPojo inputFactors;
// Тип проектной документации на выходе
@override final  DivisionType divisionType;

/// Create a copy of InputDataDesign
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InputDataDesignCopyWith<_InputDataDesign> get copyWith => __$InputDataDesignCopyWithImpl<_InputDataDesign>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InputDataDesignToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InputDataDesign&&(identical(other.offerCounter, offerCounter) || other.offerCounter == offerCounter)&&(identical(other.objectData, objectData) || other.objectData == objectData)&&(identical(other.inputFactors, inputFactors) || other.inputFactors == inputFactors)&&(identical(other.divisionType, divisionType) || other.divisionType == divisionType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,offerCounter,objectData,inputFactors,divisionType);

@override
String toString() {
  return 'InputDataDesign(offerCounter: $offerCounter, objectData: $objectData, inputFactors: $inputFactors, divisionType: $divisionType)';
}


}

/// @nodoc
abstract mixin class _$InputDataDesignCopyWith<$Res> implements $InputDataDesignCopyWith<$Res> {
  factory _$InputDataDesignCopyWith(_InputDataDesign value, $Res Function(_InputDataDesign) _then) = __$InputDataDesignCopyWithImpl;
@override @useResult
$Res call({
 OfferDayCounterPojo offerCounter, ObjectDataDesign objectData, InputFactorsPojo inputFactors, DivisionType divisionType
});


@override $OfferDayCounterPojoCopyWith<$Res> get offerCounter;@override $ObjectDataDesignCopyWith<$Res> get objectData;@override $InputFactorsPojoCopyWith<$Res> get inputFactors;

}
/// @nodoc
class __$InputDataDesignCopyWithImpl<$Res>
    implements _$InputDataDesignCopyWith<$Res> {
  __$InputDataDesignCopyWithImpl(this._self, this._then);

  final _InputDataDesign _self;
  final $Res Function(_InputDataDesign) _then;

/// Create a copy of InputDataDesign
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? offerCounter = null,Object? objectData = null,Object? inputFactors = null,Object? divisionType = null,}) {
  return _then(_InputDataDesign(
offerCounter: null == offerCounter ? _self.offerCounter : offerCounter // ignore: cast_nullable_to_non_nullable
as OfferDayCounterPojo,objectData: null == objectData ? _self.objectData : objectData // ignore: cast_nullable_to_non_nullable
as ObjectDataDesign,inputFactors: null == inputFactors ? _self.inputFactors : inputFactors // ignore: cast_nullable_to_non_nullable
as InputFactorsPojo,divisionType: null == divisionType ? _self.divisionType : divisionType // ignore: cast_nullable_to_non_nullable
as DivisionType,
  ));
}

/// Create a copy of InputDataDesign
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfferDayCounterPojoCopyWith<$Res> get offerCounter {
  
  return $OfferDayCounterPojoCopyWith<$Res>(_self.offerCounter, (value) {
    return _then(_self.copyWith(offerCounter: value));
  });
}/// Create a copy of InputDataDesign
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ObjectDataDesignCopyWith<$Res> get objectData {
  
  return $ObjectDataDesignCopyWith<$Res>(_self.objectData, (value) {
    return _then(_self.copyWith(objectData: value));
  });
}/// Create a copy of InputDataDesign
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InputFactorsPojoCopyWith<$Res> get inputFactors {
  
  return $InputFactorsPojoCopyWith<$Res>(_self.inputFactors, (value) {
    return _then(_self.copyWith(inputFactors: value));
  });
}
}

// dart format on
