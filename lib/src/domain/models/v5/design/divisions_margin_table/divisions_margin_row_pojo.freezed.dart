// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'divisions_margin_row_pojo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DivisionsMarginRowPojo {

 int get id; String get divisionName; String get divisionShortName; double get divisionSummaryCost; double get overPrice; double get margin; double get client; double get summaryCostWithMargin; double get summaryCostWithTax;
/// Create a copy of DivisionsMarginRowPojo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DivisionsMarginRowPojoCopyWith<DivisionsMarginRowPojo> get copyWith => _$DivisionsMarginRowPojoCopyWithImpl<DivisionsMarginRowPojo>(this as DivisionsMarginRowPojo, _$identity);

  /// Serializes this DivisionsMarginRowPojo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DivisionsMarginRowPojo&&(identical(other.id, id) || other.id == id)&&(identical(other.divisionName, divisionName) || other.divisionName == divisionName)&&(identical(other.divisionShortName, divisionShortName) || other.divisionShortName == divisionShortName)&&(identical(other.divisionSummaryCost, divisionSummaryCost) || other.divisionSummaryCost == divisionSummaryCost)&&(identical(other.overPrice, overPrice) || other.overPrice == overPrice)&&(identical(other.margin, margin) || other.margin == margin)&&(identical(other.client, client) || other.client == client)&&(identical(other.summaryCostWithMargin, summaryCostWithMargin) || other.summaryCostWithMargin == summaryCostWithMargin)&&(identical(other.summaryCostWithTax, summaryCostWithTax) || other.summaryCostWithTax == summaryCostWithTax));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,divisionName,divisionShortName,divisionSummaryCost,overPrice,margin,client,summaryCostWithMargin,summaryCostWithTax);

@override
String toString() {
  return 'DivisionsMarginRowPojo(id: $id, divisionName: $divisionName, divisionShortName: $divisionShortName, divisionSummaryCost: $divisionSummaryCost, overPrice: $overPrice, margin: $margin, client: $client, summaryCostWithMargin: $summaryCostWithMargin, summaryCostWithTax: $summaryCostWithTax)';
}


}

/// @nodoc
abstract mixin class $DivisionsMarginRowPojoCopyWith<$Res>  {
  factory $DivisionsMarginRowPojoCopyWith(DivisionsMarginRowPojo value, $Res Function(DivisionsMarginRowPojo) _then) = _$DivisionsMarginRowPojoCopyWithImpl;
@useResult
$Res call({
 int id, String divisionName, String divisionShortName, double divisionSummaryCost, double overPrice, double margin, double client, double summaryCostWithMargin, double summaryCostWithTax
});




}
/// @nodoc
class _$DivisionsMarginRowPojoCopyWithImpl<$Res>
    implements $DivisionsMarginRowPojoCopyWith<$Res> {
  _$DivisionsMarginRowPojoCopyWithImpl(this._self, this._then);

  final DivisionsMarginRowPojo _self;
  final $Res Function(DivisionsMarginRowPojo) _then;

/// Create a copy of DivisionsMarginRowPojo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? divisionName = null,Object? divisionShortName = null,Object? divisionSummaryCost = null,Object? overPrice = null,Object? margin = null,Object? client = null,Object? summaryCostWithMargin = null,Object? summaryCostWithTax = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,divisionName: null == divisionName ? _self.divisionName : divisionName // ignore: cast_nullable_to_non_nullable
as String,divisionShortName: null == divisionShortName ? _self.divisionShortName : divisionShortName // ignore: cast_nullable_to_non_nullable
as String,divisionSummaryCost: null == divisionSummaryCost ? _self.divisionSummaryCost : divisionSummaryCost // ignore: cast_nullable_to_non_nullable
as double,overPrice: null == overPrice ? _self.overPrice : overPrice // ignore: cast_nullable_to_non_nullable
as double,margin: null == margin ? _self.margin : margin // ignore: cast_nullable_to_non_nullable
as double,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as double,summaryCostWithMargin: null == summaryCostWithMargin ? _self.summaryCostWithMargin : summaryCostWithMargin // ignore: cast_nullable_to_non_nullable
as double,summaryCostWithTax: null == summaryCostWithTax ? _self.summaryCostWithTax : summaryCostWithTax // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DivisionsMarginRowPojo].
extension DivisionsMarginRowPojoPatterns on DivisionsMarginRowPojo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DivisionsMarginRowPojo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DivisionsMarginRowPojo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DivisionsMarginRowPojo value)  $default,){
final _that = this;
switch (_that) {
case _DivisionsMarginRowPojo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DivisionsMarginRowPojo value)?  $default,){
final _that = this;
switch (_that) {
case _DivisionsMarginRowPojo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String divisionName,  String divisionShortName,  double divisionSummaryCost,  double overPrice,  double margin,  double client,  double summaryCostWithMargin,  double summaryCostWithTax)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DivisionsMarginRowPojo() when $default != null:
return $default(_that.id,_that.divisionName,_that.divisionShortName,_that.divisionSummaryCost,_that.overPrice,_that.margin,_that.client,_that.summaryCostWithMargin,_that.summaryCostWithTax);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String divisionName,  String divisionShortName,  double divisionSummaryCost,  double overPrice,  double margin,  double client,  double summaryCostWithMargin,  double summaryCostWithTax)  $default,) {final _that = this;
switch (_that) {
case _DivisionsMarginRowPojo():
return $default(_that.id,_that.divisionName,_that.divisionShortName,_that.divisionSummaryCost,_that.overPrice,_that.margin,_that.client,_that.summaryCostWithMargin,_that.summaryCostWithTax);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String divisionName,  String divisionShortName,  double divisionSummaryCost,  double overPrice,  double margin,  double client,  double summaryCostWithMargin,  double summaryCostWithTax)?  $default,) {final _that = this;
switch (_that) {
case _DivisionsMarginRowPojo() when $default != null:
return $default(_that.id,_that.divisionName,_that.divisionShortName,_that.divisionSummaryCost,_that.overPrice,_that.margin,_that.client,_that.summaryCostWithMargin,_that.summaryCostWithTax);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DivisionsMarginRowPojo implements DivisionsMarginRowPojo {
  const _DivisionsMarginRowPojo({required this.id, required this.divisionName, required this.divisionShortName, required this.divisionSummaryCost, required this.overPrice, required this.margin, required this.client, required this.summaryCostWithMargin, required this.summaryCostWithTax});
  factory _DivisionsMarginRowPojo.fromJson(Map<String, dynamic> json) => _$DivisionsMarginRowPojoFromJson(json);

@override final  int id;
@override final  String divisionName;
@override final  String divisionShortName;
@override final  double divisionSummaryCost;
@override final  double overPrice;
@override final  double margin;
@override final  double client;
@override final  double summaryCostWithMargin;
@override final  double summaryCostWithTax;

/// Create a copy of DivisionsMarginRowPojo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DivisionsMarginRowPojoCopyWith<_DivisionsMarginRowPojo> get copyWith => __$DivisionsMarginRowPojoCopyWithImpl<_DivisionsMarginRowPojo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DivisionsMarginRowPojoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DivisionsMarginRowPojo&&(identical(other.id, id) || other.id == id)&&(identical(other.divisionName, divisionName) || other.divisionName == divisionName)&&(identical(other.divisionShortName, divisionShortName) || other.divisionShortName == divisionShortName)&&(identical(other.divisionSummaryCost, divisionSummaryCost) || other.divisionSummaryCost == divisionSummaryCost)&&(identical(other.overPrice, overPrice) || other.overPrice == overPrice)&&(identical(other.margin, margin) || other.margin == margin)&&(identical(other.client, client) || other.client == client)&&(identical(other.summaryCostWithMargin, summaryCostWithMargin) || other.summaryCostWithMargin == summaryCostWithMargin)&&(identical(other.summaryCostWithTax, summaryCostWithTax) || other.summaryCostWithTax == summaryCostWithTax));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,divisionName,divisionShortName,divisionSummaryCost,overPrice,margin,client,summaryCostWithMargin,summaryCostWithTax);

@override
String toString() {
  return 'DivisionsMarginRowPojo(id: $id, divisionName: $divisionName, divisionShortName: $divisionShortName, divisionSummaryCost: $divisionSummaryCost, overPrice: $overPrice, margin: $margin, client: $client, summaryCostWithMargin: $summaryCostWithMargin, summaryCostWithTax: $summaryCostWithTax)';
}


}

/// @nodoc
abstract mixin class _$DivisionsMarginRowPojoCopyWith<$Res> implements $DivisionsMarginRowPojoCopyWith<$Res> {
  factory _$DivisionsMarginRowPojoCopyWith(_DivisionsMarginRowPojo value, $Res Function(_DivisionsMarginRowPojo) _then) = __$DivisionsMarginRowPojoCopyWithImpl;
@override @useResult
$Res call({
 int id, String divisionName, String divisionShortName, double divisionSummaryCost, double overPrice, double margin, double client, double summaryCostWithMargin, double summaryCostWithTax
});




}
/// @nodoc
class __$DivisionsMarginRowPojoCopyWithImpl<$Res>
    implements _$DivisionsMarginRowPojoCopyWith<$Res> {
  __$DivisionsMarginRowPojoCopyWithImpl(this._self, this._then);

  final _DivisionsMarginRowPojo _self;
  final $Res Function(_DivisionsMarginRowPojo) _then;

/// Create a copy of DivisionsMarginRowPojo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? divisionName = null,Object? divisionShortName = null,Object? divisionSummaryCost = null,Object? overPrice = null,Object? margin = null,Object? client = null,Object? summaryCostWithMargin = null,Object? summaryCostWithTax = null,}) {
  return _then(_DivisionsMarginRowPojo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,divisionName: null == divisionName ? _self.divisionName : divisionName // ignore: cast_nullable_to_non_nullable
as String,divisionShortName: null == divisionShortName ? _self.divisionShortName : divisionShortName // ignore: cast_nullable_to_non_nullable
as String,divisionSummaryCost: null == divisionSummaryCost ? _self.divisionSummaryCost : divisionSummaryCost // ignore: cast_nullable_to_non_nullable
as double,overPrice: null == overPrice ? _self.overPrice : overPrice // ignore: cast_nullable_to_non_nullable
as double,margin: null == margin ? _self.margin : margin // ignore: cast_nullable_to_non_nullable
as double,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as double,summaryCostWithMargin: null == summaryCostWithMargin ? _self.summaryCostWithMargin : summaryCostWithMargin // ignore: cast_nullable_to_non_nullable
as double,summaryCostWithTax: null == summaryCostWithTax ? _self.summaryCostWithTax : summaryCostWithTax // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
