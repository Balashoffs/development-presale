// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'divisions_result_pojo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DivisionsResultPojo {

 int get id; String get divisionName; String get divisionShortName; String get divisionDescription; double get resultValue; double get summaryCostWithTax; double get taxValue;
/// Create a copy of DivisionsResultPojo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DivisionsResultPojoCopyWith<DivisionsResultPojo> get copyWith => _$DivisionsResultPojoCopyWithImpl<DivisionsResultPojo>(this as DivisionsResultPojo, _$identity);

  /// Serializes this DivisionsResultPojo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DivisionsResultPojo&&(identical(other.id, id) || other.id == id)&&(identical(other.divisionName, divisionName) || other.divisionName == divisionName)&&(identical(other.divisionShortName, divisionShortName) || other.divisionShortName == divisionShortName)&&(identical(other.divisionDescription, divisionDescription) || other.divisionDescription == divisionDescription)&&(identical(other.resultValue, resultValue) || other.resultValue == resultValue)&&(identical(other.summaryCostWithTax, summaryCostWithTax) || other.summaryCostWithTax == summaryCostWithTax)&&(identical(other.taxValue, taxValue) || other.taxValue == taxValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,divisionName,divisionShortName,divisionDescription,resultValue,summaryCostWithTax,taxValue);

@override
String toString() {
  return 'DivisionsResultPojo(id: $id, divisionName: $divisionName, divisionShortName: $divisionShortName, divisionDescription: $divisionDescription, resultValue: $resultValue, summaryCostWithTax: $summaryCostWithTax, taxValue: $taxValue)';
}


}

/// @nodoc
abstract mixin class $DivisionsResultPojoCopyWith<$Res>  {
  factory $DivisionsResultPojoCopyWith(DivisionsResultPojo value, $Res Function(DivisionsResultPojo) _then) = _$DivisionsResultPojoCopyWithImpl;
@useResult
$Res call({
 int id, String divisionName, String divisionShortName, String divisionDescription, double resultValue, double summaryCostWithTax, double taxValue
});




}
/// @nodoc
class _$DivisionsResultPojoCopyWithImpl<$Res>
    implements $DivisionsResultPojoCopyWith<$Res> {
  _$DivisionsResultPojoCopyWithImpl(this._self, this._then);

  final DivisionsResultPojo _self;
  final $Res Function(DivisionsResultPojo) _then;

/// Create a copy of DivisionsResultPojo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? divisionName = null,Object? divisionShortName = null,Object? divisionDescription = null,Object? resultValue = null,Object? summaryCostWithTax = null,Object? taxValue = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,divisionName: null == divisionName ? _self.divisionName : divisionName // ignore: cast_nullable_to_non_nullable
as String,divisionShortName: null == divisionShortName ? _self.divisionShortName : divisionShortName // ignore: cast_nullable_to_non_nullable
as String,divisionDescription: null == divisionDescription ? _self.divisionDescription : divisionDescription // ignore: cast_nullable_to_non_nullable
as String,resultValue: null == resultValue ? _self.resultValue : resultValue // ignore: cast_nullable_to_non_nullable
as double,summaryCostWithTax: null == summaryCostWithTax ? _self.summaryCostWithTax : summaryCostWithTax // ignore: cast_nullable_to_non_nullable
as double,taxValue: null == taxValue ? _self.taxValue : taxValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DivisionsResultPojo].
extension DivisionsResultPojoPatterns on DivisionsResultPojo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DivisionsResultPojo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DivisionsResultPojo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DivisionsResultPojo value)  $default,){
final _that = this;
switch (_that) {
case _DivisionsResultPojo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DivisionsResultPojo value)?  $default,){
final _that = this;
switch (_that) {
case _DivisionsResultPojo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String divisionName,  String divisionShortName,  String divisionDescription,  double resultValue,  double summaryCostWithTax,  double taxValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DivisionsResultPojo() when $default != null:
return $default(_that.id,_that.divisionName,_that.divisionShortName,_that.divisionDescription,_that.resultValue,_that.summaryCostWithTax,_that.taxValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String divisionName,  String divisionShortName,  String divisionDescription,  double resultValue,  double summaryCostWithTax,  double taxValue)  $default,) {final _that = this;
switch (_that) {
case _DivisionsResultPojo():
return $default(_that.id,_that.divisionName,_that.divisionShortName,_that.divisionDescription,_that.resultValue,_that.summaryCostWithTax,_that.taxValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String divisionName,  String divisionShortName,  String divisionDescription,  double resultValue,  double summaryCostWithTax,  double taxValue)?  $default,) {final _that = this;
switch (_that) {
case _DivisionsResultPojo() when $default != null:
return $default(_that.id,_that.divisionName,_that.divisionShortName,_that.divisionDescription,_that.resultValue,_that.summaryCostWithTax,_that.taxValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DivisionsResultPojo implements DivisionsResultPojo {
  const _DivisionsResultPojo({required this.id, required this.divisionName, required this.divisionShortName, required this.divisionDescription, required this.resultValue, required this.summaryCostWithTax, required this.taxValue});
  factory _DivisionsResultPojo.fromJson(Map<String, dynamic> json) => _$DivisionsResultPojoFromJson(json);

@override final  int id;
@override final  String divisionName;
@override final  String divisionShortName;
@override final  String divisionDescription;
@override final  double resultValue;
@override final  double summaryCostWithTax;
@override final  double taxValue;

/// Create a copy of DivisionsResultPojo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DivisionsResultPojoCopyWith<_DivisionsResultPojo> get copyWith => __$DivisionsResultPojoCopyWithImpl<_DivisionsResultPojo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DivisionsResultPojoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DivisionsResultPojo&&(identical(other.id, id) || other.id == id)&&(identical(other.divisionName, divisionName) || other.divisionName == divisionName)&&(identical(other.divisionShortName, divisionShortName) || other.divisionShortName == divisionShortName)&&(identical(other.divisionDescription, divisionDescription) || other.divisionDescription == divisionDescription)&&(identical(other.resultValue, resultValue) || other.resultValue == resultValue)&&(identical(other.summaryCostWithTax, summaryCostWithTax) || other.summaryCostWithTax == summaryCostWithTax)&&(identical(other.taxValue, taxValue) || other.taxValue == taxValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,divisionName,divisionShortName,divisionDescription,resultValue,summaryCostWithTax,taxValue);

@override
String toString() {
  return 'DivisionsResultPojo(id: $id, divisionName: $divisionName, divisionShortName: $divisionShortName, divisionDescription: $divisionDescription, resultValue: $resultValue, summaryCostWithTax: $summaryCostWithTax, taxValue: $taxValue)';
}


}

/// @nodoc
abstract mixin class _$DivisionsResultPojoCopyWith<$Res> implements $DivisionsResultPojoCopyWith<$Res> {
  factory _$DivisionsResultPojoCopyWith(_DivisionsResultPojo value, $Res Function(_DivisionsResultPojo) _then) = __$DivisionsResultPojoCopyWithImpl;
@override @useResult
$Res call({
 int id, String divisionName, String divisionShortName, String divisionDescription, double resultValue, double summaryCostWithTax, double taxValue
});




}
/// @nodoc
class __$DivisionsResultPojoCopyWithImpl<$Res>
    implements _$DivisionsResultPojoCopyWith<$Res> {
  __$DivisionsResultPojoCopyWithImpl(this._self, this._then);

  final _DivisionsResultPojo _self;
  final $Res Function(_DivisionsResultPojo) _then;

/// Create a copy of DivisionsResultPojo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? divisionName = null,Object? divisionShortName = null,Object? divisionDescription = null,Object? resultValue = null,Object? summaryCostWithTax = null,Object? taxValue = null,}) {
  return _then(_DivisionsResultPojo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,divisionName: null == divisionName ? _self.divisionName : divisionName // ignore: cast_nullable_to_non_nullable
as String,divisionShortName: null == divisionShortName ? _self.divisionShortName : divisionShortName // ignore: cast_nullable_to_non_nullable
as String,divisionDescription: null == divisionDescription ? _self.divisionDescription : divisionDescription // ignore: cast_nullable_to_non_nullable
as String,resultValue: null == resultValue ? _self.resultValue : resultValue // ignore: cast_nullable_to_non_nullable
as double,summaryCostWithTax: null == summaryCostWithTax ? _self.summaryCostWithTax : summaryCostWithTax // ignore: cast_nullable_to_non_nullable
as double,taxValue: null == taxValue ? _self.taxValue : taxValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
